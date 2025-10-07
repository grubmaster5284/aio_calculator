import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/currency_conversion/application/state/currency_state.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/core/data_state.dart';

/// StateNotifier for managing currency conversion state
class CurrencyNotifier extends StateNotifier<CurrencyState> {
  final ICurrencyRepository _repository;

  CurrencyNotifier(this._repository) : super(CurrencyState.initial());

  /// Load initial data (supported currencies and default rate)
  /// This method initializes the cache with fresh data from API service
  Future<void> loadInitial() async {
    developer.log('[CurrencyNotifier] Loading initial data and initializing cache...', name: 'CurrencyNotifier');
    
    // First, initialize cache with fresh data from API
    final cacheResult = await _repository.initializeCache();
    if (cacheResult.isSuccess) {
      developer.log('[CurrencyNotifier] Cache initialized successfully', name: 'CurrencyNotifier');
    } else {
      developer.log('[CurrencyNotifier] Cache initialization failed: ${cacheResult.error}', name: 'CurrencyNotifier');
    }
    
    // Then load data (will use cached data if available)
    await Future.wait([
      _loadSupportedCurrencies(),
      _loadRate(),
    ]);
    developer.log('[CurrencyNotifier] Initial data loaded', name: 'CurrencyNotifier');
  }

  /// Set the from currency
  void setFromCurrency(String currency) {
    if (state.selectedFromCurrency == currency) return;
    
    developer.log('[CurrencyNotifier] Setting from currency to: $currency', name: 'CurrencyNotifier');
    state = state.copyWith(
      selectedFromCurrency: currency,
      conversionState: const DataState.initial(),
    );
    
    // Load new rate for the selected currency pair
    _loadRate();
  }

  /// Set the to currency
  void setToCurrency(String currency) {
    if (state.selectedToCurrency == currency) return;
    
    developer.log('[CurrencyNotifier] Setting to currency to: $currency', name: 'CurrencyNotifier');
    state = state.copyWith(
      selectedToCurrency: currency,
      conversionState: const DataState.initial(),
    );
    
    // Load new rate for the selected currency pair
    _loadRate();
  }

  /// Swap the from and to currencies
  void swapCurrencies() {
    if (state.isSwapping) return;
    
    state = state.copyWith(
      isSwapping: true,
      selectedFromCurrency: state.selectedToCurrency,
      selectedToCurrency: state.selectedFromCurrency,
      conversionState: const DataState.initial(),
    );
    
    // Load new rate for the swapped currency pair
    _loadRate().then((_) {
      state = state.copyWith(isSwapping: false);
    });
  }

  /// Set the amount input
  void setAmount(String amount) {
    developer.log('[CurrencyNotifier] Setting amount to: $amount', name: 'CurrencyNotifier');
    state = state.copyWith(
      amountInput: amount,
      conversionState: const DataState.initial(),
    );
  }

  /// Convert currency with current inputs using cached data (offline mode)
  Future<void> convert() async {
    developer.log('[CurrencyNotifier] Convert called - canConvert: ${state.canConvert}, parsedAmount: ${state.parsedAmount}', name: 'CurrencyNotifier');
    if (!state.canConvert || state.parsedAmount == null) {
      developer.log('[CurrencyNotifier] Cannot convert - missing requirements', name: 'CurrencyNotifier');
      return;
    }
    
    developer.log('[CurrencyNotifier] Starting offline conversion from ${state.selectedFromCurrency} to ${state.selectedToCurrency} for amount ${state.parsedAmount}', name: 'CurrencyNotifier');
    state = state.copyWith(
      conversionState: const DataState.loading(),
    );
    
    // Try offline conversion first (using cached data)
    final result = await _repository.convertOffline(
      from: CurrencyCode(state.selectedFromCurrency),
      to: CurrencyCode(state.selectedToCurrency),
      amount: state.parsedAmount!,
    );
    
    developer.log('[CurrencyNotifier] Offline conversion result - isSuccess: ${result.isSuccess}', name: 'CurrencyNotifier');
    if (result.isSuccess) {
      developer.log('[CurrencyNotifier] Offline conversion successful: ${result.value}', name: 'CurrencyNotifier');
      state = state.copyWith(
        conversionState: DataState.success(value: result.value!),
      );
    } else {
      developer.log('[CurrencyNotifier] Offline conversion failed, trying online conversion: ${result.error}', name: 'CurrencyNotifier');
      // Fallback to online conversion if offline fails
      final onlineResult = await _repository.convert(
        from: CurrencyCode(state.selectedFromCurrency),
        to: CurrencyCode(state.selectedToCurrency),
        amount: state.parsedAmount!,
      );
      
      developer.log('[CurrencyNotifier] Online conversion result - isSuccess: ${onlineResult.isSuccess}', name: 'CurrencyNotifier');
      if (onlineResult.isSuccess) {
        developer.log('[CurrencyNotifier] Online conversion successful: ${onlineResult.value}', name: 'CurrencyNotifier');
        state = state.copyWith(
          conversionState: DataState.success(value: onlineResult.value!),
        );
      } else {
        developer.log('[CurrencyNotifier] Online conversion also failed: ${onlineResult.error}', name: 'CurrencyNotifier');
        state = state.copyWith(
          conversionState: DataState.failure(error: onlineResult.error!),
        );
      }
    }
  }

  /// Refresh current data and update cache
  Future<void> refresh() async {
    if (state.isRefreshing) return;
    
    state = state.copyWith(isRefreshing: true);
    
    // First, refresh cache with latest data from API
    final cacheResult = await _repository.initializeCache();
    if (cacheResult.isSuccess) {
      developer.log('[CurrencyNotifier] Cache refreshed successfully', name: 'CurrencyNotifier');
    } else {
      developer.log('[CurrencyNotifier] Cache refresh failed: ${cacheResult.error}', name: 'CurrencyNotifier');
    }
    
    await Future.wait([
      _loadSupportedCurrencies(),
      _loadRate(),
      if (state.conversionResult != null) convert(),
    ]);
    
    state = state.copyWith(isRefreshing: false);
  }

  /// Load supported currencies
  Future<void> _loadSupportedCurrencies() async {
    developer.log('[CurrencyNotifier] Loading supported currencies...', name: 'CurrencyNotifier');
    state = state.copyWith(supportedCurrenciesState: const DataState.loading());
    
    final result = await _repository.getSupportedCurrencies();
    
    developer.log('[CurrencyNotifier] Supported currencies result - isSuccess: ${result.isSuccess}', name: 'CurrencyNotifier');
    if (result.isSuccess) {
      developer.log('[CurrencyNotifier] Loaded ${result.value!.length} supported currencies', name: 'CurrencyNotifier');
      // Ensure current selections exist in the list; if not, reset to USD/EUR
      final list = result.value!;
      final codes = list.map((c) => c.code.value).toSet();
      final newFrom = codes.contains(state.selectedFromCurrency) ? state.selectedFromCurrency : 'USD';
      final newTo = codes.contains(state.selectedToCurrency) ? state.selectedToCurrency : (newFrom == 'USD' ? 'EUR' : 'USD');
      state = state.copyWith(
        supportedCurrenciesState: DataState.success(value: list),
        selectedFromCurrency: newFrom,
        selectedToCurrency: newTo,
      );
    } else {
      developer.log('[CurrencyNotifier] Failed to load supported currencies: ${result.error}', name: 'CurrencyNotifier');
      state = state.copyWith(
        supportedCurrenciesState: DataState.failure(error: result.error!),
      );
    }
  }

  /// Load current rate for selected currency pair
  Future<void> _loadRate() async {
    developer.log('[CurrencyNotifier] Loading rate from ${state.selectedFromCurrency} to ${state.selectedToCurrency}', name: 'CurrencyNotifier');
    state = state.copyWith(rateState: const DataState.loading());
    
    final result = await _repository.getRate(
      from: CurrencyCode(state.selectedFromCurrency),
      to: CurrencyCode(state.selectedToCurrency),
    );
    
    developer.log('[CurrencyNotifier] Rate result - isSuccess: ${result.isSuccess}', name: 'CurrencyNotifier');
    if (result.isSuccess) {
      developer.log('[CurrencyNotifier] Rate loaded: ${result.value}', name: 'CurrencyNotifier');
      state = state.copyWith(rateState: DataState.success(value: result.value!));
    } else {
      developer.log('[CurrencyNotifier] Failed to load rate: ${result.error}', name: 'CurrencyNotifier');
      state = state.copyWith(
        rateState: DataState.failure(error: result.error!),
      );
    }
  }

}
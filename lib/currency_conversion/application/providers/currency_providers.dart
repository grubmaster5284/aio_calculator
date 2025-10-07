import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/currency_conversion/application/state/currency_notifier.dart';
import 'package:calculator_online/currency_conversion/application/state/currency_state.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/data/repositories/currency_repository_impl.dart';
import 'package:calculator_online/currency_conversion/data/sources/remote/currency_service_factory.dart';
import 'package:calculator_online/currency_conversion/data/sources/local/currency_cache_service.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for SharedPreferences
/// Note: This must be overridden at app startup with an initialized instance.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in main.dart');
});

/// Provider for currency repository
final currencyRepositoryProvider = Provider<ICurrencyRepository>((ref) {
  final apiService = CurrencyServiceFactory.createService();
  final prefs = ref.watch(sharedPreferencesProvider);
  final cacheService = CurrencyCacheService(prefs: prefs);
  
  return CurrencyRepositoryImpl(
    apiService: apiService,
    cacheService: cacheService,
  );
});

/// Provider for currency notifier
final currencyNotifierProvider = StateNotifierProvider<CurrencyNotifier, CurrencyState>((ref) {
  final repository = ref.watch(currencyRepositoryProvider);
  return CurrencyNotifier(repository);
});


/// Provider for supported currencies (derived from notifier)
final supportedCurrenciesProvider = Provider<List<CurrencyModel>>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.supportedCurrencies;
});

/// Provider for current rate (derived from notifier)
final currentRateProvider = Provider<RateModel?>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.currentRate;
});

/// Provider for conversion result (derived from notifier)
final conversionResultProvider = Provider<ConversionResultModel?>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.conversionResult;
});

/// Provider for loading state (derived from notifier)
final isLoadingProvider = Provider<bool>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.isLoading;
});

/// Provider for error state (derived from notifier)
final hasErrorProvider = Provider<bool>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.hasError;
});

/// Provider for can convert state (derived from notifier)
final canConvertProvider = Provider<bool>((ref) {
  final state = ref.watch(currencyNotifierProvider);
  return state.canConvert;
});
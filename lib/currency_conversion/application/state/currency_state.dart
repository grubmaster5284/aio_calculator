import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/core/data_state.dart';

part 'currency_state.freezed.dart';

/// Immutable state for currency conversion feature using DataState pattern
@freezed
class CurrencyState with _$CurrencyState {
  const CurrencyState._(); // Private constructor for extensions

  const factory CurrencyState({
    @Default(DataState<ConversionResultModel>.initial()) DataState<ConversionResultModel> conversionState,
    @Default(DataState<List<CurrencyModel>>.initial()) DataState<List<CurrencyModel>> supportedCurrenciesState,
    @Default(DataState<RateModel>.initial()) DataState<RateModel> rateState,
    @Default('USD') String selectedFromCurrency,
    @Default('EUR') String selectedToCurrency,
    @Default('') String amountInput,
    @Default(false) bool isRefreshing,
    @Default(false) bool isSwapping,
  }) = _CurrencyState;

  // Derived state helpers
  bool get canConvert => amountInput.isNotEmpty && selectedFromCurrency != selectedToCurrency;
  
  // Get formatted amount
  Amount? get parsedAmount {
    if (amountInput.isEmpty) return null;
    try {
      return Amount.fromDecimalString(amountInput);
    } catch (e) {
      return null;
    }
  }

  // Loading states
  bool get isLoading => conversionState.isLoading || supportedCurrenciesState.isLoading || rateState.isLoading;
  bool get hasError => conversionState.hasFailure || supportedCurrenciesState.hasFailure || rateState.hasFailure;
  bool get isSuccess => conversionState.isSuccess && supportedCurrenciesState.isSuccess && rateState.isSuccess;

  // Data access
  ConversionResultModel? get conversionResult => conversionState.value;
  List<CurrencyModel> get supportedCurrencies => supportedCurrenciesState.value ?? [];
  RateModel? get currentRate => rateState.value;

  // Error access
  ConversionError? get conversionError => conversionState.error as ConversionError?;
  ConversionError? get supportedCurrenciesError => supportedCurrenciesState.error as ConversionError?;
  ConversionError? get rateError => rateState.error as ConversionError?;

  factory CurrencyState.initial() => const CurrencyState();
}
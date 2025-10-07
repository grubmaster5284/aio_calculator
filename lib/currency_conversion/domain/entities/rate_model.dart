import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'rate_model.freezed.dart';

/// Domain entity representing an exchange rate between two currencies.
@freezed
abstract class RateModel with _$RateModel {
  const factory RateModel({
    required CurrencyCode baseCurrencyCode,
    required CurrencyCode quoteCurrencyCode,
    required BigInt rateScaled,
    @Default(6) int rateScale,
    required DateTime timestamp,
  }) = _RateModel;

  const RateModel._();

  double get rateAsDouble => rateScaled.toDouble() / BigInt.from(10).pow(rateScale).toDouble();
}



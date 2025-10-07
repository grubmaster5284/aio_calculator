import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'conversion_result_model.freezed.dart';

/// Domain entity representing the outcome of a currency conversion.
@freezed
abstract class ConversionResultModel with _$ConversionResultModel {
  const factory ConversionResultModel({
    required CurrencyCode fromCurrencyCode,
    required CurrencyCode toCurrencyCode,
    required BigInt rateScaled,
    @Default(6) int rateScale,
    required BigInt amountInScaled,
    @Default(6) int amountScale,
    required BigInt amountOutScaled,
    required DateTime timestamp,
  }) = _ConversionResultModel;

  const ConversionResultModel._();

  double get rateAsDouble => rateScaled.toDouble() / BigInt.from(10).pow(rateScale).toDouble();
  double get amountInAsDouble => amountInScaled.toDouble() / BigInt.from(10).pow(amountScale).toDouble();
  double get amountOutAsDouble => amountOutScaled.toDouble() / BigInt.from(10).pow(amountScale).toDouble();
}



import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'conversion_result_dto.freezed.dart';
part 'conversion_result_dto.g.dart';

@freezed
abstract class ConversionResultDto with _$ConversionResultDto {
  const factory ConversionResultDto({
    @Default('') String fromCurrencyCode,
    @Default('') String toCurrencyCode,
    @Default(0.0) double rate,
    @Default(0.0) double amountIn,
    @Default(0.0) double amountOut,
    @Default('') String timestamp,
  }) = _ConversionResultDto;

  factory ConversionResultDto.fromJson(Map<String, dynamic> json) =>
      _$ConversionResultDtoFromJson(json);

  factory ConversionResultDto.fromDomain(ConversionResultModel model) =>
      ConversionResultDto(
        fromCurrencyCode: model.fromCurrencyCode.value,
        toCurrencyCode: model.toCurrencyCode.value,
        rate: model.rateAsDouble,
        amountIn: model.amountInAsDouble,
        amountOut: model.amountOutAsDouble,
        timestamp: model.timestamp.toIso8601String(),
      );
}

extension ConversionResultDtoX on ConversionResultDto {
  ConversionResultModel toDomain() {
    const scale = 6;
    final rateScaled = BigInt.from((rate * BigInt.from(10).pow(scale).toDouble()).round());
    final amountInScaled = BigInt.from((amountIn * BigInt.from(10).pow(scale).toDouble()).round());
    final amountOutScaled = BigInt.from((amountOut * BigInt.from(10).pow(scale).toDouble()).round());
    
    return ConversionResultModel(
      fromCurrencyCode: CurrencyCode(fromCurrencyCode),
      toCurrencyCode: CurrencyCode(toCurrencyCode),
      rateScaled: rateScaled,
      rateScale: scale,
      amountInScaled: amountInScaled,
      amountScale: scale,
      amountOutScaled: amountOutScaled,
      timestamp: DateTime.parse(timestamp),
    );
  }
}

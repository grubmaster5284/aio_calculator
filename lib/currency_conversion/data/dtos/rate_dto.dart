import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'rate_dto.freezed.dart';
part 'rate_dto.g.dart';

@freezed
abstract class RateDto with _$RateDto {
  const factory RateDto({
    @Default('') String baseCurrencyCode,
    @Default('') String quoteCurrencyCode,
    @Default(0.0) double rate,
    @Default('') String timestamp,
  }) = _RateDto;

  factory RateDto.fromJson(Map<String, dynamic> json) =>
      _$RateDtoFromJson(json);

  factory RateDto.fromDomain(RateModel model) =>
      RateDto(
        baseCurrencyCode: model.baseCurrencyCode.value,
        quoteCurrencyCode: model.quoteCurrencyCode.value,
        rate: model.rateAsDouble,
        timestamp: model.timestamp.toIso8601String(),
      );
}

extension RateDtoX on RateDto {
  RateModel toDomain() {
    const scale = 6;
    final rateScaled = BigInt.from((rate * BigInt.from(10).pow(scale).toDouble()).round());
    
    return RateModel(
      baseCurrencyCode: CurrencyCode(baseCurrencyCode),
      quoteCurrencyCode: CurrencyCode(quoteCurrencyCode),
      rateScaled: rateScaled,
      rateScale: scale,
      timestamp: DateTime.parse(timestamp),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
abstract class CurrencyDto with _$CurrencyDto {
  const factory CurrencyDto({
    @Default('') String code,
    @Default('') String name,
    @Default('') String symbol,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDtoFromJson(json);

  factory CurrencyDto.fromDomain(CurrencyModel model) =>
      CurrencyDto(
        code: model.code.value,
        name: model.name,
        symbol: model.symbol,
      );
}

extension CurrencyDtoX on CurrencyDto {
  CurrencyModel toDomain() => CurrencyModel(
        code: CurrencyCode(code),
        name: name,
        symbol: symbol,
      );
}

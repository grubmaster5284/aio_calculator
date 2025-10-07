// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyDtoImpl _$$CurrencyDtoImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyDtoImpl(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
    );

Map<String, dynamic> _$$CurrencyDtoImplToJson(_$CurrencyDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
    };

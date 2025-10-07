// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateDtoImpl _$$RateDtoImplFromJson(Map<String, dynamic> json) =>
    _$RateDtoImpl(
      baseCurrencyCode: json['baseCurrencyCode'] as String? ?? '',
      quoteCurrencyCode: json['quoteCurrencyCode'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$$RateDtoImplToJson(_$RateDtoImpl instance) =>
    <String, dynamic>{
      'baseCurrencyCode': instance.baseCurrencyCode,
      'quoteCurrencyCode': instance.quoteCurrencyCode,
      'rate': instance.rate,
      'timestamp': instance.timestamp,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionResultDtoImpl _$$ConversionResultDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversionResultDtoImpl(
      fromCurrencyCode: json['fromCurrencyCode'] as String? ?? '',
      toCurrencyCode: json['toCurrencyCode'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      amountIn: (json['amountIn'] as num?)?.toDouble() ?? 0.0,
      amountOut: (json['amountOut'] as num?)?.toDouble() ?? 0.0,
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$$ConversionResultDtoImplToJson(
        _$ConversionResultDtoImpl instance) =>
    <String, dynamic>{
      'fromCurrencyCode': instance.fromCurrencyCode,
      'toCurrencyCode': instance.toCurrencyCode,
      'rate': instance.rate,
      'amountIn': instance.amountIn,
      'amountOut': instance.amountOut,
      'timestamp': instance.timestamp,
    };

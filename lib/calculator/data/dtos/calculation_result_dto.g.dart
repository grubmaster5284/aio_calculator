// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationResultDtoImpl _$$CalculationResultDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculationResultDtoImpl(
      functionId: json['functionId'] as String? ?? '',
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
      metadata: json['metadata'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$CalculationResultDtoImplToJson(
        _$CalculationResultDtoImpl instance) =>
    <String, dynamic>{
      'functionId': instance.functionId,
      'value': instance.value,
      'metadata': instance.metadata,
    };

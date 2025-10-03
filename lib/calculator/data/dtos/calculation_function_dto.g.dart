// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_function_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalculationFunctionDto _$CalculationFunctionDtoFromJson(
  Map<String, dynamic> json,
) => _CalculationFunctionDto(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  parameters:
      (json['parameters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$CalculationFunctionDtoToJson(
  _CalculationFunctionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'parameters': instance.parameters,
};

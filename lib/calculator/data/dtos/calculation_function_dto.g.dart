// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_function_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationFunctionDtoImpl _$$CalculationFunctionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculationFunctionDtoImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      parameters: (json['parameters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$CalculationFunctionDtoImplToJson(
        _$CalculationFunctionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parameters': instance.parameters,
    };

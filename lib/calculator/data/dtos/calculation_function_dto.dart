import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

part 'calculation_function_dto.freezed.dart';
part 'calculation_function_dto.g.dart';

@freezed
abstract class CalculationFunctionDto with _$CalculationFunctionDto {
  const factory CalculationFunctionDto({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default(<String>[]) List<String> parameters,
  }) = _CalculationFunctionDto;

  factory CalculationFunctionDto.fromJson(Map<String, dynamic> json) =>
      _$CalculationFunctionDtoFromJson(json);

  factory CalculationFunctionDto.fromDomain(CalculationFunctionModel model) =>
      CalculationFunctionDto(
        id: model.id.value,
        name: model.name,
        description: model.description,
        parameters: model.parameters,
      );
}

extension CalculationFunctionDtoX on CalculationFunctionDto {
  CalculationFunctionModel toDomain() => CalculationFunctionModel(
        id: FunctionId(id),
        name: name,
        description: description,
        parameters: parameters,
      );
}



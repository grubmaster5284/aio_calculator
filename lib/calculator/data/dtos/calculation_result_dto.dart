import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

part 'calculation_result_dto.freezed.dart';
part 'calculation_result_dto.g.dart';

@freezed
abstract class CalculationResultDto with _$CalculationResultDto {
  const factory CalculationResultDto({
    @Default('') String functionId,
    @Default(0.0) double value,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _CalculationResultDto;

  factory CalculationResultDto.fromJson(Map<String, dynamic> json) =>
      _$CalculationResultDtoFromJson(json);

  factory CalculationResultDto.fromDomain(CalculationResultModel model) =>
      CalculationResultDto(
        functionId: model.functionId.value,
        value: model.value,
        metadata: model.metadata,
      );
}

extension CalculationResultDtoX on CalculationResultDto {
  CalculationResultModel toDomain() => CalculationResultModel(
        functionId: FunctionId(functionId),
        value: value,
        metadata: metadata,
      );
}



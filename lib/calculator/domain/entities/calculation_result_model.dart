import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

part 'calculation_result_model.freezed.dart';

/// Domain entity representing the outcome of a calculation.
@freezed
class CalculationResultModel with _$CalculationResultModel {
  const factory CalculationResultModel({
    required FunctionId functionId,
    @Default(0.0) double value,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _CalculationResultModel;
}



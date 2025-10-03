import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

part 'calculation_function_model.freezed.dart';

/// Domain entity representing a supported calculation function (e.g., add, subtract).
@freezed
abstract class CalculationFunctionModel with _$CalculationFunctionModel {
  const factory CalculationFunctionModel({
    required FunctionId id,
    @Default('') String name,
    @Default('') String description,
    @Default(<String>[]) List<String> parameters,
  }) = _CalculationFunctionModel;
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';

part 'calculation_state.freezed.dart';

@freezed
class CalculationState with _$CalculationState {
  const CalculationState._();

  const factory CalculationState({
    @Default(false) bool isLoading,
    @Default(<CalculationFunctionModel>[]) List<CalculationFunctionModel> functions,
    CalculationResultModel? lastResult,
    String? errorMessage,
  }) = _CalculationState;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  factory CalculationState.initial() => const CalculationState();
}



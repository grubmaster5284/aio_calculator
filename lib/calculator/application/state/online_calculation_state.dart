import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';

part 'online_calculation_state.freezed.dart';

@freezed
class OnlineCalculationState with _$OnlineCalculationState {
  const OnlineCalculationState._();

  const factory OnlineCalculationState({
    @Default(false) bool isLoading,
    @Default(<CalculationFunctionModel>[]) List<CalculationFunctionModel> functions,
    CalculationResultModel? lastResult,
    String? errorMessage,
  }) = _OnlineCalculationState;

  bool get hasError => errorMessage?.isNotEmpty ?? false;

  factory OnlineCalculationState.initial() => const OnlineCalculationState();
}



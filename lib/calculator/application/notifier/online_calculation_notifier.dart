import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/state/online_calculation_state.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

class OnlineCalculationNotifier extends StateNotifier<OnlineCalculationState> {
  OnlineCalculationNotifier(this._repository) : super(OnlineCalculationState.initial());

  final ICalculationRepository _repository;

  Future<void> loadFunctions() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _repository.getAvailableFunctions();

    if (result.isSuccess) {
      state = state.copyWith(isLoading: false, functions: result.requireValue);
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: result.requireError.toString(),
      );
    }
  }

  Future<void> execute(FunctionId functionId, Map<String, dynamic> inputs) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _repository.execute(functionId, inputs);

    if (result.isSuccess) {
      state = state.copyWith(isLoading: false, lastResult: result.requireValue);
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: result.requireError.toString(),
      );
    }
  }

  void clearError() {
    if (state.hasError) {
      state = state.copyWith(errorMessage: null);
    }
  }

  void reset() {
    state = OnlineCalculationState.initial();
  }
}



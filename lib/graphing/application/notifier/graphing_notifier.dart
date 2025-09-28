import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/graphing/application/state/graphing_state.dart';

class GraphingNotifier extends StateNotifier<GraphingState> {
  GraphingNotifier() : super(GraphingState.initial());

  void setExpression(String latex) {
    state = state.copyWith(currentExpression: latex, errorMessage: null);
  }

  void toggleExpressionsVisibility() {
    state = state.copyWith(showExpressions: !state.showExpressions);
  }

  Future<void> reload() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    // Placeholder for future async actions (e.g., fetching presets or settings)
    await Future<void>.delayed(const Duration(milliseconds: 150));
    state = state.copyWith(isLoading: false);
  }

  void clearError() {
    if (state.hasError) {
      state = state.copyWith(errorMessage: null);
    }
  }
}



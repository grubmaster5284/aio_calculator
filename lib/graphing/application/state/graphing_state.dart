import 'package:freezed_annotation/freezed_annotation.dart';

part 'graphing_state.freezed.dart';

@freezed
class GraphingState with _$GraphingState {
  const GraphingState._();

  const factory GraphingState({
    @Default(false) bool isLoading,
    /// Current LaTeX expression to render on the graph
    @Default('') String currentExpression,
    /// Whether expressions panel is visible in the embedded calculator
    @Default(true) bool showExpressions,
    /// Optional error message for failures
    String? errorMessage,
  }) = _GraphingState;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  factory GraphingState.initial() => const GraphingState();
}



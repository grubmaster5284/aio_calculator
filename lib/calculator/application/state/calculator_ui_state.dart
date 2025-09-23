class CalculatorUiState {
  final String displayValue;
  final String secondaryDisplayValue;
  final String? currentOperation;
  final double? storedValue;
  final List<HistoryItem> history;
  final bool isDegreesMode;

  const CalculatorUiState({
    this.displayValue = '0',
    this.secondaryDisplayValue = '',
    this.currentOperation,
    this.storedValue,
    this.history = const <HistoryItem>[],
    this.isDegreesMode = true,
  });

  factory CalculatorUiState.initial() => const CalculatorUiState();

  CalculatorUiState copyWith({
    String? displayValue,
    String? secondaryDisplayValue,
    String? currentOperation,
    double? storedValue,
    List<HistoryItem>? history,
    bool? isDegreesMode,
    bool clearCurrentOperation = false,
    bool clearStoredValue = false,
  }) {
    return CalculatorUiState(
      displayValue: displayValue ?? this.displayValue,
      secondaryDisplayValue: secondaryDisplayValue ?? this.secondaryDisplayValue,
      currentOperation: clearCurrentOperation ? null : (currentOperation ?? this.currentOperation),
      storedValue: clearStoredValue ? null : (storedValue ?? this.storedValue),
      history: history ?? this.history,
      isDegreesMode: isDegreesMode ?? this.isDegreesMode,
    );
  }
}

class HistoryItem {
  final String expression;
  final String result;
  final DateTime timestamp;

  const HistoryItem({
    required this.expression,
    required this.result,
    required this.timestamp,
  });
}


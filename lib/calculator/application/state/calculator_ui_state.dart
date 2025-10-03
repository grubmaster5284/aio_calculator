class CalculatorDisplayState {
  final String displayValue;
  final String secondaryDisplayValue;
  final String? currentOperation;
  final double? storedValue;
  final List<CalculatorHistoryEntry> history;
  final bool isDegreesMode;

  const CalculatorDisplayState({
    this.displayValue = '0',
    this.secondaryDisplayValue = '',
    this.currentOperation,
    this.storedValue,
    this.history = const <CalculatorHistoryEntry>[],
    this.isDegreesMode = true,
  });

  factory CalculatorDisplayState.initial() => const CalculatorDisplayState();

  CalculatorDisplayState copyWith({
    String? displayValue,
    String? secondaryDisplayValue,
    String? currentOperation,
    double? storedValue,
    List<CalculatorHistoryEntry>? history,
    bool? isDegreesMode,
    bool clearCurrentOperation = false,
    bool clearStoredValue = false,
  }) {
    return CalculatorDisplayState(
      displayValue: displayValue ?? this.displayValue,
      secondaryDisplayValue: secondaryDisplayValue ?? this.secondaryDisplayValue,
      currentOperation: clearCurrentOperation ? null : (currentOperation ?? this.currentOperation),
      storedValue: clearStoredValue ? null : (storedValue ?? this.storedValue),
      history: history ?? this.history,
      isDegreesMode: isDegreesMode ?? this.isDegreesMode,
    );
  }
}

class CalculatorHistoryEntry {
  final String expression;
  final String result;
  final DateTime timestamp;

  const CalculatorHistoryEntry({
    required this.expression,
    required this.result,
    required this.timestamp,
  });
}


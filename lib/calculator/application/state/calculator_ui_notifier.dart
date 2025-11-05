import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import 'package:calculator_online/calculator/data/services/calculator_engine_service.dart';

class CalculatorUiStateNotifier extends StateNotifier<CalculatorDisplayState> {
  final CalculatorEngineService _engine;

  CalculatorUiStateNotifier(this._engine) : super(CalculatorDisplayState.initial());

  void press(String button) {
    final currentDisplay = state.displayValue;

    switch (button) {
      case 'AC':
        state = CalculatorDisplayState.initial();
        return;
      case '⌫':
        if (currentDisplay.length > 1) {
          state = state.copyWith(displayValue: currentDisplay.substring(0, currentDisplay.length - 1));
        } else {
          state = state.copyWith(displayValue: '0');
        }
        return;
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        if (currentDisplay == '0' || _isOperatorPending()) {
          state = state.copyWith(displayValue: button, currentOperation: _clearPendingFromSecondary());
        } else {
          state = state.copyWith(displayValue: currentDisplay + button);
        }
        return;
      case '.':
        if (!currentDisplay.contains('.')) {
          state = state.copyWith(displayValue: currentDisplay + button);
        }
        return;
      case '+':
      case '-':
      case '×':
      case '÷':
      case '^':
        _handleOperator(button);
        return;
      case '=':
        _calculateResult();
        return;
      case '%':
        final value = double.tryParse(currentDisplay) ?? 0;
        final percentageResult = value / 100;
        final formattedResult = _engine.formatResult(percentageResult);
        state = state.copyWith(displayValue: formattedResult);
        return;
      case 'π':
        state = state.copyWith(displayValue: '3.141592653589793');
        return;
      case 'e':
        state = state.copyWith(displayValue: '2.718281828459045');
        return;
      case 'sin':
      case 'cos':
      case 'tan':
      case 'asin':
      case 'acos':
      case 'atan':
      case 'log':
      case 'ln':
      case '√':
      case '1/x':
      case '!':
        _handleUnary(button);
        return;
      default:
        return;
    }
  }

  void setDisplay(String value) {
    state = state.copyWith(displayValue: value);
  }

  void clearHistory() {
    state = state.copyWith(history: const []);
  }

  void clearRecent({int count = 3}) {
    final len = state.history.length;
    if (len == 0) return;
    final newLen = (len - count).clamp(0, len);
    state = state.copyWith(history: state.history.take(newLen).toList());
  }

  bool _isOperatorPending() {
    return state.currentOperation == 'pending';
  }

  String? _clearPendingFromSecondary() {
    if (state.currentOperation == 'pending') {
      final tokens = state.secondaryDisplayValue.split(' ');
      if (tokens.isNotEmpty) {
        return tokens.last;
      }
    }
    return state.currentOperation;
  }

  void _handleOperator(String operator) {
    final currentDisplay = state.displayValue;
    final currentOperation = state.currentOperation;
    final storedValue = state.storedValue;

    if (storedValue != null && currentOperation != null && currentOperation != 'pending') {
      _calculateResult(addToHistory: false);
    }

    state = state.copyWith(
      storedValue: double.tryParse(currentDisplay) ?? 0,
      currentOperation: 'pending',
      secondaryDisplayValue: '$currentDisplay $operator',
    );
  }

  void _handleUnary(String op) {
    final x = double.tryParse(state.displayValue) ?? 0;
    final result = _engine.unary(op, x, isDegrees: state.isDegreesMode);
    if (result == null) {
      state = state.copyWith(displayValue: 'Error');
      return;
    }
    final resultString = _engine.formatResult(result);
    state = state.copyWith(displayValue: resultString);

    final item = CalculatorHistoryEntry(
      expression: '$op(${x.toString()})',
      result: resultString,
      timestamp: DateTime.now(),
    );
    state = state.copyWith(history: [...state.history, item]);
  }

  void toggleDegrees() {
    state = state.copyWith(isDegreesMode: !state.isDegreesMode);
  }

  void _calculateResult({bool addToHistory = true}) {
    final currentDisplay = state.displayValue;
    final secondaryDisplay = state.secondaryDisplayValue;
    final storedValue = state.storedValue;

    if (storedValue == null || secondaryDisplay.isEmpty) return;

    final currentValue = double.tryParse(currentDisplay) ?? 0;
    final parts = secondaryDisplay.split(' ');
    if (parts.length < 2) return;

    final operator = parts.last;
    final result = _engine.tryCompute(storedValue, currentValue, operator);
    if (result == null) {
      state = state.copyWith(displayValue: 'Error');
      return;
    }

    final resultString = _engine.formatResult(result);

    state = state.copyWith(displayValue: resultString);

    if (addToHistory) {
      final history = state.history;
      final newItem = CalculatorHistoryEntry(
        expression: '$secondaryDisplay $currentDisplay',
        result: resultString,
        timestamp: DateTime.now(),
      );
      state = state.copyWith(
        history: [...history, newItem],
        secondaryDisplayValue: '',
        currentOperation: null,
        storedValue: null,
      );
    } else {
      state = state.copyWith(storedValue: result);
    }
  }
}


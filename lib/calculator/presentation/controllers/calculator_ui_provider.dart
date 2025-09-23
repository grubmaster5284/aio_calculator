import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for expanded/collapsed state of the calculator
final isCalculatorExpandedProvider = StateProvider<bool>((ref) => false);

/// Provider for second function mode (UI-only)
final isSecondFunctionProvider = StateProvider<bool>((ref) => false);

/// Toggle to show history-only mode (full screen history, hide calculator)
final isHistoryOnlyModeProvider = StateProvider<bool>((ref) => false);

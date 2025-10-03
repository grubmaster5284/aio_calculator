import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/notifier/online_calculation_notifier.dart';
import 'package:calculator_online/calculator/application/state/online_calculation_state.dart';
import 'package:calculator_online/calculator/application/notifier/calculator_ui_notifier.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import 'package:calculator_online/di/calculator_di.dart';

final httpClientProvider = CalculatorDI.httpClientProvider;

final calculationRemoteServiceProvider = CalculatorDI.calculationRemoteServiceProvider;

final calculationRepositoryProvider = CalculatorDI.calculationRepositoryProvider;

final calculationNotifierProvider =
    StateNotifierProvider<OnlineCalculationNotifier, OnlineCalculationState>((ref) {
  return OnlineCalculationNotifier(ref.watch(calculationRepositoryProvider));
});

/// UI-only calculator provider (offline keypad logic)
final calculatorUiNotifierProvider =
    StateNotifierProvider<CalculatorUiNotifier, CalculatorUiState>((ref) {
  final engine = ref.watch(calculatorEngineProvider);
  return CalculatorUiNotifier(engine);
});

/// Domain calculator engine provider
final calculatorEngineProvider = CalculatorDI.calculatorEngineProvider;



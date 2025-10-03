import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/notifier/online_calculation_notifier.dart';
import 'package:calculator_online/calculator/application/state/online_calculation_state.dart';
import 'package:calculator_online/calculator/application/notifier/calculator_ui_notifier.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import 'package:calculator_online/di/calculator_module_di.dart';

final httpClientProvider = CalculatorModuleDI.httpClientProvider;

final calculationRemoteServiceProvider = CalculatorModuleDI.calculationRemoteServiceProvider;

final calculationRepositoryProvider = CalculatorModuleDI.calculationRepositoryProvider;

final onlineCalculationNotifierProvider =
    StateNotifierProvider<OnlineCalculationNotifier, OnlineCalculationState>((ref) {
  return OnlineCalculationNotifier(ref.watch(calculationRepositoryProvider));
});

/// UI-only calculator provider (offline keypad logic)
final calculatorUiStateNotifierProvider =
    StateNotifierProvider<CalculatorUiStateNotifier, CalculatorDisplayState>((ref) {
  final engine = ref.watch(calculatorEngineServiceProvider);
  return CalculatorUiStateNotifier(engine);
});

/// Domain calculator engine provider
final calculatorEngineServiceProvider = CalculatorModuleDI.calculatorEngineServiceProvider;



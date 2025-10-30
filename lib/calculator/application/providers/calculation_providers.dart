import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/state/online_calculation_notifier.dart';
import 'package:calculator_online/calculator/application/state/online_calculation_state.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_notifier.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import 'package:calculator_online/core/di/calculator_di.dart';

final httpClientProvider = CalculatorDI.httpClientProvider;

final calculationRemoteServiceProvider = CalculatorDI.calculationRemoteServiceProvider;

final calculationRepositoryProvider = CalculatorDI.calculationRepositoryProvider;

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
final calculatorEngineServiceProvider = CalculatorDI.calculatorEngineServiceProvider;



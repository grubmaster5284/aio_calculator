import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/application/notifier/calculation_notifier.dart';
import 'package:calculator_online/calculator/application/state/calculation_state.dart';
import 'package:calculator_online/calculator/data/repositories/calculation_repository_impl.dart';
import 'package:calculator_online/calculator/data/sources/remote/calculation_remote_service.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/application/notifier/calculator_ui_notifier.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import 'package:calculator_online/calculator/domain/services/calculator_engine.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  throw UnimplementedError('Provide an HttpClient implementation via override.');
});

final calculationRemoteServiceProvider = Provider<CalculationRemoteService>((ref) {
  return CalculationRemoteService(ref.watch(httpClientProvider));
});

final calculationRepositoryProvider = Provider<ICalculationRepository>((ref) {
  return CalculationRepositoryImpl(ref.watch(calculationRemoteServiceProvider));
});

final calculationNotifierProvider =
    StateNotifierProvider<CalculationNotifier, CalculationState>((ref) {
  return CalculationNotifier(ref.watch(calculationRepositoryProvider));
});

/// UI-only calculator provider (offline keypad logic)
final calculatorUiNotifierProvider =
    StateNotifierProvider<CalculatorUiNotifier, CalculatorUiState>((ref) {
  final engine = ref.watch(calculatorEngineProvider);
  return CalculatorUiNotifier(engine);
});

/// Domain calculator engine provider
final calculatorEngineProvider = Provider<CalculatorEngine>((ref) {
  return const CalculatorEngine();
});



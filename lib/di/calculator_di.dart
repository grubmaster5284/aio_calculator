import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/data/repositories/calculation_repository_impl.dart';
import 'package:calculator_online/calculator/data/sources/remote/calculation_remote_service.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/data/services/calculator_math_engine.dart';

/// Dependency injection container for the calculator module
/// This isolates data layer dependencies from the application layer
class CalculatorDI {
  /// HTTP client provider - should be overridden in main.dart
  static final httpClientProvider = Provider<HttpClient>((ref) {
    throw UnimplementedError('Provide an HttpClient implementation via override.');
  });

  /// Remote service provider for calculation API calls
  static final calculationRemoteServiceProvider = Provider<CalculationRemoteService>((ref) {
    return CalculationRemoteService(ref.watch(httpClientProvider));
  });

  /// Repository provider adhering to domain contract
  static final calculationRepositoryProvider = Provider<ICalculationRepository>((ref) {
    return CalculationRepositoryImpl(ref.watch(calculationRemoteServiceProvider));
  });

  /// Calculator math engine provider (data layer service)
  static final calculatorEngineProvider = Provider<CalculatorMathEngine>((ref) {
    return const CalculatorMathEngine();
  });
}


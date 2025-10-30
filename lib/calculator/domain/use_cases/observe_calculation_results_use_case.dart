import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';

/// Use case exposing a stream of calculation results from the repository.
class ObserveCalculationResultsUseCase {
  final ICalculationRepository _repository;

  const ObserveCalculationResultsUseCase(this._repository);

  Stream<CalculationResultModel?> call() => _repository.calculationResults;
}



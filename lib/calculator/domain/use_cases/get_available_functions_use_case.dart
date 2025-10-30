import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';

/// Use case to retrieve all available calculation functions.
class GetAvailableFunctionsUseCase {
  final ICalculationRepository _repository;

  const GetAvailableFunctionsUseCase(this._repository);

  Future<Result<List<CalculationFunctionModel>, CalculationError>> call() {
    return _repository.getAvailableFunctions();
  }
}



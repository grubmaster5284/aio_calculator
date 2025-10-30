import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

/// Use case to execute a calculation with inputs for a given function.
class ExecuteCalculationUseCase {
  final ICalculationRepository _repository;

  const ExecuteCalculationUseCase(this._repository);

  Future<Result<CalculationResultModel, CalculationError>> call({
    required FunctionId functionId,
    required Map<String, dynamic> inputs,
  }) {
    return _repository.execute(functionId, inputs);
  }
}



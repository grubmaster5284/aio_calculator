import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

/// Use case to fetch a single calculation function by ID.
class GetFunctionByIdUseCase {
  final ICalculationRepository _repository;

  const GetFunctionByIdUseCase(this._repository);

  Future<Result<CalculationFunctionModel, CalculationError>> call(FunctionId id) {
    return _repository.getFunctionById(id);
  }
}



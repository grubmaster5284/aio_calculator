import 'package:calculator_online/calculator/data/dtos/calculation_function_dto.dart';
import 'package:calculator_online/calculator/data/dtos/calculation_result_dto.dart';
import 'package:calculator_online/calculator/data/sources/remote/calculation_remote_service.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';
import 'package:calculator_online/core/result.dart';

/// Repository implementation mapping DTOs ↔ Domain and errors to domain errors.
class CalculationRepositoryImpl implements ICalculationRepository {
  CalculationRepositoryImpl(this._remote);

  final CalculationRemoteService _remote;

  @override
  Future<Result<List<CalculationFunctionModel>, CalculationError>> getAvailableFunctions() async {
    final result = await _remote.getFunctions();
    if (result.isFailure) return Result.failure(result.requireError);

    final dtos = result.requireValue;
    final models = dtos.map((e) => e.toDomain()).toList(growable: false);
    return Result.success(models);
  }

  @override
  Future<Result<CalculationFunctionModel, CalculationError>> getFunctionById(
    FunctionId id,
  ) async {
    final result = await _remote.getFunctionById(id.value);
    if (result.isFailure) return Result.failure(result.requireError);
    return Result.success(result.requireValue.toDomain());
  }

  @override
  Future<Result<CalculationResultModel, CalculationError>> execute(
    FunctionId functionId,
    Map<String, dynamic> inputs,
  ) async {
    final result = await _remote.execute(functionId: functionId.value, inputs: inputs);
    if (result.isFailure) return Result.failure(result.requireError);
    return Result.success(result.requireValue.toDomain());
  }

  @override
  Stream<CalculationResultModel?> get calculationResults => const Stream<CalculationResultModel?>.empty();
}



import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_function_model.dart';
import 'package:calculator_online/calculator/domain/entities/calculation_result_model.dart';
import 'package:calculator_online/calculator/domain/value_objects/function_id_vo.dart';

/// Contract for performing calculations and discovering supported functions.
///
/// Implementations live in the data layer and must:
/// - Map infrastructure errors to [CalculationError]
/// - Never expose DTOs to the domain or presentation layers
/// - Be fully async and return [Result] for fallible operations
abstract class ICalculationRepository {
  /// List all available calculation functions.
  ///
  /// Returns [Result.failure] with [CalculationError.unknown] on unexpected errors.
  Future<Result<List<CalculationFunctionModel>, CalculationError>> getAvailableFunctions();

  /// Fetch a single calculation function by its [FunctionId].
  ///
  /// Returns [Result.failure] with [CalculationError.notFound] if missing.
  Future<Result<CalculationFunctionModel, CalculationError>> getFunctionById(FunctionId id);

  /// Execute a calculation for the given [functionId] and [inputs].
  ///
  /// Returns [Result.failure] with [CalculationError.invalidInput] on bad inputs
  /// or [CalculationError.timeout] on timeouts.
  Future<Result<CalculationResultModel, CalculationError>> execute(
    FunctionId functionId,
    Map<String, dynamic> inputs,
  );

  /// Optional stream of the latest calculation results.
  /// Implementations may emit null to indicate reset/cleared state.
  Stream<CalculationResultModel?> get calculationResults;
}



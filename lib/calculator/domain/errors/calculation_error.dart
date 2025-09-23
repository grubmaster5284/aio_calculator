import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_error.freezed.dart';

/// Domain-specific errors for calculations.
@freezed
sealed class CalculationError with _$CalculationError {
  const factory CalculationError.notFound() = NotFound;
  const factory CalculationError.invalidInput(String message) = InvalidInput;
  const factory CalculationError.timeout() = Timeout;
  const factory CalculationError.unknown(String message) = Unknown;
}



import 'package:freezed_annotation/freezed_annotation.dart';

part 'graphing_error.freezed.dart';

/// Domain-specific errors for graphing feature.
@freezed
abstract class GraphingError with _$GraphingError {
  const factory GraphingError.invalidExpression({required String message}) = InvalidExpressionError;
  const factory GraphingError.configuration({required String message}) = ConfigurationError;
  const factory GraphingError.unknown({required String message}) = UnknownGraphingError;
}



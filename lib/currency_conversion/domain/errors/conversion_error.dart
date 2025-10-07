import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_error.freezed.dart';

/// Domain-specific errors for currency conversion operations.
@freezed
sealed class ConversionError with _$ConversionError {
  const factory ConversionError.notFound() = NotFound;
  const factory ConversionError.invalidInput(String message) = InvalidInput;
  const factory ConversionError.timeout() = Timeout;
  const factory ConversionError.networkError(String message) = NetworkError;
  const factory ConversionError.tooManyRequests() = TooManyRequests;
  const factory ConversionError.unauthorized() = Unauthorized;
  const factory ConversionError.forbidden() = Forbidden;
  const factory ConversionError.unknown(String message) = Unknown;
}



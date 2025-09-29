/// Domain-specific errors for graphing feature.
abstract class GraphingError {
  const GraphingError();
}

class InvalidExpressionError extends GraphingError {
  final String message;
  const InvalidExpressionError(this.message);
  @override
  String toString() => 'InvalidExpressionError($message)';
}

class ConfigurationError extends GraphingError {
  final String message;
  const ConfigurationError(this.message);
  @override
  String toString() => 'ConfigurationError($message)';
}

class UnknownGraphingError extends GraphingError {
  final String message;
  const UnknownGraphingError(this.message);
  @override
  String toString() => 'UnknownGraphingError($message)';
}



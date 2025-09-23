/// Strongly typed ID for calculation functions with validation.
class FunctionId {
  final String value;

  FunctionId(this.value) {
    if (value.isEmpty) {
      throw ArgumentError('Function ID cannot be empty');
    }
    if (value.length > 64) {
      throw ArgumentError('Function ID must be <= 64 characters');
    }
    final valid = RegExp(r'^[a-zA-Z0-9_-]+$');
    if (!valid.hasMatch(value)) {
      throw ArgumentError('Function ID contains invalid characters');
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FunctionId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'FunctionId($value)';
}



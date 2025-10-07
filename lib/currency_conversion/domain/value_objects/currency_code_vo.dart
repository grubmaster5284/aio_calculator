class CurrencyCode {
  final String value;

  const CurrencyCode._(this.value);

  factory CurrencyCode(String raw) {
    final normalized = raw.trim().toUpperCase();
    if (normalized.isEmpty) {
      throw ArgumentError('Currency code cannot be empty');
    }
    if (normalized.length != 3) {
      throw ArgumentError('Currency code must be exactly 3 characters');
    }
    final isAlpha = RegExp(r'^[A-Z]{3}$').hasMatch(normalized);
    if (!isAlpha) {
      throw ArgumentError('Currency code must contain only letters A-Z');
    }
    return CurrencyCode._(normalized);
  }

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CurrencyCode && value == other.value;

  @override
  int get hashCode => value.hashCode;
}



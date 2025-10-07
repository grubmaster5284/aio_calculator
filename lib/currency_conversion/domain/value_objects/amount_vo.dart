class Amount {
  final BigInt scaledValue;
  final int scale;

  const Amount._(this.scaledValue, this.scale);

  factory Amount.fromDecimalString(String raw, {int scale = 6}) {
    if (scale < 0 || scale > 18) {
      throw ArgumentError('Scale must be between 0 and 18.');
    }
    final normalized = raw.trim();
    if (normalized.isEmpty) {
      throw ArgumentError('Amount cannot be empty.');
    }
    final negative = normalized.startsWith('-');
    final unsigned = negative ? normalized.substring(1) : normalized;
    final parts = unsigned.split('.');
    if (parts.length > 2) {
      throw ArgumentError('Invalid decimal format.');
    }
    final whole = parts[0].isEmpty ? '0' : parts[0];
    final fraction = parts.length == 2 ? parts[1] : '';
    final digitsOnly = RegExp(r'^\d+$');
    if (!digitsOnly.hasMatch(whole) || (fraction.isNotEmpty && !digitsOnly.hasMatch(fraction))) {
      throw ArgumentError('Amount must be numeric.');
    }
    final paddedFraction = (fraction + List.filled(scale, '0').join()).substring(0, scale);
    final combined = BigInt.parse(whole + paddedFraction);
    final scaled = negative ? -combined : combined;
    if (scaled < BigInt.zero) {
      throw ArgumentError('Amount must be >= 0.');
    }
    return Amount._(scaled, scale);
  }

  factory Amount.fromDouble(double value, {int scale = 6}) {
    if (value.isNaN || value.isInfinite) {
      throw ArgumentError('Amount must be a finite number.');
    }
    if (value < 0) {
      throw ArgumentError('Amount must be >= 0.');
    }
    final factor = BigInt.from(10).pow(scale);
    final scaled = BigInt.from((value * factor.toDouble()).round());
    return Amount._(scaled, scale);
  }

  double toDouble() => scaledValue.toDouble() / BigInt.from(10).pow(scale).toDouble();
  @override
  String toString() => toDouble().toStringAsFixed(scale);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Amount && scaledValue == other.scaledValue && scale == other.scale;

  @override
  int get hashCode => Object.hash(scaledValue, scale);
}



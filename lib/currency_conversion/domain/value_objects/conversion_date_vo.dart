class ConversionDate {
  final DateTime value;

  ConversionDate(DateTime input)
      : value = DateTime.utc(
          input.toUtc().year,
          input.toUtc().month,
          input.toUtc().day,
        ) {
    final now = DateTime.now().toUtc();
    final today = DateTime.utc(now.year, now.month, now.day);
    if (value.isAfter(today)) {
      throw ArgumentError('Conversion date cannot be in the future.');
    }
  }

  @override
  String toString() => value.toIso8601String().split('T').first;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ConversionDate && value == other.value;

  @override
  int get hashCode => value.hashCode;
}



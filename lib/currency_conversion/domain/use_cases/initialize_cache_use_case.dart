import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';

/// Use case to pre-warm currency data caches.
class InitializeCacheUseCase {
  final ICurrencyRepository _repository;

  const InitializeCacheUseCase(this._repository);

  Future<Result<void, ConversionError>> call() {
    return _repository.initializeCache();
  }
}



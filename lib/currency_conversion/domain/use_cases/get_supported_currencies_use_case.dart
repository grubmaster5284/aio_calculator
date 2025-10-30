import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';

/// Use case to retrieve all supported currencies.
class GetSupportedCurrenciesUseCase {
  final ICurrencyRepository repository;

  const GetSupportedCurrenciesUseCase(this.repository);

  Future<Result<List<CurrencyModel>, ConversionError>> call() {
    return repository.getSupportedCurrencies();
  }
}



import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Use case to fetch an exchange rate between two currencies.
class GetRateUseCase {
  final ICurrencyRepository _repository;

  const GetRateUseCase(this._repository);

  Future<Result<RateModel, ConversionError>> call({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  }) {
    return _repository.getRate(from: from, to: to, at: at);
  }
}



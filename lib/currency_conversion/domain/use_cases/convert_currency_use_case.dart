import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

class ConvertCurrencyUseCase {
  final ICurrencyRepository repository;

  const ConvertCurrencyUseCase(this.repository);

  Future<Result<ConversionResultModel, ConversionError>> call({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  }) async {
    // Basic guard: prevent same-currency conversion work
    if (from == to) {
      return const Result.failure(ConversionError.invalidInput('From and To currencies must differ.'));
    }
    return repository.convert(from: from, to: to, amount: amount, at: at);
  }
}



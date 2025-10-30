import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Use case to convert currency using cached data only (offline mode).
class ConvertOfflineUseCase {
  final ICurrencyRepository _repository;

  const ConvertOfflineUseCase(this._repository);

  Future<Result<ConversionResultModel, ConversionError>> call({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
  }) {
    return _repository.convertOffline(from: from, to: to, amount: amount);
  }
}



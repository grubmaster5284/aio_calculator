import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

class GetHistoryUseCase {
  final ICurrencyRepository repository;

  const GetHistoryUseCase(this.repository);

  // Optional, repository may or may not implement. For now, we leave it
  // unimplemented at repository level and return a failure by default when not supported.
  Future<Result<List<RateModel>, ConversionError>> call({
    required CurrencyCode from,
    required CurrencyCode to,
    required ConversionDate start,
    required ConversionDate end,
  }) async {
    // Basic validation: date order
    if (end.value.isBefore(start.value)) {
      return const Result.failure(ConversionError.invalidInput('End date must not be before start date.'));
    }
    // This will be implemented by data layer later (optional feature)
    return const Result.failure(ConversionError.unknown('History not implemented'));
  }
}



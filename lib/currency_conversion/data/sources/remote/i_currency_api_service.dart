import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Base interface for currency API services
/// Handles communication with external currency exchange APIs
abstract class ICurrencyApiService {
  /// Fetch current exchange rate between two currencies
  Future<Result<RateModel, ConversionError>> fetchRate({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  });

  /// Convert amount from one currency to another
  Future<Result<ConversionResultModel, ConversionError>> fetchConversion({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  });

  /// Get list of supported currencies
  Future<Result<List<CurrencyModel>, ConversionError>> fetchCurrencies();

  /// Get historical rates for a specific date
  Future<Result<Map<String, double>, ConversionError>> fetchHistory({
    required CurrencyCode base,
    required ConversionDate date,
  });

  /// Get stream of live rates (if supported by service)
  Stream<RateModel>? getRateStream({
    required CurrencyCode from,
    required CurrencyCode to,
  });
}

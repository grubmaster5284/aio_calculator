import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Contract for currency conversion operations and rate retrieval.
///
/// Implementations live in the data layer and must:
/// - Map infrastructure errors to [ConversionError]
/// - Never expose DTOs to the domain or presentation layers
/// - Be fully async and return [Result] for fallible operations
abstract class ICurrencyRepository {
  /// Convert an amount from one currency to another.
  ///
  /// Returns [Result.failure] with [ConversionError.invalidInput] on bad inputs,
  /// [ConversionError.notFound] if currency not supported, or
  /// [ConversionError.networkError] on network failures.
  Future<Result<ConversionResultModel, ConversionError>> convert({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  });

  /// List all supported currencies.
  ///
  /// Returns [Result.failure] with [ConversionError.networkError] on network failures
  /// or [ConversionError.unknown] on unexpected errors.
  Future<Result<List<CurrencyModel>, ConversionError>> getSupportedCurrencies();

  /// Fetch the exchange rate between two currencies.
  ///
  /// Returns [Result.failure] with [ConversionError.notFound] if rate not available
  /// or [ConversionError.networkError] on network failures.
  Future<Result<RateModel, ConversionError>> getRate({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  });

  /// Convert currency using cached data only (offline mode).
  ///
  /// This method performs conversion using cached rates without making API calls.
  /// Returns [Result.failure] with [ConversionError.notFound] if rate not cached.
  Future<Result<ConversionResultModel, ConversionError>> convertOffline({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
  });

  /// Initialize cache with fresh data from API service.
  ///
  /// This method should be called when the currency page is first opened
  /// to populate the cache with latest data.
  Future<Result<void, ConversionError>> initializeCache();
}



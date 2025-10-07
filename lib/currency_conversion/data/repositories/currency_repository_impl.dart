import 'dart:developer' as developer;
import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/currency_conversion/data/sources/local/currency_cache_service.dart';
import 'package:calculator_online/currency_conversion/data/sources/remote/i_currency_api_service.dart';
import 'package:calculator_online/currency_conversion/data/constants/default_currencies.dart';

/// Repository implementation with fallback strategy
/// Primary: API service for real-time data
/// Fallback: Cache service for offline/backup scenarios
class CurrencyRepositoryImpl implements ICurrencyRepository {
  final ICurrencyApiService _apiService;
  final CurrencyCacheService _cacheService;

  CurrencyRepositoryImpl({
    required ICurrencyApiService apiService,
    required CurrencyCacheService cacheService,
  }) : _apiService = apiService,
       _cacheService = cacheService;

  @override
  Future<Result<ConversionResultModel, ConversionError>> convert({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  }) async {
    developer.log('[CurrencyRepository] Converting ${amount.toDouble()} ${from.value} to ${to.value}', name: 'CurrencyRepository');
    try {
      // Try to get data from API first
      developer.log('[CurrencyRepository] Calling conversion API...', name: 'CurrencyRepository');
      final conversionResult = await _apiService.fetchConversion(
        from: from,
        to: to,
        amount: amount,
        at: at,
      );

      if (conversionResult.isSuccess) {
        final result = conversionResult.value!;
        developer.log('[CurrencyRepository] Conversion successful: ${result.amountOutAsDouble}', name: 'CurrencyRepository');
        
        // Cache the rate for future offline use
        final rate = RateModel(
          baseCurrencyCode: from,
          quoteCurrencyCode: to,
          rateScaled: result.rateScaled,
          rateScale: result.rateScale,
          timestamp: DateTime.now(),
        );
        await _cacheService.cacheRate(rate);
        
        return Result.success(result);
      } else {
        // API failed, fallback to cached rate
        developer.log('[CurrencyRepository] API conversion failed: ${conversionResult.error}', name: 'CurrencyRepository');
        developer.log('[CurrencyRepository] Trying cached rate as fallback...', name: 'CurrencyRepository');
        
        final cachedRateResult = await _cacheService.getCachedRate(
          from: from,
          to: to,
        );
        
        if (cachedRateResult.isSuccess) {
          final cachedRate = cachedRateResult.value!;
          developer.log('[CurrencyRepository] Using cached rate: ${cachedRate.rateAsDouble}', name: 'CurrencyRepository');
          
          // Perform conversion using cached rate
          final convertedAmount = amount.toDouble() * cachedRate.rateAsDouble;
          const scale = 6;
          final amountOutScaled = BigInt.from((convertedAmount * BigInt.from(10).pow(scale).toDouble()).round());
          
          final result = ConversionResultModel(
            fromCurrencyCode: from,
            toCurrencyCode: to,
            rateScaled: cachedRate.rateScaled,
            rateScale: cachedRate.rateScale,
            amountInScaled: amount.scaledValue,
            amountScale: amount.scale,
            amountOutScaled: amountOutScaled,
            timestamp: cachedRate.timestamp,
          );
          
          developer.log('[CurrencyRepository] Conversion successful with cached rate: ${result.amountOutAsDouble}', name: 'CurrencyRepository');
          return Result.success(result);
        } else {
          developer.log('[CurrencyRepository] No cached rate available, conversion failed', name: 'CurrencyRepository');
          return Result.failure(conversionResult.error!);
        }
      }
    } catch (e) {
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  @override
  Future<Result<List<CurrencyModel>, ConversionError>> getSupportedCurrencies() async {
    developer.log('[CurrencyRepository] Getting supported currencies...', name: 'CurrencyRepository');
    try {
      // Try remote service first
      developer.log('[CurrencyRepository] Fetching currencies from remote service...', name: 'CurrencyRepository');
      final remoteResult = await _apiService.fetchCurrencies();
      
      developer.log('[CurrencyRepository] Remote currencies result - isSuccess: ${remoteResult.isSuccess}', name: 'CurrencyRepository');
      if (remoteResult.isSuccess) {
        final currencies = remoteResult.value!;
        developer.log('[CurrencyRepository] Fetched ${currencies.length} currencies from remote service', name: 'CurrencyRepository');
        
        // Cache the currencies
        await _cacheService.cacheCurrencies(currencies);
        
        return Result.success(currencies);
      } else {
        developer.log('[CurrencyRepository] Remote currencies failed: ${remoteResult.error}', name: 'CurrencyRepository');
        // Fallback to cached currencies
        developer.log('[CurrencyRepository] Trying cached currencies...', name: 'CurrencyRepository');
        final cachedResult = await _cacheService.getCachedCurrencies();
        
        developer.log('[CurrencyRepository] Cached currencies result - isSuccess: ${cachedResult.isSuccess}', name: 'CurrencyRepository');
        if (cachedResult.isSuccess) {
          developer.log('[CurrencyRepository] Using ${cachedResult.value!.length} cached currencies', name: 'CurrencyRepository');
          return Result.success(cachedResult.value!);
        } else {
          // Final fallback: static defaults to keep UI usable
          developer.log('[CurrencyRepository] No cached currencies available, falling back to defaults (${kDefaultCurrencies.length})', name: 'CurrencyRepository');
          await _cacheService.cacheCurrencies(kDefaultCurrencies);
          return Result.success(kDefaultCurrencies);
        }
      }
    } catch (e) {
      developer.log('[CurrencyRepository] Exception in getSupportedCurrencies: $e', name: 'CurrencyRepository');
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  @override
  Future<Result<RateModel, ConversionError>> getRate({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  }) async {
    developer.log('[CurrencyRepository] Getting rate from ${from.value} to ${to.value}', name: 'CurrencyRepository');
    try {
      // Always try remote service first for fresh rates
      developer.log('[CurrencyRepository] Fetching rate from remote service...', name: 'CurrencyRepository');
      final remoteResult = await _apiService.fetchRate(
        from: from,
        to: to,
        at: at,
      );
      
      developer.log('[CurrencyRepository] Remote rate result - isSuccess: ${remoteResult.isSuccess}', name: 'CurrencyRepository');
      if (remoteResult.isSuccess) {
        final rate = remoteResult.value!;
        developer.log('[CurrencyRepository] Rate fetched from remote: ${rate.rateAsDouble}', name: 'CurrencyRepository');
        
        // Cache the rate for future offline use
        await _cacheService.cacheRate(rate);
        
        return Result.success(rate);
      } else {
        // API failed, fallback to cached rate
        developer.log('[CurrencyRepository] Remote rate failed: ${remoteResult.error}', name: 'CurrencyRepository');
        // Only fall back to cache if remote fails
        developer.log('[CurrencyRepository] Trying cached rate as fallback...', name: 'CurrencyRepository');
        final cachedResult = await _cacheService.getCachedRate(
          from: from,
          to: to,
        );
        
        developer.log('[CurrencyRepository] Cached rate result - isSuccess: ${cachedResult.isSuccess}', name: 'CurrencyRepository');
        if (cachedResult.isSuccess) {
          developer.log('[CurrencyRepository] Using cached rate as fallback: ${cachedResult.value!.rateAsDouble}', name: 'CurrencyRepository');
          return Result.success(cachedResult.value!);
        }
        
        // For historical rates, try cache as fallback
        if (at != null) {
          developer.log('[CurrencyRepository] Trying cached historical rates...', name: 'CurrencyRepository');
          final cachedResult = await _cacheService.getCachedHistoricalRates(
            base: from,
            date: at,
          );
          
          developer.log('[CurrencyRepository] Cached historical rates result - isSuccess: ${cachedResult.isSuccess}', name: 'CurrencyRepository');
          if (cachedResult.isSuccess) {
            final rates = cachedResult.value!;
            final rateValue = rates[to.value];
            
            if (rateValue != null) {
              developer.log('[CurrencyRepository] Using cached historical rate: $rateValue', name: 'CurrencyRepository');
              const scale = 6;
              final rateScaled = BigInt.from((rateValue * BigInt.from(10).pow(scale).toDouble()).round());
              final rate = RateModel(
                baseCurrencyCode: from,
                quoteCurrencyCode: to,
                rateScaled: rateScaled,
                rateScale: scale,
                timestamp: at.value,
              );
              return Result.success(rate);
            }
          }
        }
        
        developer.log('[CurrencyRepository] No fallback available, returning error: ${remoteResult.error}', name: 'CurrencyRepository');
        return Result.failure(remoteResult.error!);
      }
    } catch (e) {
      developer.log('[CurrencyRepository] Exception in getRate: $e', name: 'CurrencyRepository');
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  Stream<RateModel>? rateStream({
    required CurrencyCode from,
    required CurrencyCode to,
  }) {
    // Delegate to remote service
    return _apiService.getRateStream(from: from, to: to);
  }

  /// Clear all cached data
  Future<void> clearCache() async {
    await _cacheService.clearCache();
  }

  /// Check if cache is valid
  bool isCacheValid() {
    return _cacheService.isCacheValid();
  }

  @override
  Future<Result<ConversionResultModel, ConversionError>> convertOffline({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
  }) async {
    developer.log('[CurrencyRepository] Converting offline ${amount.toDouble()} ${from.value} to ${to.value}', name: 'CurrencyRepository');
    try {
      // Try to get cached rate first
      final cachedRateResult = await _cacheService.getCachedRate(
        from: from,
        to: to,
      );
      
      developer.log('[CurrencyRepository] Cached rate result - isSuccess: ${cachedRateResult.isSuccess}', name: 'CurrencyRepository');
      if (cachedRateResult.isSuccess) {
        final cachedRate = cachedRateResult.value!;
        developer.log('[CurrencyRepository] Using cached rate for offline conversion: ${cachedRate.rateAsDouble}', name: 'CurrencyRepository');
        
        // Perform conversion using cached rate
        final convertedAmount = amount.toDouble() * cachedRate.rateAsDouble;
        const scale = 6;
        final amountOutScaled = BigInt.from((convertedAmount * BigInt.from(10).pow(scale).toDouble()).round());
        
        final result = ConversionResultModel(
          fromCurrencyCode: from,
          toCurrencyCode: to,
          rateScaled: cachedRate.rateScaled,
          rateScale: cachedRate.rateScale,
          amountInScaled: amount.scaledValue,
          amountScale: amount.scale,
          amountOutScaled: amountOutScaled,
          timestamp: DateTime.now(),
        );
        
        developer.log('[CurrencyRepository] Offline conversion successful: ${result.amountOutAsDouble}', name: 'CurrencyRepository');
        return Result.success(result);
      } else {
        developer.log('[CurrencyRepository] No cached rate available for offline conversion: ${cachedRateResult.error}', name: 'CurrencyRepository');
        return const Result.failure(ConversionError.notFound());
      }
    } catch (e) {
      developer.log('[CurrencyRepository] Exception in offline conversion: $e', name: 'CurrencyRepository');
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void, ConversionError>> initializeCache() async {
    developer.log('[CurrencyRepository] Initializing cache with fresh data...', name: 'CurrencyRepository');
    try {
      // Fetch latest currencies and cache them
      final currenciesResult = await _apiService.fetchCurrencies();
      if (currenciesResult.isSuccess) {
        final currencies = currenciesResult.value!;
        await _cacheService.cacheCurrencies(currencies);
        developer.log('[CurrencyRepository] Cached ${currencies.length} currencies', name: 'CurrencyRepository');
      } else {
        developer.log('[CurrencyRepository] Failed to fetch currencies for cache initialization: ${currenciesResult.error}', name: 'CurrencyRepository');
        return Result.failure(currenciesResult.error!);
      }
      
      // Fetch and cache some common rates
      final commonPairs = [
        {'from': 'USD', 'to': 'EUR'},
        {'from': 'USD', 'to': 'GBP'},
        {'from': 'USD', 'to': 'JPY'},
        {'from': 'USD', 'to': 'CAD'},
        {'from': 'USD', 'to': 'AUD'},
        {'from': 'EUR', 'to': 'GBP'},
        {'from': 'EUR', 'to': 'JPY'},
        {'from': 'EUR', 'to': 'CHF'},
        {'from': 'GBP', 'to': 'JPY'},
        {'from': 'GBP', 'to': 'CHF'},
      ];
      
      int cachedRatesCount = 0;
      for (final pair in commonPairs) {
        try {
          developer.log('[CurrencyRepository] Fetching rate for ${pair['from']}/${pair['to']}...', name: 'CurrencyRepository');
          final rateResult = await _apiService.fetchRate(
            from: CurrencyCode(pair['from']!),
            to: CurrencyCode(pair['to']!),
          );
          if (rateResult.isSuccess) {
            await _cacheService.cacheRate(rateResult.value!);
            cachedRatesCount++;
            developer.log('[CurrencyRepository] Successfully cached rate for ${pair['from']}/${pair['to']}: ${rateResult.value!.rateAsDouble}', name: 'CurrencyRepository');
          } else {
            developer.log('[CurrencyRepository] Failed to fetch rate for ${pair['from']}/${pair['to']}: ${rateResult.error}', name: 'CurrencyRepository');
          }
        } catch (e) {
          // Skip failed rates, continue with others
          developer.log('[CurrencyRepository] Failed to cache rate for ${pair['from']}/${pair['to']}: $e', name: 'CurrencyRepository');
        }
      }
      
      developer.log('[CurrencyRepository] Cache initialization completed - cached $cachedRatesCount rates', name: 'CurrencyRepository');
      return const Result.success(null);
    } catch (e) {
      developer.log('[CurrencyRepository] Exception during cache initialization: $e', name: 'CurrencyRepository');
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  /// Update cache with latest data from API service
  /// This should be called periodically to keep cache fresh
  Future<void> updateCacheWithLatestData() async {
    try {
      developer.log('[CurrencyRepository] Updating cache with latest data...', name: 'CurrencyRepository');
      
      // Fetch latest currencies
      final currenciesResult = await _apiService.fetchCurrencies();
      if (currenciesResult.isSuccess) {
        final currencies = currenciesResult.value!;
        developer.log('[CurrencyRepository] Fetched ${currencies.length} currencies for cache update', name: 'CurrencyRepository');
        
        // Fetch some common rates to keep cache fresh
        final commonPairs = [
          {'from': 'USD', 'to': 'EUR'},
          {'from': 'USD', 'to': 'GBP'},
          {'from': 'USD', 'to': 'JPY'},
          {'from': 'EUR', 'to': 'GBP'},
          {'from': 'EUR', 'to': 'JPY'},
        ];
        
        final rates = <String, RateModel>{};
        for (final pair in commonPairs) {
          try {
            final rateResult = await _apiService.fetchRate(
              from: CurrencyCode(pair['from']!),
              to: CurrencyCode(pair['to']!),
            );
            if (rateResult.isSuccess) {
              rates[rateResult.value!.key] = rateResult.value!;
            }
          } catch (e) {
            // Skip failed rates
          }
        }
        
        // Update cache with latest data
        await _cacheService.updateWithLatestData(
          currencies: currencies,
          rates: rates,
        );
        
        developer.log('[CurrencyRepository] Cache updated with ${currencies.length} currencies and ${rates.length} rates', name: 'CurrencyRepository');
      } else {
        developer.log('[CurrencyRepository] Failed to fetch currencies for cache update: ${currenciesResult.error}', name: 'CurrencyRepository');
      }
    } catch (e) {
      developer.log('[CurrencyRepository] Exception during cache update: $e', name: 'CurrencyRepository');
    }
  }

}

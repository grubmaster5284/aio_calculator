import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Cache service for storing and retrieving currency data locally
/// Acts as backup when remote services are unavailable
class CurrencyCacheService {
  static const String _ratesKey = 'currency_rates';
  static const String _currenciesKey = 'currency_list';
  static const String _lastUpdatedKey = 'currency_last_updated';
  
  final SharedPreferences _prefs;
  final int _cacheTtlSeconds;

  CurrencyCacheService({
    required SharedPreferences prefs,
    int? cacheTtlSeconds,
  }) : _prefs = prefs,
       _cacheTtlSeconds = cacheTtlSeconds ?? 600; // Default 10 minutes

  /// Cache exchange rate
  Future<void> cacheRate(RateModel rate) async {
    try {
      final rates = await getCachedRates();
      rates[rate.key] = rate;
      await _saveRates(rates);
      print('[CurrencyCacheService] Cached rate with key: ${rate.key}, rate: ${rate.rateAsDouble}');
    } catch (e) {
      print('[CurrencyCacheService] Failed to cache rate: $e');
      // Silently fail - caching is not critical
    }
  }

  /// Get cached rate if valid
  Future<Result<RateModel, ConversionError>> getCachedRate({
    required CurrencyCode from,
    required CurrencyCode to,
  }) async {
    try {
      final rates = await getCachedRates();
      final key = '${from.value}_${to.value}';
      final rate = rates[key];
      
      // Debug logging
      print('[CurrencyCacheService] Looking for rate with key: $key');
      print('[CurrencyCacheService] Available rate keys: ${rates.keys.toList()}');
      print('[CurrencyCacheService] Found rate: ${rate != null}');
      
      if (rate != null && _isRateValid(rate)) {
        print('[CurrencyCacheService] Rate is valid: ${rate.rateAsDouble}');
        return Result.success(rate);
      }
      
      print('[CurrencyCacheService] Rate not found or invalid');
      return const Result.failure(ConversionError.notFound());
    } catch (e) {
      print('[CurrencyCacheService] Exception in getCachedRate: $e');
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  /// Cache supported currencies
  Future<void> cacheCurrencies(List<CurrencyModel> currencies) async {
    try {
      final currencyList = currencies.map((c) => {
        'code': c.code.value,
        'name': c.name,
        'symbol': c.symbol,
      }).toList();
      
      await _prefs.setString(_currenciesKey, json.encode(currencyList));
      await _prefs.setInt(_lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      // Silently fail - caching is not critical
    }
  }

  /// Get cached currencies if valid
  Future<Result<List<CurrencyModel>, ConversionError>> getCachedCurrencies() async {
    try {
      final currencyJson = _prefs.getString(_currenciesKey);
      if (currencyJson == null) {
        return const Result.failure(ConversionError.notFound());
      }
      
      final currencyList = json.decode(currencyJson) as List<dynamic>;
      final currencies = currencyList.map((json) {
        return CurrencyModel(
          code: CurrencyCode(json['code']),
          name: json['name'],
          symbol: json['symbol'] ?? '',
        );
      }).toList();
      
      return Result.success(currencies);
    } catch (e) {
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  /// Cache historical rates
  Future<void> cacheHistoricalRates({
    required CurrencyCode base,
    required ConversionDate date,
    required Map<String, double> rates,
  }) async {
    try {
      final key = '${base.value}_${date.value.toIso8601String().split('T')[0]}';
      await _prefs.setString('historical_$key', json.encode(rates));
    } catch (e) {
      // Silently fail - caching is not critical
    }
  }

  /// Get cached historical rates
  Future<Result<Map<String, double>, ConversionError>> getCachedHistoricalRates({
    required CurrencyCode base,
    required ConversionDate date,
  }) async {
    try {
      final key = '${base.value}_${date.value.toIso8601String().split('T')[0]}';
      final ratesJson = _prefs.getString('historical_$key');
      
      if (ratesJson != null) {
        final rates = json.decode(ratesJson) as Map<String, dynamic>;
        final rateMap = rates.map((key, value) => MapEntry(key, value as double));
        return Result.success(rateMap);
      }
      
      return const Result.failure(ConversionError.notFound());
    } catch (e) {
      return Result.failure(ConversionError.unknown(e.toString()));
    }
  }

  /// Clear all cached data
  Future<void> clearCache() async {
    try {
      await _prefs.remove(_ratesKey);
      await _prefs.remove(_currenciesKey);
      await _prefs.remove(_lastUpdatedKey);
      
      // Clear historical data
      final keys = _prefs.getKeys();
      for (final key in keys) {
        if (key.startsWith('historical_')) {
          await _prefs.remove(key);
        }
      }
    } catch (e) {
      // Silently fail
    }
  }

  /// Check if cache is valid
  bool isCacheValid() {
    final lastUpdated = _prefs.getInt(_lastUpdatedKey);
    if (lastUpdated == null) return false;
    
    final now = DateTime.now().millisecondsSinceEpoch;
    final diff = now - lastUpdated;
    return diff < (_cacheTtlSeconds * 1000);
  }

  /// Get all cached rates
  Future<Map<String, RateModel>> getCachedRates() async {
    try {
      final ratesJson = _prefs.getString(_ratesKey);
      if (ratesJson == null) return {};
      
      final ratesMap = json.decode(ratesJson) as Map<String, dynamic>;
      final rates = <String, RateModel>{};
      
      for (final entry in ratesMap.entries) {
        try {
          final rateData = entry.value as Map<String, dynamic>;
          const scale = 6;
          final rateValue = rateData['rate'] as double;
          final rateScaled = BigInt.from((rateValue * BigInt.from(10).pow(scale).toDouble()).round());
          final rate = RateModel(
            baseCurrencyCode: CurrencyCode(rateData['base']),
            quoteCurrencyCode: CurrencyCode(rateData['quote']),
            rateScaled: rateScaled,
            rateScale: scale,
            timestamp: DateTime.parse(rateData['timestamp']),
          );
          rates[entry.key] = rate;
        } catch (e) {
          // Skip invalid entries
        }
      }
      
      return rates;
    } catch (e) {
      return {};
    }
  }

  /// Save rates to cache
  Future<void> _saveRates(Map<String, RateModel> rates) async {
    try {
      final ratesMap = <String, dynamic>{};
      
      for (final entry in rates.entries) {
        final rate = entry.value;
        ratesMap[entry.key] = {
          'base': rate.baseCurrencyCode.value,
          'quote': rate.quoteCurrencyCode.value,
          'rate': rate.rateAsDouble,
          'timestamp': rate.timestamp.toIso8601String(),
        };
      }
      
      await _prefs.setString(_ratesKey, json.encode(ratesMap));
    } catch (e) {
      // Silently fail
    }
  }

  /// Update cache with latest data from API service
  /// This method should be called periodically to keep cache fresh
  Future<void> updateWithLatestData({
    required List<CurrencyModel> currencies,
    required Map<String, RateModel> rates,
  }) async {
    try {
      // Update currencies
      await cacheCurrencies(currencies);
      
      // Update rates
      for (final rate in rates.values) {
        await cacheRate(rate);
      }
      
      // Update last updated timestamp
      await _prefs.setInt(_lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      // Silently fail - cache update is not critical
    }
  }

  /// Check if rate is still valid
  bool _isRateValid(RateModel rate) {
    final now = DateTime.now();
    final diff = now.difference(rate.timestamp);
    return diff.inSeconds < _cacheTtlSeconds;
  }
}

/// Extension to add key generation for RateModel
extension RateModelExtension on RateModel {
  String get key => '${baseCurrencyCode.value}_${quoteCurrencyCode.value}';
}

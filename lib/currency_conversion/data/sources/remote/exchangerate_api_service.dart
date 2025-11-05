import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/currency_conversion/data/sources/remote/currency_service_factory.dart';
import 'package:calculator_online/currency_conversion/data/sources/remote/i_currency_api_service.dart';

/// Exchangerate-api.com service implementation
class ExchangerateApiService implements ICurrencyApiService {
  final http.Client _client;
  final String _baseUrl;
  final String? _apiKey;
  final int _timeout;
  final int _retryAttempts;
  final int _retryDelay;

  ExchangerateApiService({
    http.Client? client,
  }) : _client = client ?? http.Client(),
       _baseUrl = CurrencyServiceFactory.getBaseUrl(),
       _apiKey = CurrencyServiceFactory.getApiKey(),
       _timeout = CurrencyServiceFactory.getTimeout(),
       _retryAttempts = CurrencyServiceFactory.getRetryAttempts(),
       _retryDelay = CurrencyServiceFactory.getRetryDelay();

  @override
  Future<Result<RateModel, ConversionError>> fetchRate({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  }) async {
    try {
      final date = at?.value ?? DateTime.now();
      final dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      final url = at != null 
          ? '$_baseUrl/history/$dateStr/${from.value}'
          : '$_baseUrl/latest/${from.value}';
      
      final response = await _makeRequestWithRetry(() => _client.get(
        Uri.parse(url),
        headers: _getHeaders(),
      ).timeout(Duration(milliseconds: _timeout)));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;
        final rate = rates[to.value] as double?;
        
        if (rate != null) {
          const scale = 6;
          final rateScaled = BigInt.from((rate * BigInt.from(10).pow(scale).toDouble()).round());
          final rateModel = RateModel(
            baseCurrencyCode: from,
            quoteCurrencyCode: to,
            rateScaled: rateScaled,
            rateScale: scale,
            timestamp: DateTime.parse(data['date'] ?? DateTime.now().toIso8601String()),
          );
          return Result.success(rateModel);
        } else {
          return const Result.failure(ConversionError.notFound());
        }
      } else {
        return Result.failure(_mapHttpError(response.statusCode));
      }
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<ConversionResultModel, ConversionError>> fetchConversion({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  }) async {
    try {
      final rateResult = await fetchRate(from: from, to: to, at: at);
      if (rateResult.isSuccess) {
        final rate = rateResult.value!;
        final convertedAmount = amount.toDouble() * rate.rateAsDouble;
        const scale = 6;
        final amountOutScaled = BigInt.from((convertedAmount * BigInt.from(10).pow(scale).toDouble()).round());
        
        final result = ConversionResultModel(
          fromCurrencyCode: from,
          toCurrencyCode: to,
          rateScaled: rate.rateScaled,
          rateScale: rate.rateScale,
          amountInScaled: amount.scaledValue,
          amountScale: amount.scale,
          amountOutScaled: amountOutScaled,
          timestamp: DateTime.now(),
        );
        return Result.success(result);
      } else {
        return Result.failure(rateResult.error!);
      }
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<List<CurrencyModel>, ConversionError>> fetchCurrencies() async {
    try {
      // Exchangerate-api.com doesn't have a symbols endpoint
      // Instead, we'll use the rates endpoint to get available currencies
      final response = await _makeRequestWithRetry(() => _client.get(
        Uri.parse('$_baseUrl/latest/USD'),
        headers: _getHeaders(),
      ).timeout(Duration(milliseconds: _timeout)));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;
        
        // Create currency models from the rates keys
        final currencies = rates.keys.map((code) {
          return CurrencyModel(
            code: CurrencyCode(code),
            name: _getCurrencyName(code),
            symbol: _getCurrencySymbol(code),
          );
        }).toList();
        
        return Result.success(currencies);
      } else {
        return Result.failure(_mapHttpError(response.statusCode));
      }
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<Map<String, double>, ConversionError>> fetchHistory({
    required CurrencyCode base,
    required ConversionDate date,
  }) async {
    try {
      final dateStr = '${date.value.year}-${date.value.month.toString().padLeft(2, '0')}-${date.value.day.toString().padLeft(2, '0')}';
      final url = '$_baseUrl/history/$dateStr/${base.value}';
      
      final response = await _makeRequestWithRetry(() => _client.get(
        Uri.parse(url),
        headers: _getHeaders(),
      ).timeout(Duration(milliseconds: _timeout)));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;
        
        final rateMap = rates.map((key, value) => MapEntry(key, value as double));
        return Result.success(rateMap);
      } else {
        return Result.failure(_mapHttpError(response.statusCode));
      }
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Stream<RateModel>? getRateStream({
    required CurrencyCode from,
    required CurrencyCode to,
  }) {
    // Exchangerate-api doesn't support WebSocket streams
    return null;
  }

  Map<String, String> _getHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    
    // Exchangerate-api.com free tier doesn't require authentication
    // Only add Authorization header if we have a valid API key
    if (_apiKey != null && _apiKey != 'free' && _apiKey?.isNotEmpty == true) {
      headers['Authorization'] = 'Bearer $_apiKey';
    }
    
    return headers;
  }

  Future<http.Response> _makeRequestWithRetry(Future<http.Response> Function() request) async {
    Exception? lastException;
    
    for (int attempt = 0; attempt < _retryAttempts; attempt++) {
      try {
        final response = await request();
        if (response.statusCode < 500) {
          return response;
        }
        lastException = HttpException('Server error: ${response.statusCode}');
      } catch (e) {
        lastException = e is Exception ? e : Exception(e.toString());
      }
      
      if (attempt < _retryAttempts - 1) {
        await Future.delayed(Duration(milliseconds: _retryDelay * (attempt + 1)));
      }
    }
    
    throw lastException ?? Exception('Request failed after $_retryAttempts attempts');
  }

  ConversionError _mapHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return const ConversionError.invalidInput('Bad request');
      case 401:
        return const ConversionError.unauthorized();
      case 403:
        return const ConversionError.forbidden();
      case 404:
        return const ConversionError.notFound();
      case 429:
        return const ConversionError.tooManyRequests();
      case 500:
      case 502:
      case 503:
      case 504:
        return const ConversionError.networkError('Server error');
      default:
        return ConversionError.unknown('HTTP $statusCode');
    }
  }

  ConversionError _mapException(dynamic exception) {
    if (exception is SocketException) {
      return ConversionError.networkError(exception.message);
    } else if (exception is HttpException) {
      return ConversionError.networkError(exception.message);
    } else if (exception.toString().contains('timeout')) {
      return const ConversionError.timeout();
    } else {
      return ConversionError.unknown(exception.toString());
    }
  }

  String _getCurrencyName(String code) {
    const names = {
      'USD': 'US Dollar',
      'EUR': 'Euro',
      'GBP': 'British Pound',
      'JPY': 'Japanese Yen',
      'AUD': 'Australian Dollar',
      'CAD': 'Canadian Dollar',
      'CHF': 'Swiss Franc',
      'CNY': 'Chinese Yuan',
      'INR': 'Indian Rupee',
      'BRL': 'Brazilian Real',
      'RUB': 'Russian Ruble',
      'KRW': 'South Korean Won',
      'MXN': 'Mexican Peso',
      'SGD': 'Singapore Dollar',
      'HKD': 'Hong Kong Dollar',
      'NZD': 'New Zealand Dollar',
      'NOK': 'Norwegian Krone',
      'SEK': 'Swedish Krona',
      'DKK': 'Danish Krone',
      'PLN': 'Polish Zloty',
      'CZK': 'Czech Koruna',
      'HUF': 'Hungarian Forint',
      'ILS': 'Israeli Shekel',
      'TRY': 'Turkish Lira',
      'ZAR': 'South African Rand',
      'THB': 'Thai Baht',
    };
    return names[code] ?? code;
  }

  String _getCurrencySymbol(String code) {
    const symbols = {
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
      'JPY': '¥',
      'AUD': 'A\$',
      'CAD': 'C\$',
      'CHF': 'CHF',
      'CNY': '¥',
      'INR': '₹',
      'BRL': 'R\$',
      'RUB': '₽',
      'KRW': '₩',
      'MXN': 'Mex\$',
      'SGD': 'S\$',
      'HKD': 'HK\$',
      'NZD': 'NZ\$',
      'NOK': 'kr',
      'SEK': 'kr',
      'DKK': 'kr',
      'PLN': 'zł',
      'CZK': 'Kč',
      'HUF': 'Ft',
      'ILS': '₪',
      'TRY': '₺',
      'ZAR': 'R',
      'THB': '฿',
    };
    return symbols[code] ?? code;
  }
}

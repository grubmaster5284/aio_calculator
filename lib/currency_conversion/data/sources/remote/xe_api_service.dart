import 'dart:developer' as developer;
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

/// XE Currency Data API v1 implementation
/// Docs: https://xecdapi.xe.com/docs/v1
class XeApiService implements ICurrencyApiService {
  final http.Client _client;
  final String _baseUrl;
  final String? _accountId;
  final String? _apiKey;
  final int _timeout;
  final int _retryAttempts;
  final int _retryDelay;

  XeApiService({ http.Client? client })
      : _client = client ?? http.Client(),
        _baseUrl = CurrencyServiceFactory.getBaseUrl(),
        _accountId = CurrencyServiceFactory.getXeAccountId(),
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
      // Debug logging
      developer.log('[XE API] Fetching rate from ${from.value} to ${to.value}', name: 'XeApiService');
      developer.log('[XE API] Base URL: $_baseUrl', name: 'XeApiService');
      developer.log('[XE API] Account ID: $_accountId', name: 'XeApiService');
      developer.log('[XE API] API Key: ${_apiKey?.substring(0, 4)}...', name: 'XeApiService');
      
      // Use the correct XE API endpoint for live rates
      // Use convert_from.json without date parameter for live rates
      final uri = Uri.parse('$_baseUrl/convert_from.json').replace(queryParameters: {
        'from': from.value,
        'to': to.value,
        'amount': '1',
      });
      developer.log('[XE API] Request URI: $uri', name: 'XeApiService');

      final response = await _makeRequestWithRetry(() => _client
          .get(uri, headers: _getHeaders())
          .timeout(Duration(milliseconds: _timeout)));

      developer.log('[XE API] Response status: ${response.statusCode}', name: 'XeApiService');
      developer.log('[XE API] Response body: ${response.body}', name: 'XeApiService');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        developer.log('[XE API] Parsed data: $data', name: 'XeApiService');
        
        // Handle different XE API response formats
        double? rate;
        
        if (data.containsKey('to') && data['to'] is List) {
          // Format: { "to": [{"quotecurrency":"EUR","mid":0.92}] }
          final toList = (data['to'] as List).cast<Map<String, dynamic>>();
          developer.log('[XE API] To list: $toList', name: 'XeApiService');
          
          final mid = toList.isNotEmpty ? (toList.first['mid'] as num?)?.toDouble() : null;
          developer.log('[XE API] Mid value: $mid', name: 'XeApiService');
          rate = mid;
        } else if (data.containsKey('rates') && data['rates'] is Map) {
          // Format: { "rates": { "EUR": 0.92 } }
          final rates = data['rates'] as Map<String, dynamic>;
          rate = (rates[to.value] as num?)?.toDouble();
          developer.log('[XE API] Rate from rates map: $rate', name: 'XeApiService');
        } else if (data.containsKey('quotes') && data['quotes'] is Map) {
          // Format: { "quotes": { "USDEUR": 0.92 } }
          final quotes = data['quotes'] as Map<String, dynamic>;
          final quoteKey = '${from.value}${to.value}';
          rate = (quotes[quoteKey] as num?)?.toDouble();
          developer.log('[XE API] Rate from quotes: $rate', name: 'XeApiService');
        }
        
        if (rate != null) {
          const scale = 6;
          final rateScaled = BigInt.from((rate * BigInt.from(10).pow(scale).toDouble()).round());
          final now = DateTime.now();
          
          developer.log('[XE API] Final rate: $rate (1 ${from.value} = $rate ${to.value})', name: 'XeApiService');
          
          return Result.success(RateModel(
            baseCurrencyCode: from,
            quoteCurrencyCode: to,
            rateScaled: rateScaled,
            rateScale: scale,
            timestamp: now,
          ));
        }
        return const Result.failure(ConversionError.notFound());
      }

      return Result.failure(_mapHttpError(response.statusCode));
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
      // Debug logging
      developer.log('[XE API] Converting ${amount.toDouble()} ${from.value} to ${to.value}', name: 'XeApiService');
      
      final date = at?.value;
      final query = <String, String>{
        'from': from.value,
        'to': to.value,
        'amount': amount.toDouble().toString(), // Use actual amount for conversion
        if (date != null)
          'date': '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
      };
      
      final uri = Uri.parse('$_baseUrl/convert_from.json').replace(queryParameters: query);
      developer.log('[XE API] Request URI: $uri', name: 'XeApiService');
      
      final response = await _makeRequestWithRetry(() => _client
          .get(uri, headers: _getHeaders())
          .timeout(Duration(milliseconds: _timeout)));
      
      developer.log('[XE API] Response status: ${response.statusCode}', name: 'XeApiService');
      developer.log('[XE API] Response body: ${response.body}', name: 'XeApiService');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        // XE returns { "amount": 10, "from": "USD", "to": [{"quotecurrency":"EUR","mid":9.2}] }
        final toList = (data['to'] as List).cast<Map<String, dynamic>>();
        final mid = toList.isNotEmpty ? (toList.first['mid'] as num?)?.toDouble() : null;
        
        if (mid != null) {
          const scale = 6;
          // The 'mid' value from XE API is the converted amount (e.g., 10 USD = 9.2 EUR)
          // Calculate the exchange rate: rate = converted_amount / original_amount
          final apiAmount = (data['amount'] as num).toDouble();
          final rate = mid / apiAmount;
          final rateScaled = BigInt.from((rate * BigInt.from(10).pow(scale).toDouble()).round());
          
          // The mid value is the converted amount in the target currency
          final amountOutScaled = BigInt.from((mid * BigInt.from(10).pow(scale).toDouble()).round());
          
          return Result.success(ConversionResultModel(
            fromCurrencyCode: from,
            toCurrencyCode: to,
            rateScaled: rateScaled,
            rateScale: scale,
            amountInScaled: amount.scaledValue,
            amountScale: amount.scale,
            amountOutScaled: amountOutScaled,
            timestamp: DateTime.now(),
          ));
        }
        return const Result.failure(ConversionError.notFound());
      }
      
      return Result.failure(_mapHttpError(response.statusCode));
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<List<CurrencyModel>, ConversionError>> fetchCurrencies() async {
    try {
      // XE provides a /currencies endpoint in some plans; fallback to common ISO list is out of scope
      final uri = Uri.parse('$_baseUrl/currencies.json');
      final response = await _makeRequestWithRetry(() => _client
          .get(uri, headers: _getHeaders())
          .timeout(Duration(milliseconds: _timeout)));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        developer.log('[XE API] Currencies response: $data', name: 'XeApiService');
        
        // Handle different response formats from XE API
        List<CurrencyModel> currencies = [];
        
        if (data.containsKey('currencies') && data['currencies'] is Map<String, dynamic>) {
          // Format: {"currencies": {"USD": "US Dollar", "EUR": "Euro"}}
          final map = data['currencies'] as Map<String, dynamic>;
          currencies = map.entries
              .map((e) {
                try {
                  final name = e.value as String?;
                  if (name == null) {
                    developer.log('[XE API] Skipping currency with null name: ${e.key}', name: 'XeApiService');
                    return null;
                  }
                  return CurrencyModel(code: CurrencyCode(e.key), name: name, symbol: '');
                } catch (error) {
                  developer.log('[XE API] Error parsing currency ${e.key}: $error', name: 'XeApiService');
                  return null;
                }
              })
              .where((currency) => currency != null)
              .cast<CurrencyModel>()
              .toList();
        } else if (data.containsKey('currencies') && data['currencies'] is List) {
          // Format: {"currencies": [{"iso": "USD", "currency_name": "US Dollar"}]}
          final list = data['currencies'] as List<dynamic>;
          currencies = list
              .map((item) {
                try {
                  final currencyData = item as Map<String, dynamic>;
                  final code = currencyData['iso'] as String?;
                  final name = currencyData['currency_name'] as String?;
                  final symbol = currencyData['symbol'] as String?;
                  
                  if (code == null || name == null) {
                    developer.log('[XE API] Skipping currency with null code or name: $currencyData', name: 'XeApiService');
                    return null;
                  }
                  
                  return CurrencyModel(
                    code: CurrencyCode(code),
                    name: name,
                    symbol: symbol ?? '',
                  );
                } catch (e) {
                  developer.log('[XE API] Error parsing currency item: $item, error: $e', name: 'XeApiService');
                  return null;
                }
              })
              .where((currency) => currency != null)
              .cast<CurrencyModel>()
              .toList();
        } else {
          // If no currencies field, return empty list
          developer.log('[XE API] No currencies found in response', name: 'XeApiService');
          currencies = [];
        }
        
        developer.log('[XE API] Parsed ${currencies.length} currencies', name: 'XeApiService');
        return Result.success(currencies);
      }
      return Result.failure(_mapHttpError(response.statusCode));
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
      final query = <String, String>{
        'from': base.value,
        'amount': '1', // XE API requires an amount parameter
        'date': '${date.value.year}-${date.value.month.toString().padLeft(2, '0')}-${date.value.day.toString().padLeft(2, '0')}',
      };
      final uri = Uri.parse('$_baseUrl/historic_rate/period.json').replace(queryParameters: query);
      final response = await _makeRequestWithRetry(() => _client
          .get(uri, headers: _getHeaders())
          .timeout(Duration(milliseconds: _timeout)));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final rates = (data['to'] as List?)?.cast<Map<String, dynamic>>() ?? <Map<String, dynamic>>[];
        final map = <String, double>{};
        for (final entry in rates) {
          final code = entry['quotecurrency'] as String?;
          final mid = (entry['mid'] as num?)?.toDouble();
          if (code != null && mid != null) {
            map[code] = mid;
          }
        }
        return Result.success(map);
      }
      return Result.failure(_mapHttpError(response.statusCode));
    } catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Stream<RateModel>? getRateStream({ required CurrencyCode from, required CurrencyCode to }) {
    return null; // XE v1 does not provide websockets
  }

  Map<String, String> _getHeaders() {
    // XE v1 uses HTTP Basic Auth; some endpoints also accept it via headers
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': _basicAuthHeader(),
    };
    developer.log('[XE API] Headers: $headers', name: 'XeApiService');
    return headers;
  }

  String _basicAuthHeader() {
    final username = _accountId ?? '';
    final password = _apiKey ?? '';
    final auth = base64Encode(utf8.encode('$username:$password'));
    developer.log('[XE API] Basic auth - username: $username, password length: ${password.length}', name: 'XeApiService');
    return 'Basic $auth';
  }

  Future<http.Response> _makeRequestWithRetry(Future<http.Response> Function() request) async {
    Exception? lastException;
    for (int attempt = 0; attempt < _retryAttempts; attempt++) {
      developer.log('[XE API] Attempt ${attempt + 1}/$_retryAttempts', name: 'XeApiService');
      try {
        final response = await request();
        developer.log('[XE API] Response received - status: ${response.statusCode}', name: 'XeApiService');
        if (response.statusCode < 500) {
          return response;
        }
        developer.log('[XE API] Server error: ${response.statusCode}', name: 'XeApiService');
        lastException = HttpException('Server error: ${response.statusCode}');
      } catch (e) {
        developer.log('[XE API] Request failed: $e', name: 'XeApiService');
        lastException = e is Exception ? e : Exception(e.toString());
      }
      if (attempt < _retryAttempts - 1) {
        final delay = _retryDelay * (attempt + 1);
        developer.log('[XE API] Retrying in ${delay}ms...', name: 'XeApiService');
        await Future.delayed(Duration(milliseconds: delay));
      }
    }
    developer.log('[XE API] All retry attempts failed', name: 'XeApiService');
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
}



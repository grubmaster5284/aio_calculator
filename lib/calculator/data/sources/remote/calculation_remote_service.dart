import 'dart:async';

import 'package:calculator_online/calculator/data/constants/calculation_api_keys.dart';
import 'package:calculator_online/calculator/data/dtos/calculation_function_dto.dart';
import 'package:calculator_online/calculator/data/dtos/calculation_result_dto.dart';
import 'package:calculator_online/calculator/domain/errors/calculation_error.dart';
import 'package:calculator_online/core/result.dart';

/// Minimal HTTP client contract to decouple from specific libraries.
abstract class HttpClient {
  Future<Map<String, dynamic>> get(String url, {Map<String, String>? headers});
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
}

/// Remote service handling raw HTTP calls, retries, and error mapping.
class CalculationRemoteService {
  CalculationRemoteService(this._client);

  final HttpClient _client;

  static const Duration _timeout = Duration(seconds: 10);
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(milliseconds: 600);

  Future<Result<List<CalculationFunctionDto>, CalculationError>> getFunctions() async {
    return _retryOperation<List<CalculationFunctionDto>>(() async {
      try {
        final response = await _client
            .get('${CalculationApiKeys.baseUrl}${CalculationApiKeys.functionsEndpoint}')
            .timeout(_timeout);
        final data = response['data'] as List<dynamic>? ?? <dynamic>[];
        final dtos = data
            .whereType<Map<String, dynamic>>()
            .map((e) => CalculationFunctionDto.fromJson(e))
            .toList(growable: false);
        return Result.success(dtos);
      } on TimeoutException {
        return const Result.failure(CalculationError.timeout());
      } catch (e) {
        return Result.failure(CalculationError.unknown(e.toString()));
      }
    });
  }

  Future<Result<CalculationFunctionDto, CalculationError>> getFunctionById(String id) async {
    return _retryOperation<CalculationFunctionDto>(() async {
      try {
        final response = await _client
            .get('${CalculationApiKeys.baseUrl}${CalculationApiKeys.functionById(id)}')
            .timeout(_timeout);
        final data = response['data'] as Map<String, dynamic>?;
        if (data == null) {
          return const Result.failure(CalculationError.notFound());
        }
        return Result.success(CalculationFunctionDto.fromJson(data));
      } on TimeoutException {
        return const Result.failure(CalculationError.timeout());
      } catch (e) {
        return Result.failure(CalculationError.unknown(e.toString()));
      }
    });
  }

  Future<Result<CalculationResultDto, CalculationError>> execute({
    required String functionId,
    required Map<String, dynamic> inputs,
  }) async {
    return _retryOperation<CalculationResultDto>(() async {
      try {
        final response = await _client
            .post(
              '${CalculationApiKeys.baseUrl}${CalculationApiKeys.executeEndpoint}',
              body: <String, dynamic>{
                'function_id': functionId,
                'inputs': inputs,
              },
            )
            .timeout(_timeout);
        final data = response['data'] as Map<String, dynamic>?;
        if (data == null) {
          return const Result.failure(CalculationError.invalidInput('Empty response'));
        }
        return Result.success(CalculationResultDto.fromJson(data));
      } on TimeoutException {
        return const Result.failure(CalculationError.timeout());
      } catch (e) {
        return Result.failure(CalculationError.unknown(e.toString()));
      }
    });
  }

  Future<Result<T, CalculationError>> _retryOperation<T>(
    Future<Result<T, CalculationError>> Function() operation,
  ) async {
    Result<T, CalculationError> lastResult =
        const Result.failure(CalculationError.unknown('Uninitialized'));
    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      lastResult = await operation();
      if (lastResult.isSuccess) return lastResult;
      if (attempt < _maxRetries) {
        await Future.delayed(_retryDelay * attempt);
      }
    }
    return lastResult;
  }
}



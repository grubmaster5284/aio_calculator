import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:calculator_online/calculator/data/sources/remote/calculation_remote_service.dart';
import 'package:calculator_online/calculator/data/repositories/calculation_repository_impl.dart';
import 'package:calculator_online/calculator/domain/repositories/i_calculation_repository.dart';
import 'package:calculator_online/calculator/data/services/calculator_engine_service.dart';

/// HTTP client implementation using the http package
class HttpClientImpl implements HttpClient {
  final http.Client _client;

  HttpClientImpl(this._client);

  @override
  Future<Map<String, dynamic>> get(String url, {Map<String, String>? headers}) async {
    final uri = Uri.parse(url);
    final response = await _client.get(uri, headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(url);
    final response = await _client.post(
      uri,
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }
}

/// Dependency injection container for calculator feature
class CalculatorDI {
  CalculatorDI._(); // Private constructor

  /// HTTP client provider
  static final httpClientProvider = Provider<HttpClient>((ref) {
    return HttpClientImpl(http.Client());
  });

  /// Calculation remote service provider
  static final calculationRemoteServiceProvider = Provider<CalculationRemoteService>((ref) {
    final client = ref.watch(httpClientProvider);
    return CalculationRemoteService(client);
  });

  /// Calculation repository provider
  static final calculationRepositoryProvider = Provider<ICalculationRepository>((ref) {
    final remoteService = ref.watch(calculationRemoteServiceProvider);
    return CalculationRepositoryImpl(remoteService);
  });

  /// Calculator engine service provider
  static final calculatorEngineServiceProvider = Provider<CalculatorEngineService>((ref) {
    return const CalculatorEngineService();
  });
}


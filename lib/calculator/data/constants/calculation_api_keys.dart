/// API paths and endpoints for the Calculation feature.
/// No real secrets should be kept here. Use environment variables or
/// CI-provided secrets for real API keys.
abstract class CalculationApiKeys {
  static const String baseUrl = 'https://api.example.com';
  static const String functionsEndpoint = '/functions';
  static const String executeEndpoint = '/execute';

  static String functionById(String id) => '$functionsEndpoint/$id';
}



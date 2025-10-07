import 'dart:developer' as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'exchangerate_api_service.dart';
import 'xe_api_service.dart';
import 'i_currency_api_service.dart';

/// Factory for creating currency service instances based on environment configuration
class CurrencyServiceFactory {
  static const String _defaultProvider = 'exchangerate_api';
  
  /// Supported service providers
  static const List<String> supportedProviders = [
    'exchangerate_api',
    'xe',
  ];

  /// Create currency service based on environment configuration
  static ICurrencyApiService createService() {
    final provider = _getServiceProvider();
    developer.log('[CurrencyServiceFactory] Creating service for provider: $provider', name: 'CurrencyServiceFactory');
    
    switch (provider) {
      case 'exchangerate_api':
        developer.log('[CurrencyServiceFactory] Creating ExchangerateApiService', name: 'CurrencyServiceFactory');
        return ExchangerateApiService();
      case 'xe':
        developer.log('[CurrencyServiceFactory] Creating XeApiService', name: 'CurrencyServiceFactory');
        return XeApiService();
      default:
        developer.log('[CurrencyServiceFactory] Using default ExchangerateApiService', name: 'CurrencyServiceFactory');
        // Default to exchangerate-api for reliable real-time data
        return ExchangerateApiService();
    }
  }

  /// Get service provider from environment
  static String _getServiceProvider() {
    try {
      final provider = dotenv.env['CURRENCY_SERVICE_PROVIDER'];
      developer.log('[CurrencyServiceFactory] Environment CURRENCY_SERVICE_PROVIDER: $provider', name: 'CurrencyServiceFactory');
      developer.log('[CurrencyServiceFactory] Supported providers: $supportedProviders', name: 'CurrencyServiceFactory');
      
      // Normalize the provider to lowercase for case-insensitive comparison
      final normalizedProvider = provider?.toLowerCase();
      developer.log('[CurrencyServiceFactory] Normalized provider: $normalizedProvider', name: 'CurrencyServiceFactory');
      
      if (normalizedProvider != null && supportedProviders.contains(normalizedProvider)) {
        developer.log('[CurrencyServiceFactory] Using provider from environment: $normalizedProvider', name: 'CurrencyServiceFactory');
        return normalizedProvider;
      } else {
        developer.log('[CurrencyServiceFactory] Provider "$normalizedProvider" not supported or null, using default: $_defaultProvider', name: 'CurrencyServiceFactory');
      }
    } catch (e) {
      developer.log('[CurrencyServiceFactory] Error loading environment: $e', name: 'CurrencyServiceFactory');
      // Fallback to default if .env is not loaded
    }
    developer.log('[CurrencyServiceFactory] Using default provider: $_defaultProvider', name: 'CurrencyServiceFactory');
    return _defaultProvider;
  }

  /// Get API key for the current service provider
  static String? getApiKey() {
    final provider = _getServiceProvider();
    developer.log('[CurrencyServiceFactory] Provider: $provider', name: 'CurrencyServiceFactory');
    
    switch (provider) {
      case 'exchangerate_api':
        final key = dotenv.env['EXCHANGERATE_API_KEY'];
        developer.log('[CurrencyServiceFactory] EXCHANGERATE_API_KEY: ${key != null && key.length >= 4 ? '${key.substring(0, 4)}...' : key}', name: 'CurrencyServiceFactory');
        return key;
      case 'xe':
        final key = dotenv.env['XE_API_KEY'];
        developer.log('[CurrencyServiceFactory] XE_API_KEY: ${key != null && key.length >= 4 ? '${key.substring(0, 4)}...' : key}', name: 'CurrencyServiceFactory');
        return key;
      default:
        return null;
    }
  }

  /// Get base URL for the current service provider
  static String getBaseUrl() {
    final provider = _getServiceProvider();
    
    switch (provider) {
      case 'exchangerate_api':
        return dotenv.env['EXCHANGERATE_API_BASE_URL'] ?? 
               'https://api.exchangerate-api.com/v4';
      case 'xe':
        return dotenv.env['XE_API_BASE_URL'] ?? 'https://xecdapi.xe.com/v1';
      default:
        return 'https://api.exchangerate-api.com/v4';
    }
  }

  /// Get timeout configuration
  static int getTimeout() {
    final timeout = dotenv.env['CURRENCY_TIMEOUT'];
    return timeout != null ? int.tryParse(timeout) ?? 10000 : 10000;
  }

  /// Get retry configuration
  static int getRetryAttempts() {
    final attempts = dotenv.env['CURRENCY_RETRY_ATTEMPTS'];
    return attempts != null ? int.tryParse(attempts) ?? 3 : 3;
  }

  /// Get retry delay configuration
  static int getRetryDelay() {
    final delay = dotenv.env['CURRENCY_RETRY_DELAY'];
    return delay != null ? int.tryParse(delay) ?? 2000 : 2000;
  }

  /// XE-specific helpers
  static String? getXeAccountId() {
    final accountId = dotenv.env['XE_ACCOUNT_ID'];
    developer.log('[CurrencyServiceFactory] XE_ACCOUNT_ID: ${accountId?.substring(0, 4)}...', name: 'CurrencyServiceFactory');
    return accountId;
  }
}

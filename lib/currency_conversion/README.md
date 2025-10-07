# Currency Conversion Module Architecture

## Overview
The currency conversion module has been refactored to use a modular architecture with clear separation of concerns between API services and cache services.

## Architecture

### Services

#### 1. API Services (`ICurrencyApiService`)
- **Purpose**: Handle communication with external currency exchange APIs
- **Primary Service**: Exchangerate-api.com (reliable, free tier)
- **Secondary Service**: XE.com (premium, fallback)
- **Location**: `lib/currency_conversion/data/sources/remote/`

**Key Features:**
- Real-time currency rates
- Currency conversion
- Historical data
- Supported currencies list

#### 2. Cache Service (`CurrencyCacheService`)
- **Purpose**: Local storage and backup when API services are unavailable
- **Location**: `lib/currency_conversion/data/sources/local/currency_cache_service.dart`
- **Storage**: SharedPreferences

**Key Features:**
- Caches exchange rates with TTL (10 minutes default)
- Caches supported currencies
- Caches historical rates
- Automatic cache invalidation
- Offline fallback support

### Repository Pattern

The `CurrencyRepositoryImpl` implements a fallback strategy:

1. **Primary**: Try API service for fresh data
2. **Fallback**: Use cache service if API fails
3. **Cache Update**: Automatically cache successful API responses

### Service Factory

The `CurrencyServiceFactory` manages service creation based on environment configuration:

```dart
// Environment variables
CURRENCY_SERVICE_PROVIDER=exchangerate_api  // or 'xe'
EXCHANGERATE_API_KEY=your_key_here
XE_API_KEY=your_key_here
XE_ACCOUNT_ID=your_account_id
```

### API Keys Configuration

Updated to reflect actual services being used:

```dart
class CurrencyApiKeys {
  // Primary API service (Exchangerate-api.com)
  static const String exchangerateApiKey = 'EXCHANGERATE_API_KEY';
  
  // Secondary API service (XE.com)
  static const String xeApiKey = 'XE_API_KEY';
  static const String xeAccountId = 'XE_ACCOUNT_ID';
  
  // Backup API services (for future use)
  static const String fixerIoApiKey = 'FIXER_IO_API_KEY';
  static const String currencylayerApiKey = 'CURRENCYLAYER_API_KEY';
  static const String alphaVantageApiKey = 'ALPHA_VANTAGE_API_KEY';
  static const String openExchangeRatesApiKey = 'OPEN_EXCHANGE_RATES_API_KEY';
}
```

## Offline-First Strategy

The currency conversion feature now implements an **offline-first strategy** for improved performance:

### 1. **Initial Page Load**
When the currency page is first opened:
- Connects to API service to fetch fresh data
- Populates cache with latest currencies and common exchange rates
- Subsequent operations use cached data for speed

### 2. **Conversion Flow**
- **Primary**: Uses cached data for instant conversions (offline mode)
- **Fallback**: Falls back to API service if cached data is unavailable
- **Cache Update**: Automatically updates cache with fresh data when needed

### 3. **Cache Initialization**
```dart
// Initialize cache with fresh data (called on page load)
await repository.initializeCache();

// Offline conversion using cached data
final result = await repository.convertOffline(
  from: CurrencyCode('USD'),
  to: CurrencyCode('EUR'),
  amount: Amount.fromDecimalString('100'),
);
```

## Usage

### Dependency Injection

```dart
final currencyRepositoryProvider = Provider<ICurrencyRepository>((ref) {
  final apiService = CurrencyServiceFactory.createService();
  final prefs = ref.watch(sharedPreferencesProvider).value;
  final cacheService = CurrencyCacheService(prefs: prefs);
  
  return CurrencyRepositoryImpl(
    apiService: apiService,
    cacheService: cacheService,
  );
});
```

### Cache Management

```dart
// Initialize cache with fresh data (called on page load)
await repository.initializeCache();

// Offline conversion using cached data
final result = await repository.convertOffline(from, to, amount);

// Update cache with latest data
await repository.updateCacheWithLatestData();

// Check cache validity
bool isValid = repository.isCacheValid();

// Clear cache
await repository.clearCache();
```

## Benefits

1. **Modular Design**: Clear separation between API and cache services
2. **Offline-First Performance**: Instant conversions using cached data
3. **Reduced API Calls**: Significant reduction in API usage and costs
4. **Improved User Experience**: Fast, responsive conversions
5. **Offline Support**: Works without internet connection using cached data
6. **Reliability**: Multiple fallback strategies ensure data availability
7. **Maintainability**: Easy to add new API providers or modify cache strategy
8. **Testability**: Services can be mocked independently

## Performance Improvements

- **Initial Load**: One-time API call to populate cache with fresh data
- **Subsequent Conversions**: Instant offline calculations using cached rates
- **Cache Refresh**: Manual refresh button to update cache with latest data
- **Visual Feedback**: UI indicator shows when using cached data for fast conversion

## Service Naming Convention

- **API Services**: `ICurrencyApiService` - Handle external API communication
- **Cache Service**: `CurrencyCacheService` - Handle local storage and backup
- **Repository**: `CurrencyRepositoryImpl` - Orchestrates API and cache services

## Future Enhancements

1. Add more API providers for better redundancy
2. Implement WebSocket streams for real-time rates
3. Add rate limiting and request queuing
4. Implement background cache updates
5. Add analytics for API usage patterns

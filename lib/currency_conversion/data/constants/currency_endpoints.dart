/// Endpoint constants for different currency service providers
class CurrencyEndpoints {
  // Exchangerate-api endpoints
  static const String exchangerateBaseUrl = 'https://api.exchangerate-api.com/v4';
  static const String exchangerateLatest = '/latest';
  static const String exchangerateHistorical = '/history';
  static const String exchangerateSymbols = '/symbols';

  // Fixer.io endpoints
  static const String fixerIoBaseUrl = 'https://api.fixer.io';
  static const String fixerIoLatest = '/latest';
  static const String fixerIoHistorical = '/';
  static const String fixerIoSymbols = '/symbols';

  // Currencylayer endpoints
  static const String currencylayerBaseUrl = 'https://api.currencylayer.com';
  static const String currencylayerLive = '/live';
  static const String currencylayerHistorical = '/historical';
  static const String currencylayerList = '/list';

  // Alpha Vantage endpoints
  static const String alphaVantageBaseUrl = 'https://www.alphavantage.co/query';
  static const String alphaVantageCurrencyExchange = 'function=CURRENCY_EXCHANGE_RATE';
  static const String alphaVantageFxDaily = 'function=FX_DAILY';

  // Open Exchange Rates endpoints
  static const String openExchangeRatesBaseUrl = 'https://openexchangerates.org/api';
  static const String openExchangeRatesLatest = '/latest.json';
  static const String openExchangeRatesHistorical = '/historical';
  static const String openExchangeRatesCurrencies = '/currencies.json';

  /// Build endpoint URL for different services
  static String buildLatestUrl(String baseUrl, String latestPath) {
    return '$baseUrl$latestPath';
  }

  static String buildHistoricalUrl(String baseUrl, String historicalPath, String date) {
    return '$baseUrl$historicalPath/$date';
  }

  static String buildSymbolsUrl(String baseUrl, String symbolsPath) {
    return '$baseUrl$symbolsPath';
  }
}

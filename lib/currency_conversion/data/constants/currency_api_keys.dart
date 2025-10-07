/// API key constants for currency services
/// These are symbolic names only - actual keys should be stored in .env
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

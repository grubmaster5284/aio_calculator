import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Fallback ISO 4217 currency list used when the remote API does not
/// provide a currencies endpoint (e.g., XE plan without /currencies).
final List<CurrencyModel> kDefaultCurrencies = <CurrencyModel>[
  CurrencyModel(code: CurrencyCode('USD'), name: 'US Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('EUR'), name: 'Euro', symbol: '€'),
  CurrencyModel(code: CurrencyCode('GBP'), name: 'British Pound', symbol: '£'),
  CurrencyModel(code: CurrencyCode('JPY'), name: 'Japanese Yen', symbol: '¥'),
  CurrencyModel(code: CurrencyCode('AUD'), name: 'Australian Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('CAD'), name: 'Canadian Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('CHF'), name: 'Swiss Franc', symbol: 'Fr'),
  CurrencyModel(code: CurrencyCode('CNY'), name: 'Chinese Yuan', symbol: '¥'),
  CurrencyModel(code: CurrencyCode('INR'), name: 'Indian Rupee', symbol: '₹'),
  CurrencyModel(code: CurrencyCode('NZD'), name: 'New Zealand Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('SEK'), name: 'Swedish Krona', symbol: 'kr'),
  CurrencyModel(code: CurrencyCode('NOK'), name: 'Norwegian Krone', symbol: 'kr'),
  CurrencyModel(code: CurrencyCode('DKK'), name: 'Danish Krone', symbol: 'kr'),
  CurrencyModel(code: CurrencyCode('SGD'), name: 'Singapore Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('HKD'), name: 'Hong Kong Dollar', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('MXN'), name: 'Mexican Peso', symbol: '\$'),
  CurrencyModel(code: CurrencyCode('BRL'), name: 'Brazilian Real', symbol: 'R\$'),
  CurrencyModel(code: CurrencyCode('ZAR'), name: 'South African Rand', symbol: 'R'),
  CurrencyModel(code: CurrencyCode('RUB'), name: 'Russian Ruble', symbol: '₽'),
  CurrencyModel(code: CurrencyCode('TRY'), name: 'Turkish Lira', symbol: '₺'),
  CurrencyModel(code: CurrencyCode('KRW'), name: 'South Korean Won', symbol: '₩'),
  CurrencyModel(code: CurrencyCode('IDR'), name: 'Indonesian Rupiah', symbol: 'Rp'),
  CurrencyModel(code: CurrencyCode('TWD'), name: 'New Taiwan Dollar', symbol: 'NT\$'),
  CurrencyModel(code: CurrencyCode('THB'), name: 'Thai Baht', symbol: '฿'),
  CurrencyModel(code: CurrencyCode('AED'), name: 'UAE Dirham', symbol: 'د.إ'),
  CurrencyModel(code: CurrencyCode('SAR'), name: 'Saudi Riyal', symbol: '﷼'),
  CurrencyModel(code: CurrencyCode('PLN'), name: 'Polish Zloty', symbol: 'zł'),
  CurrencyModel(code: CurrencyCode('CZK'), name: 'Czech Koruna', symbol: 'Kč'),
  CurrencyModel(code: CurrencyCode('HUF'), name: 'Hungarian Forint', symbol: 'Ft'),
  CurrencyModel(code: CurrencyCode('ILS'), name: 'Israeli New Shekel', symbol: '₪'),
];



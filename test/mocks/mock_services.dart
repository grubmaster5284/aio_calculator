import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

/// Mock currency service for testing
class MockCurrencyService {
  static final List<CurrencyModel> mockCurrencies = [
    CurrencyModel(code: CurrencyCode('USD'), name: 'US Dollar', symbol: '\$'),
    CurrencyModel(code: CurrencyCode('EUR'), name: 'Euro', symbol: '€'),
    CurrencyModel(code: CurrencyCode('GBP'), name: 'British Pound', symbol: '£'),
    CurrencyModel(code: CurrencyCode('JPY'), name: 'Japanese Yen', symbol: '¥'),
  ];

  static final Map<String, double> mockRates = {
    'USD_EUR': 0.85,
    'USD_GBP': 0.73,
    'USD_JPY': 110.0,
    'EUR_USD': 1.18,
    'GBP_USD': 1.37,
    'JPY_USD': 0.009,
  };

  /// Get mock currencies
  static Future<List<CurrencyModel>> getCurrencies() async {
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate network delay
    return mockCurrencies;
  }

  /// Get mock exchange rate
  static Future<RateModel> getRate(String fromCurrency, String toCurrency) async {
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate network delay
    
    final rateKey = '${fromCurrency}_$toCurrency';
    final rate = mockRates[rateKey] ?? 1.0;
    
    return RateModel(
      baseCurrencyCode: CurrencyCode(fromCurrency),
      quoteCurrencyCode: CurrencyCode(toCurrency),
      rateScaled: BigInt.from((rate * 1000000).round()), // Scale to 6 decimal places
      timestamp: DateTime.now(),
    );
  }

  /// Convert currency with mock data
  static Future<ConversionResultModel> convertCurrency(
    String fromCurrency,
    String toCurrency,
    double amount,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate network delay
    
    final rate = await getRate(fromCurrency, toCurrency);
    final convertedAmount = amount * rate.rateAsDouble;
    
    return ConversionResultModel(
      fromCurrencyCode: CurrencyCode(fromCurrency),
      toCurrencyCode: CurrencyCode(toCurrency),
      rateScaled: rate.rateScaled,
      amountInScaled: BigInt.from((amount * 1000000).round()),
      amountOutScaled: BigInt.from((convertedAmount * 1000000).round()),
      timestamp: DateTime.now(),
    );
  }
}

/// Mock calculator engine for testing
class MockCalculatorEngine {
  String _display = '0';
  String _operation = '';
  double _firstNumber = 0;
  double _secondNumber = 0;
  bool _waitingForSecondNumber = false;

  String getDisplay() => _display;

  void press(String key) {
    switch (key) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        _handleNumber(key);
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        _handleOperation(key);
        break;
      case '=':
        _handleEquals();
        break;
      case 'AC':
        _handleClear();
        break;
      case '.':
        _handleDecimal();
        break;
    }
  }

  void _handleNumber(String number) {
    if (_waitingForSecondNumber) {
      _display = number;
      _waitingForSecondNumber = false;
    } else {
      _display = _display == '0' ? number : _display + number;
    }
  }

  void _handleOperation(String operation) {
    _firstNumber = double.parse(_display);
    _operation = operation;
    _waitingForSecondNumber = true;
  }

  void _handleEquals() {
    if (_operation.isNotEmpty) {
      _secondNumber = double.parse(_display);
      double result = 0;
      
      switch (_operation) {
        case '+':
          result = _firstNumber + _secondNumber;
          break;
        case '-':
          result = _firstNumber - _secondNumber;
          break;
        case '*':
          result = _firstNumber * _secondNumber;
          break;
        case '/':
          result = _secondNumber != 0 ? _firstNumber / _secondNumber : 0;
          break;
      }
      
      _display = result.toString();
      _operation = '';
      _waitingForSecondNumber = true;
    }
  }

  void _handleClear() {
    _display = '0';
    _operation = '';
    _firstNumber = 0;
    _secondNumber = 0;
    _waitingForSecondNumber = false;
  }

  void _handleDecimal() {
    if (!_display.contains('.')) {
      _display += '.';
    }
  }
}
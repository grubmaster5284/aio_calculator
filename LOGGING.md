# Logging Framework Documentation

This document describes the logging framework implemented for the Calculator Online Flutter app.

## 🎯 **Overview**

The app uses a centralized logging system that replaces all `print()` and `debugPrint()` statements with a proper logging framework. This provides better debugging capabilities, production-safe logging, and structured log output.

## 📁 **Logging Structure**

```
lib/core/logging/
├── logger.dart           # Main logging utility
└── logging_config.dart   # Logging configuration
```

## 🔧 **Usage**

### **Basic Logging**

```dart
import 'package:calculator_online/core/logging/logger.dart';

// Basic logging
Logger.info('Application started');
Logger.error('Something went wrong', error: exception);
Logger.debug('Debug information');
Logger.warning('Warning message');
```

### **Categorized Logging**

```dart
// Use AppLogger for categorized logging
AppLogger.calculator('User pressed button 5');
AppLogger.currency('Exchange rate updated: 1.25');
AppLogger.graphing('Graph loaded successfully');
AppLogger.webview('Page navigation started');
AppLogger.network('API request completed');
AppLogger.init('App initialization complete');
AppLogger.error('Critical error occurred');
```

## 📊 **Log Levels**

| Level | Description | Production | Development |
|-------|-------------|------------|-------------|
| `debug` | Detailed debugging info | ❌ | ✅ |
| `info` | General information | ❌ | ✅ |
| `warning` | Warning messages | ✅ | ✅ |
| `error` | Error messages | ✅ | ✅ |

## 🏗️ **Architecture**

### **Logger Class**
- Central logging utility
- Handles log levels and formatting
- Production-safe (only logs errors/warnings in production)
- Uses `dart:developer` for better debugging

### **AppLogger Class**
- Convenience methods for common logging patterns
- Pre-configured tags for different app modules
- Simplified API for common use cases

### **LoggingConfig Class**
- Configures the external `logger` package
- Sets up pretty printing for development
- Filters logs based on environment

## 🔄 **Migration from print/debugPrint**

### **Before (❌ Don't do this)**
```dart
print('User pressed button');
debugPrint('[Calculator] Result: $result');
```

### **After (✅ Do this)**
```dart
AppLogger.calculator('User pressed button');
AppLogger.calculator('Result: $result');
```

## 📝 **Best Practices**

### **1. Use Appropriate Log Levels**
```dart
// ✅ Good
Logger.debug('Detailed debugging info');
Logger.info('Normal operation');
Logger.warning('Potential issue');
Logger.error('Something failed');

// ❌ Avoid
Logger.error('Normal operation'); // Too severe
Logger.debug('Critical error'); // Too low level
```

### **2. Use Categorized Logging**
```dart
// ✅ Good - Use AppLogger for common patterns
AppLogger.calculator('Button pressed: $button');
AppLogger.currency('Rate updated: $rate');
AppLogger.graphing('Graph expression: $expression');

// ✅ Good - Use Logger for custom scenarios
Logger.info('Custom operation completed', tag: 'CustomModule');
```

### **3. Include Context**
```dart
// ✅ Good - Include relevant context
AppLogger.currency('Exchange rate updated: $rate for $fromCurrency to $toCurrency');
AppLogger.calculator('Calculation: $expression = $result');

// ❌ Avoid - Too generic
AppLogger.currency('Updated');
AppLogger.calculator('Done');
```

### **4. Handle Errors Properly**
```dart
// ✅ Good - Include error and stack trace
try {
  // Some operation
} catch (e, stackTrace) {
  AppLogger.error('Operation failed: $e', error: e, stackTrace: stackTrace);
}

// ✅ Good - Log the error context
AppLogger.currency('Failed to fetch exchange rates', error: e);
```

## 🚀 **Configuration**

### **Development Mode**
- All log levels are enabled
- Pretty printing with colors and emojis
- Detailed method call information
- Timestamps included

### **Production Mode**
- Only warnings and errors are logged
- Minimal output to reduce performance impact
- No sensitive information in logs

## 🔍 **Debugging**

### **Viewing Logs in Development**
1. **VS Code**: Use the Debug Console
2. **Android Studio**: Use the Logcat
3. **Command Line**: Use `flutter logs`

### **Log Format**
```
CalculatorOnline [Calculator] [INFO] User pressed button 5
CalculatorOnline [Currency] [WARNING] Rate update failed
CalculatorOnline [Error] [ERROR] Critical error: Network timeout
```

## 📦 **Dependencies**

The logging framework uses:
- `dart:developer` - Core logging functionality
- `logger: ^2.0.2` - Enhanced logging features
- `flutter/foundation.dart` - Environment detection

## 🧪 **Testing**

### **Mock Logging in Tests**
```dart
// In test files, you can mock the logger if needed
class MockLogger {
  static void info(String message) {
    // Mock implementation
  }
}
```

### **Test Logging**
```dart
// Use AppLogger in tests for consistency
AppLogger.init('Test setup complete');
AppLogger.calculator('Test calculation performed');
```

## 🔧 **Troubleshooting**

### **Common Issues**

1. **Logs not appearing in production**
   - This is expected behavior
   - Only warnings and errors are logged in production

2. **Too many debug logs**
   - Use appropriate log levels
   - Consider using `Logger.debug()` for detailed debugging only

3. **Performance concerns**
   - Logging is optimized for production
   - Debug logs are disabled in production builds

## 📚 **Examples**

### **Calculator Operations**
```dart
class CalculatorService {
  void performCalculation(String expression) {
    AppLogger.calculator('Starting calculation: $expression');
    
    try {
      final result = _calculate(expression);
      AppLogger.calculator('Calculation completed: $result');
    } catch (e, stackTrace) {
      AppLogger.error('Calculation failed: $e', error: e, stackTrace: stackTrace);
    }
  }
}
```

### **Currency Conversion**
```dart
class CurrencyService {
  Future<void> updateRates() async {
    AppLogger.currency('Starting rate update');
    
    try {
      final rates = await _fetchRates();
      AppLogger.currency('Rates updated successfully: ${rates.length} currencies');
    } catch (e) {
      AppLogger.currency('Rate update failed: $e', error: e);
    }
  }
}
```

### **Graphing Operations**
```dart
class GraphingService {
  void loadGraph(String expression) {
    AppLogger.graphing('Loading graph for expression: $expression');
    
    try {
      _renderGraph(expression);
      AppLogger.graphing('Graph loaded successfully');
    } catch (e) {
      AppLogger.error('Graph loading failed: $e', error: e);
    }
  }
}
```

## 🎯 **Migration Checklist**

- [ ] Replace all `print()` statements with `Logger.info()`
- [ ] Replace all `debugPrint()` statements with `AppLogger.*()`
- [ ] Use appropriate log levels for different scenarios
- [ ] Add context to log messages
- [ ] Handle errors with proper logging
- [ ] Test logging in both development and production modes

---

**Happy Logging! 📝✨**

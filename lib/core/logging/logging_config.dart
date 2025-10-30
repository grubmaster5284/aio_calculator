import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as external_logger;
import 'logger.dart';

/// Logging configuration for the application
class LoggingConfig {
  static external_logger.Logger? _logger;
  
  /// Get the configured logger instance
  static external_logger.Logger get logger {
    _logger ??= _createLogger();
    return _logger!;
  }
  
  /// Create and configure the logger
  static external_logger.Logger _createLogger() {
    return external_logger.Logger(
      printer: external_logger.PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        dateTimeFormat: external_logger.DateTimeFormat.onlyTimeAndSinceStart,
      ),
      filter: _createFilter(),
    );
  }
  
  /// Create log filter based on environment
  static external_logger.LogFilter _createFilter() {
    if (kDebugMode) {
      return DevelopmentFilter();
    } else {
      return ProductionFilter();
    }
  }
  
  /// Initialize logging for the application
  static void initialize() {
    // This method can be called during app initialization
    // to set up any global logging configuration
    if (kDebugMode) {
      AppLogger.init('Logging initialized in debug mode');
    }
  }
}

/// Production log filter - only logs errors and warnings
class ProductionFilter extends external_logger.LogFilter {
  @override
  bool shouldLog(external_logger.LogEvent event) {
    return event.level.index >= external_logger.Level.warning.index;
  }
}

/// Development log filter - logs everything
class DevelopmentFilter extends external_logger.LogFilter {
  @override
  bool shouldLog(external_logger.LogEvent event) {
    return true;
  }
}

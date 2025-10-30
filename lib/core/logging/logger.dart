import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Log levels for the application
enum LogLevel {
  debug,
  info,
  warning,
  error,
}

/// Centralized logging utility for the application
class Logger {
  static const String _appName = 'CalculatorOnline';
  
  /// Log a debug message
  static void debug(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.debug, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  /// Log an info message
  static void info(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.info, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  /// Log a warning message
  static void warning(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  /// Log an error message
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  /// Internal logging method
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final levelName = level.name.toUpperCase();
    final tagPrefix = tag != null ? '[$tag]' : '';
    final logMessage = '$_appName $tagPrefix [$levelName] $message';
    
    // Use developer.log for better debugging in development
    if (kDebugMode) {
      developer.log(
        logMessage,
        name: _appName,
        level: _getLogLevelValue(level),
        error: error,
        stackTrace: stackTrace,
      );
    }
    
    // In production, only log errors and warnings
    if (!kDebugMode && (level == LogLevel.error || level == LogLevel.warning)) {
      developer.log(
        logMessage,
        name: _appName,
        level: _getLogLevelValue(level),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  
  /// Convert LogLevel to developer log level
  static int _getLogLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500; // developer.log level for debug
      case LogLevel.info:
        return 800; // developer.log level for info
      case LogLevel.warning:
        return 900; // developer.log level for warning
      case LogLevel.error:
        return 1000; // developer.log level for error
    }
  }
}

/// Convenience methods for common logging patterns
class AppLogger {
  /// Log calculator operations
  static void calculator(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'Calculator', error: error, stackTrace: stackTrace);
  }
  
  /// Log currency conversion operations
  static void currency(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'Currency', error: error, stackTrace: stackTrace);
  }
  
  /// Log graphing operations
  static void graphing(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'Graphing', error: error, stackTrace: stackTrace);
  }
  
  /// Log webview operations
  static void webview(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'WebView', error: error, stackTrace: stackTrace);
  }
  
  /// Log network operations
  static void network(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'Network', error: error, stackTrace: stackTrace);
  }
  
  /// Log initialization operations
  static void init(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.info(message, tag: 'Init', error: error, stackTrace: stackTrace);
  }
  
  /// Log errors with context
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.error(message, tag: 'Error', error: error, stackTrace: stackTrace);
  }
}

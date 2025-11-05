import 'dart:developer' as developer;
import 'package:logger/logger.dart' as logger_package;

/// Simple logger utility
class Logger {
  static final _logger = logger_package.Logger(
    printer: logger_package.PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      dateTimeFormat: logger_package.DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void debug(String message) {
    developer.log(message, name: 'DEBUG');
    _logger.d(message);
  }

  static void info(String message) {
    developer.log(message, name: 'INFO');
    _logger.i(message);
  }

  static void warning(String message) {
    developer.log(message, name: 'WARNING');
    _logger.w(message);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: 'ERROR',
      error: error,
      stackTrace: stackTrace,
    );
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}

/// Convenience logger with categorized methods
class AppLogger {
  AppLogger._(); // Private constructor

  static void init(String message) {
    Logger.info('[INIT] $message');
  }

  static void calculator(String message) {
    Logger.debug('[CALCULATOR] $message');
  }

  static void currency(String message) {
    Logger.debug('[CURRENCY] $message');
  }

  static void graphing(String message) {
    Logger.debug('[GRAPHING] $message');
  }

  static void webview(String message) {
    Logger.debug('[WEBVIEW] $message');
  }

  static void network(String message) {
    Logger.debug('[NETWORK] $message');
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.error('[ERROR] $message', error: error, stackTrace: stackTrace);
  }
}


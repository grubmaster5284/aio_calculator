#!/usr/bin/env dart

import 'dart:io';

/// Test runner script for the Calculator Online app
/// This script helps run different types of tests and provides test coverage information

void main(List<String> arguments) async {
  stdout.writeln('🧮 Calculator Online - Test Runner');
  stdout.writeln('=====================================');
  stdout.writeln();

  if (arguments.isEmpty) {
    printUsage();
    return;
  }

  switch (arguments[0]) {
    case 'unit':
      await runUnitTests();
      break;
    case 'widget':
      await runWidgetTests();
      break;
    case 'integration':
      await runIntegrationTests();
      break;
    case 'all':
      await runAllTests();
      break;
    case 'coverage':
      await runTestsWithCoverage();
      break;
    case 'help':
      printUsage();
      break;
    default:
      stdout.writeln('❌ Unknown command: ${arguments[0]}');
      printUsage();
  }
}

void printUsage() {
  stdout.writeln('Usage: dart test_runner.dart <command>');
  stdout.writeln();
  stdout.writeln('Commands:');
  stdout.writeln('  unit        - Run unit tests only');
  stdout.writeln('  widget      - Run widget tests only');
  stdout.writeln('  integration - Run integration tests only');
  stdout.writeln('  all         - Run all tests');
  stdout.writeln('  coverage    - Run tests with coverage report');
  stdout.writeln('  help        - Show this help message');
  stdout.writeln();
  stdout.writeln('Examples:');
  stdout.writeln('  dart test_runner.dart unit');
  stdout.writeln('  dart test_runner.dart all');
  stdout.writeln('  dart test_runner.dart coverage');
}

Future<void> runUnitTests() async {
  stdout.writeln('🔬 Running Unit Tests...');
  stdout.writeln();
  
  final result = await Process.run(
    'dart',
    ['test', 'test/unit/', '--reporter=expanded'],
    workingDirectory: Directory.current.path,
  );
  
  stdout.writeln(result.stdout);
  if (result.stderr.isNotEmpty) {
    stdout.writeln('Errors:');
    stdout.writeln(result.stderr);
  }
  
  stdout.writeln();
  stdout.writeln('✅ Unit tests completed with exit code: ${result.exitCode}');
}

Future<void> runWidgetTests() async {
  stdout.writeln('🎨 Running Widget Tests...');
  stdout.writeln();
  
  final result = await Process.run(
    'dart',
    ['test', 'test/calculator/', 'test/currency/', 'test/graphing/', '--reporter=expanded'],
    workingDirectory: Directory.current.path,
  );
  
  stdout.writeln(result.stdout);
  if (result.stderr.isNotEmpty) {
    stdout.writeln('Errors:');
    stdout.writeln(result.stderr);
  }
  
  stdout.writeln();
  stdout.writeln('✅ Widget tests completed with exit code: ${result.exitCode}');
}

Future<void> runIntegrationTests() async {
  stdout.writeln('🔗 Running Integration Tests...');
  stdout.writeln();
  
  final result = await Process.run(
    'dart',
    ['test', 'test/integration/', '--reporter=expanded'],
    workingDirectory: Directory.current.path,
  );
  
  stdout.writeln(result.stdout);
  if (result.stderr.isNotEmpty) {
    stdout.writeln('Errors:');
    stdout.writeln(result.stderr);
  }
  
  stdout.writeln();
  stdout.writeln('✅ Integration tests completed with exit code: ${result.exitCode}');
}

Future<void> runAllTests() async {
  stdout.writeln('🚀 Running All Tests...');
  stdout.writeln();
  
  final result = await Process.run(
    'dart',
    ['test', '--reporter=expanded'],
    workingDirectory: Directory.current.path,
  );
  
  stdout.writeln(result.stdout);
  if (result.stderr.isNotEmpty) {
    stdout.writeln('Errors:');
    stdout.writeln(result.stderr);
  }
  
  stdout.writeln();
  stdout.writeln('✅ All tests completed with exit code: ${result.exitCode}');
}

Future<void> runTestsWithCoverage() async {
  stdout.writeln('📊 Running Tests with Coverage...');
  stdout.writeln();
  
  // Run tests with coverage
  final result = await Process.run(
    'dart',
    ['test', '--coverage=coverage'],
    workingDirectory: Directory.current.path,
  );
  
  stdout.writeln(result.stdout);
  if (result.stderr.isNotEmpty) {
    stdout.writeln('Errors:');
    stdout.writeln(result.stderr);
  }
  
  // Generate coverage report
  if (result.exitCode == 0) {
    stdout.writeln();
    stdout.writeln('📈 Generating coverage report...');
    
    final coverageResult = await Process.run(
      'dart',
      ['run', 'coverage:format_coverage', '--lcov', '--in=coverage', '--out=coverage/lcov.info', '--packages=.dart_tool/package_config.json', '--report-on=lib'],
      workingDirectory: Directory.current.path,
    );
    
    if (coverageResult.exitCode == 0) {
      stdout.writeln('✅ Coverage report generated: coverage/lcov.info');
      stdout.writeln('📊 You can view the coverage report using:');
      stdout.writeln('   - VS Code: Coverage Gutters extension');
      stdout.writeln('   - Command line: genhtml coverage/lcov.info -o coverage/html');
    } else {
      stdout.writeln('❌ Failed to generate coverage report');
      stdout.writeln(coverageResult.stderr);
    }
  }
  
  stdout.writeln();
  stdout.writeln('✅ Coverage tests completed with exit code: ${result.exitCode}');
}
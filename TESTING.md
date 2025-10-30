# Calculator Online - Testing Guide

This document provides a comprehensive guide for testing the Calculator Online Flutter app.

## 🧪 Test Structure

The test suite is organized into several categories:

```
test/
├── calculator/          # Calculator-specific widget tests
├── currency/            # Currency conversion widget tests
├── graphing/            # Graphing feature widget tests
├── unit/                # Unit tests for business logic
├── integration/         # Integration tests
├── mocks/               # Mock services and data
├── test_config.dart     # Test configuration and utilities
└── widget_test.dart     # Main app smoke tests
```

## 🚀 Running Tests

### Using the Test Runner Script

```bash
# Run all tests
dart test_runner.dart all

# Run specific test categories
dart test_runner.dart unit
dart test_runner.dart widget
dart test_runner.dart integration

# Run tests with coverage
dart test_runner.dart coverage
```

### Using Flutter Commands

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/calculator/
flutter test test/currency/
flutter test test/unit/

# Run with coverage
flutter test --coverage=coverage
```

## 📋 Test Categories

### 1. Unit Tests (`test/unit/`)

Test individual components and business logic:

- **Calculator Engine**: Mathematical operations, input handling
- **Currency Service**: Exchange rate calculations, data models
- **State Management**: Provider logic, state transitions

```dart
// Example: test/unit/calculator_engine_test.dart
test('should handle basic addition', () {
  calculatorEngine.press('1');
  calculatorEngine.press('+');
  calculatorEngine.press('2');
  calculatorEngine.press('=');
  expect(calculatorEngine.getDisplay(), '3');
});
```

### 2. Widget Tests (`test/calculator/`, `test/currency/`, `test/graphing/`)

Test UI components and user interactions:

- **Calculator Page**: Button interactions, display updates
- **Currency Page**: Currency selection, amount input, conversion
- **Graphing Page**: Graph loading, error handling

```dart
// Example: test/calculator/calculator_ui_test.dart
testWidgets('Calculator handles button presses', (WidgetTester tester) async {
  await tester.pumpWidget(ProviderScope(child: CalculatorPage()));
  
  await tester.tap(find.text('1'));
  await tester.pump();
  
  await tester.tap(find.text('+'));
  await tester.pump();
  
  await tester.tap(find.text('2'));
  await tester.pump();
  
  await tester.tap(find.text('='));
  await tester.pump();
});
```

### 3. Integration Tests (`test/integration/`)

Test complete user workflows:

- **App Navigation**: Page transitions, routing
- **Feature Integration**: Calculator → Currency → Graphing
- **Orientation Changes**: Landscape/portrait layouts

### 4. Mock Services (`test/mocks/`)

Mock external dependencies for reliable testing:

- **Currency API**: Mock exchange rates and responses
- **Calculator Engine**: Mock mathematical operations
- **SharedPreferences**: Mock local storage

## 🔧 Test Configuration

### SharedPreferences Mocking

```dart
setUp(() async {
  SharedPreferences.setMockInitialValues({});
  sharedPreferences = await SharedPreferences.getInstance();
});
```

### Provider Overrides

```dart
ProviderScope(
  overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ],
  child: const CalculatorApp(),
)
```

## 📊 Coverage Reports

### Generating Coverage

```bash
# Run tests with coverage
flutter test --coverage=coverage

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html
```

### Viewing Coverage

- **VS Code**: Install "Coverage Gutters" extension
- **Command Line**: `genhtml coverage/lcov.info -o coverage/html`
- **Web**: Open `coverage/html/index.html` in browser

## 🐛 Debugging Tests

### Common Issues

1. **Provider Not Found**: Ensure proper ProviderScope wrapping
2. **SharedPreferences Error**: Use mock SharedPreferences in tests
3. **Async Operations**: Use `pumpAndSettle()` for animations
4. **Widget Not Found**: Use `findsOneWidget` vs `findsWidgets`

### Debug Commands

```bash
# Run specific test with verbose output
flutter test test/calculator/calculator_ui_test.dart --verbose

# Run tests with debug output
flutter test --verbose

# Check test dependencies
flutter pub deps
```

## 🎯 Test Best Practices

### 1. Test Organization

- Group related tests using `group()`
- Use descriptive test names
- Keep tests independent and isolated

### 2. Mock External Dependencies

- Mock API calls and network requests
- Use mock SharedPreferences for storage
- Mock time-dependent operations

### 3. Test Data

- Use consistent test data across tests
- Create reusable test utilities
- Keep test data minimal and focused

### 4. Async Testing

- Use `pumpAndSettle()` for animations
- Wait for async operations to complete
- Test loading and error states

## 📈 Continuous Integration

### GitHub Actions Example

```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v3
```

## 🔍 Test Monitoring

### Key Metrics

- **Test Coverage**: Aim for >80% line coverage
- **Test Speed**: Keep individual tests <1 second
- **Test Reliability**: Avoid flaky tests
- **Test Maintenance**: Update tests with code changes

### Coverage Targets

- **Unit Tests**: >90% coverage for business logic
- **Widget Tests**: >80% coverage for UI components
- **Integration Tests**: Cover critical user flows

## 🚨 Troubleshooting

### Dart CLI Issues

If you encounter Dart CLI issues:

```bash
# Clean and rebuild
flutter clean
flutter pub get

# Check Flutter doctor
flutter doctor

# Reinstall Flutter if needed
flutter upgrade
```

### Test Failures

1. **Check test dependencies**: `flutter pub get`
2. **Verify test environment**: `flutter doctor`
3. **Run tests individually**: `flutter test test/specific_test.dart`
4. **Check for async issues**: Use `pumpAndSettle()`

## 📚 Additional Resources

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Widget Testing Guide](https://docs.flutter.dev/cookbook/testing/widget)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)
- [Mockito Documentation](https://pub.dev/packages/mockito)

---

**Happy Testing! 🧪✨**


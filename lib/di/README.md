# Dependency Injection (DI) Container

This directory contains the dependency injection configuration for the calculator application, following clean architecture principles.

## Structure

- `calculator_di.dart` - DI container for calculator module
- `graphing_di.dart` - DI container for graphing module  
- `di_container.dart` - Main export file for all DI containers

## Clean Architecture Compliance

The DI containers ensure that:

1. **Application layer** doesn't directly depend on **data layer** implementations
2. **Domain layer** remains independent of external dependencies
3. **Data layer** dependencies are isolated and injected through interfaces
4. **Dependency inversion** principle is maintained

## Usage

Instead of importing data layer classes directly in application providers, use the DI containers:

```dart
// ❌ Bad - Direct data layer dependency
import 'package:calculator_online/calculator/data/repositories/calculation_repository_impl.dart';

// ✅ Good - Using DI container
import 'package:calculator_online/di/calculator_di.dart';
```

## Benefits

- **Testability**: Easy to mock dependencies for unit tests
- **Maintainability**: Changes to data layer don't affect application layer
- **Flexibility**: Easy to swap implementations
- **Clean Architecture**: Proper separation of concerns

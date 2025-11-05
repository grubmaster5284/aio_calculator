import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

/// Generic state wrapper for async operations
/// Supports initial, loading, success, and failure states
@freezed
class DataState<T> with _$DataState<T> {
  const DataState._(); // Private constructor for extensions

  const factory DataState.initial() = _Initial<T>;
  const factory DataState.loading() = _Loading<T>;
  const factory DataState.success({required T value}) = _Success<T>;
  const factory DataState.failure({required Object error}) = _Failure<T>;
}

/// Extension methods for DataState
extension DataStateExtension<T> on DataState<T> {
  // Convenience getters
  bool get isLoading => maybeWhen(
    loading: () => true,
    orElse: () => false,
  );
  
  bool get isSuccess => maybeWhen(
    success: (_) => true,
    orElse: () => false,
  );
  
  bool get hasFailure => maybeWhen(
    failure: (_) => true,
    orElse: () => false,
  );
  
  bool get isInitial => maybeWhen(
    initial: () => true,
    orElse: () => false,
  );

  // Safe value access
  T? get value => maybeWhen(
    success: (value) => value,
    orElse: () => null,
  );

  // Safe error access
  Object? get error => maybeWhen(
    failure: (error) => error,
    orElse: () => null,
  );
}


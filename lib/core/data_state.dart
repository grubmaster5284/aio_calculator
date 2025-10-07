import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

/// Generic data state for handling loading, success, and failure states
@freezed
class DataState<T> with _$DataState<T> {
  const DataState._(); // Private constructor for extensions

  const factory DataState.initial() = _Initial<T>;
  const factory DataState.loading() = _Loading<T>;
  const factory DataState.success({required T value}) = _Success<T>;
  const factory DataState.failure({required Object error}) = _Failure<T>;

  // Helper getters
  bool get isLoading => this is _Loading<T>;
  bool get isSuccess => this is _Success<T>;
  bool get isFailure => this is _Failure<T>;
  bool get isInitial => this is _Initial<T>;
  bool get hasFailure => isFailure;

  // Data access
  T? get value => whenOrNull(success: (data) => data);
  Object? get error => whenOrNull(failure: (error) => error);
}

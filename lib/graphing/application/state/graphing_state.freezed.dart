// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graphing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphingState {
  bool get isLoading => throw _privateConstructorUsedError;

  /// Current LaTeX expression to render on the graph
  String get currentExpression => throw _privateConstructorUsedError;

  /// Whether expressions panel is visible in the embedded calculator
  bool get showExpressions => throw _privateConstructorUsedError;

  /// Optional error message for failures
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of GraphingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GraphingStateCopyWith<GraphingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphingStateCopyWith<$Res> {
  factory $GraphingStateCopyWith(
          GraphingState value, $Res Function(GraphingState) then) =
      _$GraphingStateCopyWithImpl<$Res, GraphingState>;
  @useResult
  $Res call(
      {bool isLoading,
      String currentExpression,
      bool showExpressions,
      String? errorMessage});
}

/// @nodoc
class _$GraphingStateCopyWithImpl<$Res, $Val extends GraphingState>
    implements $GraphingStateCopyWith<$Res> {
  _$GraphingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentExpression = null,
    Object? showExpressions = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentExpression: null == currentExpression
          ? _value.currentExpression
          : currentExpression // ignore: cast_nullable_to_non_nullable
              as String,
      showExpressions: null == showExpressions
          ? _value.showExpressions
          : showExpressions // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphingStateImplCopyWith<$Res>
    implements $GraphingStateCopyWith<$Res> {
  factory _$$GraphingStateImplCopyWith(
          _$GraphingStateImpl value, $Res Function(_$GraphingStateImpl) then) =
      __$$GraphingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String currentExpression,
      bool showExpressions,
      String? errorMessage});
}

/// @nodoc
class __$$GraphingStateImplCopyWithImpl<$Res>
    extends _$GraphingStateCopyWithImpl<$Res, _$GraphingStateImpl>
    implements _$$GraphingStateImplCopyWith<$Res> {
  __$$GraphingStateImplCopyWithImpl(
      _$GraphingStateImpl _value, $Res Function(_$GraphingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentExpression = null,
    Object? showExpressions = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$GraphingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentExpression: null == currentExpression
          ? _value.currentExpression
          : currentExpression // ignore: cast_nullable_to_non_nullable
              as String,
      showExpressions: null == showExpressions
          ? _value.showExpressions
          : showExpressions // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GraphingStateImpl extends _GraphingState {
  const _$GraphingStateImpl(
      {this.isLoading = false,
      this.currentExpression = '',
      this.showExpressions = true,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;

  /// Current LaTeX expression to render on the graph
  @override
  @JsonKey()
  final String currentExpression;

  /// Whether expressions panel is visible in the embedded calculator
  @override
  @JsonKey()
  final bool showExpressions;

  /// Optional error message for failures
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GraphingState(isLoading: $isLoading, currentExpression: $currentExpression, showExpressions: $showExpressions, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentExpression, currentExpression) ||
                other.currentExpression == currentExpression) &&
            (identical(other.showExpressions, showExpressions) ||
                other.showExpressions == showExpressions) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, currentExpression, showExpressions, errorMessage);

  /// Create a copy of GraphingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphingStateImplCopyWith<_$GraphingStateImpl> get copyWith =>
      __$$GraphingStateImplCopyWithImpl<_$GraphingStateImpl>(this, _$identity);
}

abstract class _GraphingState extends GraphingState {
  const factory _GraphingState(
      {final bool isLoading,
      final String currentExpression,
      final bool showExpressions,
      final String? errorMessage}) = _$GraphingStateImpl;
  const _GraphingState._() : super._();

  @override
  bool get isLoading;

  /// Current LaTeX expression to render on the graph
  @override
  String get currentExpression;

  /// Whether expressions panel is visible in the embedded calculator
  @override
  bool get showExpressions;

  /// Optional error message for failures
  @override
  String? get errorMessage;

  /// Create a copy of GraphingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphingStateImplCopyWith<_$GraphingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

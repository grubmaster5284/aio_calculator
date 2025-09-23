// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculationState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CalculationFunctionModel> get functions =>
      throw _privateConstructorUsedError;
  CalculationResultModel? get lastResult => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationStateCopyWith<CalculationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationStateCopyWith<$Res> {
  factory $CalculationStateCopyWith(
          CalculationState value, $Res Function(CalculationState) then) =
      _$CalculationStateCopyWithImpl<$Res, CalculationState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CalculationFunctionModel> functions,
      CalculationResultModel? lastResult,
      String? errorMessage});

  $CalculationResultModelCopyWith<$Res>? get lastResult;
}

/// @nodoc
class _$CalculationStateCopyWithImpl<$Res, $Val extends CalculationState>
    implements $CalculationStateCopyWith<$Res> {
  _$CalculationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? functions = null,
    Object? lastResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<CalculationFunctionModel>,
      lastResult: freezed == lastResult
          ? _value.lastResult
          : lastResult // ignore: cast_nullable_to_non_nullable
              as CalculationResultModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculationResultModelCopyWith<$Res>? get lastResult {
    if (_value.lastResult == null) {
      return null;
    }

    return $CalculationResultModelCopyWith<$Res>(_value.lastResult!, (value) {
      return _then(_value.copyWith(lastResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculationStateImplCopyWith<$Res>
    implements $CalculationStateCopyWith<$Res> {
  factory _$$CalculationStateImplCopyWith(_$CalculationStateImpl value,
          $Res Function(_$CalculationStateImpl) then) =
      __$$CalculationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CalculationFunctionModel> functions,
      CalculationResultModel? lastResult,
      String? errorMessage});

  @override
  $CalculationResultModelCopyWith<$Res>? get lastResult;
}

/// @nodoc
class __$$CalculationStateImplCopyWithImpl<$Res>
    extends _$CalculationStateCopyWithImpl<$Res, _$CalculationStateImpl>
    implements _$$CalculationStateImplCopyWith<$Res> {
  __$$CalculationStateImplCopyWithImpl(_$CalculationStateImpl _value,
      $Res Function(_$CalculationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? functions = null,
    Object? lastResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CalculationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      functions: null == functions
          ? _value._functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<CalculationFunctionModel>,
      lastResult: freezed == lastResult
          ? _value.lastResult
          : lastResult // ignore: cast_nullable_to_non_nullable
              as CalculationResultModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CalculationStateImpl extends _CalculationState {
  const _$CalculationStateImpl(
      {this.isLoading = false,
      final List<CalculationFunctionModel> functions =
          const <CalculationFunctionModel>[],
      this.lastResult,
      this.errorMessage})
      : _functions = functions,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CalculationFunctionModel> _functions;
  @override
  @JsonKey()
  List<CalculationFunctionModel> get functions {
    if (_functions is EqualUnmodifiableListView) return _functions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_functions);
  }

  @override
  final CalculationResultModel? lastResult;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CalculationState(isLoading: $isLoading, functions: $functions, lastResult: $lastResult, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._functions, _functions) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_functions),
      lastResult,
      errorMessage);

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationStateImplCopyWith<_$CalculationStateImpl> get copyWith =>
      __$$CalculationStateImplCopyWithImpl<_$CalculationStateImpl>(
          this, _$identity);
}

abstract class _CalculationState extends CalculationState {
  const factory _CalculationState(
      {final bool isLoading,
      final List<CalculationFunctionModel> functions,
      final CalculationResultModel? lastResult,
      final String? errorMessage}) = _$CalculationStateImpl;
  const _CalculationState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CalculationFunctionModel> get functions;
  @override
  CalculationResultModel? get lastResult;
  @override
  String? get errorMessage;

  /// Create a copy of CalculationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationStateImplCopyWith<_$CalculationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

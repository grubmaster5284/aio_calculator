// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_calculation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnlineCalculationState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CalculationFunctionModel> get functions =>
      throw _privateConstructorUsedError;
  CalculationResultModel? get lastResult => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineCalculationStateCopyWith<OnlineCalculationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCalculationStateCopyWith<$Res> {
  factory $OnlineCalculationStateCopyWith(OnlineCalculationState value,
          $Res Function(OnlineCalculationState) then) =
      _$OnlineCalculationStateCopyWithImpl<$Res, OnlineCalculationState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CalculationFunctionModel> functions,
      CalculationResultModel? lastResult,
      String? errorMessage});

  $CalculationResultModelCopyWith<$Res>? get lastResult;
}

/// @nodoc
class _$OnlineCalculationStateCopyWithImpl<$Res,
        $Val extends OnlineCalculationState>
    implements $OnlineCalculationStateCopyWith<$Res> {
  _$OnlineCalculationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$OnlineCalculationStateImplCopyWith<$Res>
    implements $OnlineCalculationStateCopyWith<$Res> {
  factory _$$OnlineCalculationStateImplCopyWith(
          _$OnlineCalculationStateImpl value,
          $Res Function(_$OnlineCalculationStateImpl) then) =
      __$$OnlineCalculationStateImplCopyWithImpl<$Res>;
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
class __$$OnlineCalculationStateImplCopyWithImpl<$Res>
    extends _$OnlineCalculationStateCopyWithImpl<$Res,
        _$OnlineCalculationStateImpl>
    implements _$$OnlineCalculationStateImplCopyWith<$Res> {
  __$$OnlineCalculationStateImplCopyWithImpl(
      _$OnlineCalculationStateImpl _value,
      $Res Function(_$OnlineCalculationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? functions = null,
    Object? lastResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OnlineCalculationStateImpl(
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

class _$OnlineCalculationStateImpl extends _OnlineCalculationState {
  const _$OnlineCalculationStateImpl(
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
    return 'OnlineCalculationState(isLoading: $isLoading, functions: $functions, lastResult: $lastResult, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCalculationStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCalculationStateImplCopyWith<_$OnlineCalculationStateImpl>
      get copyWith => __$$OnlineCalculationStateImplCopyWithImpl<
          _$OnlineCalculationStateImpl>(this, _$identity);
}

abstract class _OnlineCalculationState extends OnlineCalculationState {
  const factory _OnlineCalculationState(
      {final bool isLoading,
      final List<CalculationFunctionModel> functions,
      final CalculationResultModel? lastResult,
      final String? errorMessage}) = _$OnlineCalculationStateImpl;
  const _OnlineCalculationState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CalculationFunctionModel> get functions;
  @override
  CalculationResultModel? get lastResult;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OnlineCalculationStateImplCopyWith<_$OnlineCalculationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

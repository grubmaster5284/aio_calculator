// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_calculation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnlineCalculationState {

 bool get isLoading; List<CalculationFunctionModel> get functions; CalculationResultModel? get lastResult; String? get errorMessage;
/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnlineCalculationStateCopyWith<OnlineCalculationState> get copyWith => _$OnlineCalculationStateCopyWithImpl<OnlineCalculationState>(this as OnlineCalculationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnlineCalculationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.functions, functions)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(functions),lastResult,errorMessage);

@override
String toString() {
  return 'OnlineCalculationState(isLoading: $isLoading, functions: $functions, lastResult: $lastResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OnlineCalculationStateCopyWith<$Res>  {
  factory $OnlineCalculationStateCopyWith(OnlineCalculationState value, $Res Function(OnlineCalculationState) _then) = _$OnlineCalculationStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<CalculationFunctionModel> functions, CalculationResultModel? lastResult, String? errorMessage
});


$CalculationResultModelCopyWith<$Res>? get lastResult;

}
/// @nodoc
class _$OnlineCalculationStateCopyWithImpl<$Res>
    implements $OnlineCalculationStateCopyWith<$Res> {
  _$OnlineCalculationStateCopyWithImpl(this._self, this._then);

  final OnlineCalculationState _self;
  final $Res Function(OnlineCalculationState) _then;

/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? functions = null,Object? lastResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,functions: null == functions ? _self.functions : functions // ignore: cast_nullable_to_non_nullable
as List<CalculationFunctionModel>,lastResult: freezed == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as CalculationResultModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculationResultModelCopyWith<$Res>? get lastResult {
    if (_self.lastResult == null) {
    return null;
  }

  return $CalculationResultModelCopyWith<$Res>(_self.lastResult!, (value) {
    return _then(_self.copyWith(lastResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnlineCalculationState].
extension OnlineCalculationStatePatterns on OnlineCalculationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnlineCalculationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnlineCalculationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnlineCalculationState value)  $default,){
final _that = this;
switch (_that) {
case _OnlineCalculationState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnlineCalculationState value)?  $default,){
final _that = this;
switch (_that) {
case _OnlineCalculationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<CalculationFunctionModel> functions,  CalculationResultModel? lastResult,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnlineCalculationState() when $default != null:
return $default(_that.isLoading,_that.functions,_that.lastResult,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<CalculationFunctionModel> functions,  CalculationResultModel? lastResult,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OnlineCalculationState():
return $default(_that.isLoading,_that.functions,_that.lastResult,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<CalculationFunctionModel> functions,  CalculationResultModel? lastResult,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OnlineCalculationState() when $default != null:
return $default(_that.isLoading,_that.functions,_that.lastResult,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OnlineCalculationState extends OnlineCalculationState {
  const _OnlineCalculationState({this.isLoading = false, final  List<CalculationFunctionModel> functions = const <CalculationFunctionModel>[], this.lastResult, this.errorMessage}): _functions = functions,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<CalculationFunctionModel> _functions;
@override@JsonKey() List<CalculationFunctionModel> get functions {
  if (_functions is EqualUnmodifiableListView) return _functions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_functions);
}

@override final  CalculationResultModel? lastResult;
@override final  String? errorMessage;

/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineCalculationStateCopyWith<_OnlineCalculationState> get copyWith => __$OnlineCalculationStateCopyWithImpl<_OnlineCalculationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineCalculationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._functions, _functions)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_functions),lastResult,errorMessage);

@override
String toString() {
  return 'OnlineCalculationState(isLoading: $isLoading, functions: $functions, lastResult: $lastResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OnlineCalculationStateCopyWith<$Res> implements $OnlineCalculationStateCopyWith<$Res> {
  factory _$OnlineCalculationStateCopyWith(_OnlineCalculationState value, $Res Function(_OnlineCalculationState) _then) = __$OnlineCalculationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<CalculationFunctionModel> functions, CalculationResultModel? lastResult, String? errorMessage
});


@override $CalculationResultModelCopyWith<$Res>? get lastResult;

}
/// @nodoc
class __$OnlineCalculationStateCopyWithImpl<$Res>
    implements _$OnlineCalculationStateCopyWith<$Res> {
  __$OnlineCalculationStateCopyWithImpl(this._self, this._then);

  final _OnlineCalculationState _self;
  final $Res Function(_OnlineCalculationState) _then;

/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? functions = null,Object? lastResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_OnlineCalculationState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,functions: null == functions ? _self._functions : functions // ignore: cast_nullable_to_non_nullable
as List<CalculationFunctionModel>,lastResult: freezed == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as CalculationResultModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OnlineCalculationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculationResultModelCopyWith<$Res>? get lastResult {
    if (_self.lastResult == null) {
    return null;
  }

  return $CalculationResultModelCopyWith<$Res>(_self.lastResult!, (value) {
    return _then(_self.copyWith(lastResult: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graphing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphingState {

 bool get isLoading;/// Current LaTeX expression to render on the graph
 String get currentExpression;/// Whether expressions panel is visible in the embedded calculator
 bool get showExpressions;/// Optional error message for failures
 String? get errorMessage;
/// Create a copy of GraphingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphingStateCopyWith<GraphingState> get copyWith => _$GraphingStateCopyWithImpl<GraphingState>(this as GraphingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentExpression, currentExpression) || other.currentExpression == currentExpression)&&(identical(other.showExpressions, showExpressions) || other.showExpressions == showExpressions)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentExpression,showExpressions,errorMessage);

@override
String toString() {
  return 'GraphingState(isLoading: $isLoading, currentExpression: $currentExpression, showExpressions: $showExpressions, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GraphingStateCopyWith<$Res>  {
  factory $GraphingStateCopyWith(GraphingState value, $Res Function(GraphingState) _then) = _$GraphingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String currentExpression, bool showExpressions, String? errorMessage
});




}
/// @nodoc
class _$GraphingStateCopyWithImpl<$Res>
    implements $GraphingStateCopyWith<$Res> {
  _$GraphingStateCopyWithImpl(this._self, this._then);

  final GraphingState _self;
  final $Res Function(GraphingState) _then;

/// Create a copy of GraphingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? currentExpression = null,Object? showExpressions = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentExpression: null == currentExpression ? _self.currentExpression : currentExpression // ignore: cast_nullable_to_non_nullable
as String,showExpressions: null == showExpressions ? _self.showExpressions : showExpressions // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphingState].
extension GraphingStatePatterns on GraphingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphingState value)  $default,){
final _that = this;
switch (_that) {
case _GraphingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphingState value)?  $default,){
final _that = this;
switch (_that) {
case _GraphingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String currentExpression,  bool showExpressions,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphingState() when $default != null:
return $default(_that.isLoading,_that.currentExpression,_that.showExpressions,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String currentExpression,  bool showExpressions,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GraphingState():
return $default(_that.isLoading,_that.currentExpression,_that.showExpressions,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String currentExpression,  bool showExpressions,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GraphingState() when $default != null:
return $default(_that.isLoading,_that.currentExpression,_that.showExpressions,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GraphingState extends GraphingState {
  const _GraphingState({this.isLoading = false, this.currentExpression = '', this.showExpressions = true, this.errorMessage}): super._();
  

@override@JsonKey() final  bool isLoading;
/// Current LaTeX expression to render on the graph
@override@JsonKey() final  String currentExpression;
/// Whether expressions panel is visible in the embedded calculator
@override@JsonKey() final  bool showExpressions;
/// Optional error message for failures
@override final  String? errorMessage;

/// Create a copy of GraphingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphingStateCopyWith<_GraphingState> get copyWith => __$GraphingStateCopyWithImpl<_GraphingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentExpression, currentExpression) || other.currentExpression == currentExpression)&&(identical(other.showExpressions, showExpressions) || other.showExpressions == showExpressions)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentExpression,showExpressions,errorMessage);

@override
String toString() {
  return 'GraphingState(isLoading: $isLoading, currentExpression: $currentExpression, showExpressions: $showExpressions, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GraphingStateCopyWith<$Res> implements $GraphingStateCopyWith<$Res> {
  factory _$GraphingStateCopyWith(_GraphingState value, $Res Function(_GraphingState) _then) = __$GraphingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String currentExpression, bool showExpressions, String? errorMessage
});




}
/// @nodoc
class __$GraphingStateCopyWithImpl<$Res>
    implements _$GraphingStateCopyWith<$Res> {
  __$GraphingStateCopyWithImpl(this._self, this._then);

  final _GraphingState _self;
  final $Res Function(_GraphingState) _then;

/// Create a copy of GraphingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? currentExpression = null,Object? showExpressions = null,Object? errorMessage = freezed,}) {
  return _then(_GraphingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentExpression: null == currentExpression ? _self.currentExpression : currentExpression // ignore: cast_nullable_to_non_nullable
as String,showExpressions: null == showExpressions ? _self.showExpressions : showExpressions // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

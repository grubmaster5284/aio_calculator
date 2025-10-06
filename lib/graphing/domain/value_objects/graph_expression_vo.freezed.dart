// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_expression_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphExpression {

 String get latex;
/// Create a copy of GraphExpression
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphExpressionCopyWith<GraphExpression> get copyWith => _$GraphExpressionCopyWithImpl<GraphExpression>(this as GraphExpression, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphExpression&&(identical(other.latex, latex) || other.latex == latex));
}


@override
int get hashCode => Object.hash(runtimeType,latex);

@override
String toString() {
  return 'GraphExpression(latex: $latex)';
}


}

/// @nodoc
abstract mixin class $GraphExpressionCopyWith<$Res>  {
  factory $GraphExpressionCopyWith(GraphExpression value, $Res Function(GraphExpression) _then) = _$GraphExpressionCopyWithImpl;
@useResult
$Res call({
 String latex
});




}
/// @nodoc
class _$GraphExpressionCopyWithImpl<$Res>
    implements $GraphExpressionCopyWith<$Res> {
  _$GraphExpressionCopyWithImpl(this._self, this._then);

  final GraphExpression _self;
  final $Res Function(GraphExpression) _then;

/// Create a copy of GraphExpression
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latex = null,}) {
  return _then(_self.copyWith(
latex: null == latex ? _self.latex : latex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphExpression].
extension GraphExpressionPatterns on GraphExpression {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphExpression value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphExpression() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphExpression value)  $default,){
final _that = this;
switch (_that) {
case _GraphExpression():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphExpression value)?  $default,){
final _that = this;
switch (_that) {
case _GraphExpression() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String latex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphExpression() when $default != null:
return $default(_that.latex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String latex)  $default,) {final _that = this;
switch (_that) {
case _GraphExpression():
return $default(_that.latex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String latex)?  $default,) {final _that = this;
switch (_that) {
case _GraphExpression() when $default != null:
return $default(_that.latex);case _:
  return null;

}
}

}

/// @nodoc


class _GraphExpression implements GraphExpression {
   _GraphExpression(this.latex): assert(latex.trim().isNotEmpty || latex.isEmpty, 'Graph expression cannot be only whitespace');
  

@override final  String latex;

/// Create a copy of GraphExpression
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphExpressionCopyWith<_GraphExpression> get copyWith => __$GraphExpressionCopyWithImpl<_GraphExpression>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphExpression&&(identical(other.latex, latex) || other.latex == latex));
}


@override
int get hashCode => Object.hash(runtimeType,latex);

@override
String toString() {
  return 'GraphExpression(latex: $latex)';
}


}

/// @nodoc
abstract mixin class _$GraphExpressionCopyWith<$Res> implements $GraphExpressionCopyWith<$Res> {
  factory _$GraphExpressionCopyWith(_GraphExpression value, $Res Function(_GraphExpression) _then) = __$GraphExpressionCopyWithImpl;
@override @useResult
$Res call({
 String latex
});




}
/// @nodoc
class __$GraphExpressionCopyWithImpl<$Res>
    implements _$GraphExpressionCopyWith<$Res> {
  __$GraphExpressionCopyWithImpl(this._self, this._then);

  final _GraphExpression _self;
  final $Res Function(_GraphExpression) _then;

/// Create a copy of GraphExpression
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latex = null,}) {
  return _then(_GraphExpression(
null == latex ? _self.latex : latex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

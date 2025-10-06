// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphConfig {

 GraphExpression get expression; bool get showExpressionsPanel;
/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphConfigCopyWith<GraphConfig> get copyWith => _$GraphConfigCopyWithImpl<GraphConfig>(this as GraphConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphConfig&&(identical(other.expression, expression) || other.expression == expression)&&(identical(other.showExpressionsPanel, showExpressionsPanel) || other.showExpressionsPanel == showExpressionsPanel));
}


@override
int get hashCode => Object.hash(runtimeType,expression,showExpressionsPanel);

@override
String toString() {
  return 'GraphConfig(expression: $expression, showExpressionsPanel: $showExpressionsPanel)';
}


}

/// @nodoc
abstract mixin class $GraphConfigCopyWith<$Res>  {
  factory $GraphConfigCopyWith(GraphConfig value, $Res Function(GraphConfig) _then) = _$GraphConfigCopyWithImpl;
@useResult
$Res call({
 GraphExpression expression, bool showExpressionsPanel
});


$GraphExpressionCopyWith<$Res> get expression;

}
/// @nodoc
class _$GraphConfigCopyWithImpl<$Res>
    implements $GraphConfigCopyWith<$Res> {
  _$GraphConfigCopyWithImpl(this._self, this._then);

  final GraphConfig _self;
  final $Res Function(GraphConfig) _then;

/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expression = null,Object? showExpressionsPanel = null,}) {
  return _then(_self.copyWith(
expression: null == expression ? _self.expression : expression // ignore: cast_nullable_to_non_nullable
as GraphExpression,showExpressionsPanel: null == showExpressionsPanel ? _self.showExpressionsPanel : showExpressionsPanel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphExpressionCopyWith<$Res> get expression {
  
  return $GraphExpressionCopyWith<$Res>(_self.expression, (value) {
    return _then(_self.copyWith(expression: value));
  });
}
}


/// Adds pattern-matching-related methods to [GraphConfig].
extension GraphConfigPatterns on GraphConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphConfig value)  $default,){
final _that = this;
switch (_that) {
case _GraphConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GraphConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GraphExpression expression,  bool showExpressionsPanel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphConfig() when $default != null:
return $default(_that.expression,_that.showExpressionsPanel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GraphExpression expression,  bool showExpressionsPanel)  $default,) {final _that = this;
switch (_that) {
case _GraphConfig():
return $default(_that.expression,_that.showExpressionsPanel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GraphExpression expression,  bool showExpressionsPanel)?  $default,) {final _that = this;
switch (_that) {
case _GraphConfig() when $default != null:
return $default(_that.expression,_that.showExpressionsPanel);case _:
  return null;

}
}

}

/// @nodoc


class _GraphConfig implements GraphConfig {
  const _GraphConfig({required this.expression, required this.showExpressionsPanel});
  

@override final  GraphExpression expression;
@override final  bool showExpressionsPanel;

/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphConfigCopyWith<_GraphConfig> get copyWith => __$GraphConfigCopyWithImpl<_GraphConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphConfig&&(identical(other.expression, expression) || other.expression == expression)&&(identical(other.showExpressionsPanel, showExpressionsPanel) || other.showExpressionsPanel == showExpressionsPanel));
}


@override
int get hashCode => Object.hash(runtimeType,expression,showExpressionsPanel);

@override
String toString() {
  return 'GraphConfig(expression: $expression, showExpressionsPanel: $showExpressionsPanel)';
}


}

/// @nodoc
abstract mixin class _$GraphConfigCopyWith<$Res> implements $GraphConfigCopyWith<$Res> {
  factory _$GraphConfigCopyWith(_GraphConfig value, $Res Function(_GraphConfig) _then) = __$GraphConfigCopyWithImpl;
@override @useResult
$Res call({
 GraphExpression expression, bool showExpressionsPanel
});


@override $GraphExpressionCopyWith<$Res> get expression;

}
/// @nodoc
class __$GraphConfigCopyWithImpl<$Res>
    implements _$GraphConfigCopyWith<$Res> {
  __$GraphConfigCopyWithImpl(this._self, this._then);

  final _GraphConfig _self;
  final $Res Function(_GraphConfig) _then;

/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expression = null,Object? showExpressionsPanel = null,}) {
  return _then(_GraphConfig(
expression: null == expression ? _self.expression : expression // ignore: cast_nullable_to_non_nullable
as GraphExpression,showExpressionsPanel: null == showExpressionsPanel ? _self.showExpressionsPanel : showExpressionsPanel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GraphConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphExpressionCopyWith<$Res> get expression {
  
  return $GraphExpressionCopyWith<$Res>(_self.expression, (value) {
    return _then(_self.copyWith(expression: value));
  });
}
}

// dart format on

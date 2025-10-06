// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graphing_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphingError {

 String get message;
/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphingErrorCopyWith<GraphingError> get copyWith => _$GraphingErrorCopyWithImpl<GraphingError>(this as GraphingError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GraphingError(message: $message)';
}


}

/// @nodoc
abstract mixin class $GraphingErrorCopyWith<$Res>  {
  factory $GraphingErrorCopyWith(GraphingError value, $Res Function(GraphingError) _then) = _$GraphingErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GraphingErrorCopyWithImpl<$Res>
    implements $GraphingErrorCopyWith<$Res> {
  _$GraphingErrorCopyWithImpl(this._self, this._then);

  final GraphingError _self;
  final $Res Function(GraphingError) _then;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphingError].
extension GraphingErrorPatterns on GraphingError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InvalidExpressionError value)?  invalidExpression,TResult Function( ConfigurationError value)?  configuration,TResult Function( UnknownGraphingError value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InvalidExpressionError() when invalidExpression != null:
return invalidExpression(_that);case ConfigurationError() when configuration != null:
return configuration(_that);case UnknownGraphingError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InvalidExpressionError value)  invalidExpression,required TResult Function( ConfigurationError value)  configuration,required TResult Function( UnknownGraphingError value)  unknown,}){
final _that = this;
switch (_that) {
case InvalidExpressionError():
return invalidExpression(_that);case ConfigurationError():
return configuration(_that);case UnknownGraphingError():
return unknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InvalidExpressionError value)?  invalidExpression,TResult? Function( ConfigurationError value)?  configuration,TResult? Function( UnknownGraphingError value)?  unknown,}){
final _that = this;
switch (_that) {
case InvalidExpressionError() when invalidExpression != null:
return invalidExpression(_that);case ConfigurationError() when configuration != null:
return configuration(_that);case UnknownGraphingError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  invalidExpression,TResult Function( String message)?  configuration,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InvalidExpressionError() when invalidExpression != null:
return invalidExpression(_that.message);case ConfigurationError() when configuration != null:
return configuration(_that.message);case UnknownGraphingError() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  invalidExpression,required TResult Function( String message)  configuration,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case InvalidExpressionError():
return invalidExpression(_that.message);case ConfigurationError():
return configuration(_that.message);case UnknownGraphingError():
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  invalidExpression,TResult? Function( String message)?  configuration,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case InvalidExpressionError() when invalidExpression != null:
return invalidExpression(_that.message);case ConfigurationError() when configuration != null:
return configuration(_that.message);case UnknownGraphingError() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InvalidExpressionError implements GraphingError {
  const InvalidExpressionError({required this.message});
  

@override final  String message;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidExpressionErrorCopyWith<InvalidExpressionError> get copyWith => _$InvalidExpressionErrorCopyWithImpl<InvalidExpressionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidExpressionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GraphingError.invalidExpression(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidExpressionErrorCopyWith<$Res> implements $GraphingErrorCopyWith<$Res> {
  factory $InvalidExpressionErrorCopyWith(InvalidExpressionError value, $Res Function(InvalidExpressionError) _then) = _$InvalidExpressionErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidExpressionErrorCopyWithImpl<$Res>
    implements $InvalidExpressionErrorCopyWith<$Res> {
  _$InvalidExpressionErrorCopyWithImpl(this._self, this._then);

  final InvalidExpressionError _self;
  final $Res Function(InvalidExpressionError) _then;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidExpressionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigurationError implements GraphingError {
  const ConfigurationError({required this.message});
  

@override final  String message;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigurationErrorCopyWith<ConfigurationError> get copyWith => _$ConfigurationErrorCopyWithImpl<ConfigurationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigurationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GraphingError.configuration(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConfigurationErrorCopyWith<$Res> implements $GraphingErrorCopyWith<$Res> {
  factory $ConfigurationErrorCopyWith(ConfigurationError value, $Res Function(ConfigurationError) _then) = _$ConfigurationErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConfigurationErrorCopyWithImpl<$Res>
    implements $ConfigurationErrorCopyWith<$Res> {
  _$ConfigurationErrorCopyWithImpl(this._self, this._then);

  final ConfigurationError _self;
  final $Res Function(ConfigurationError) _then;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConfigurationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownGraphingError implements GraphingError {
  const UnknownGraphingError({required this.message});
  

@override final  String message;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownGraphingErrorCopyWith<UnknownGraphingError> get copyWith => _$UnknownGraphingErrorCopyWithImpl<UnknownGraphingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownGraphingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GraphingError.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownGraphingErrorCopyWith<$Res> implements $GraphingErrorCopyWith<$Res> {
  factory $UnknownGraphingErrorCopyWith(UnknownGraphingError value, $Res Function(UnknownGraphingError) _then) = _$UnknownGraphingErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownGraphingErrorCopyWithImpl<$Res>
    implements $UnknownGraphingErrorCopyWith<$Res> {
  _$UnknownGraphingErrorCopyWithImpl(this._self, this._then);

  final UnknownGraphingError _self;
  final $Res Function(UnknownGraphingError) _then;

/// Create a copy of GraphingError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownGraphingError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

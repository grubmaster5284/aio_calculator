// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalculationError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculationError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalculationError()';
}


}

/// @nodoc
class $CalculationErrorCopyWith<$Res>  {
$CalculationErrorCopyWith(CalculationError _, $Res Function(CalculationError) __);
}


/// Adds pattern-matching-related methods to [CalculationError].
extension CalculationErrorPatterns on CalculationError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotFound value)?  notFound,TResult Function( InvalidInput value)?  invalidInput,TResult Function( Timeout value)?  timeout,TResult Function( Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotFound() when notFound != null:
return notFound(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case Timeout() when timeout != null:
return timeout(_that);case Unknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotFound value)  notFound,required TResult Function( InvalidInput value)  invalidInput,required TResult Function( Timeout value)  timeout,required TResult Function( Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case NotFound():
return notFound(_that);case InvalidInput():
return invalidInput(_that);case Timeout():
return timeout(_that);case Unknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotFound value)?  notFound,TResult? Function( InvalidInput value)?  invalidInput,TResult? Function( Timeout value)?  timeout,TResult? Function( Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case NotFound() when notFound != null:
return notFound(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case Timeout() when timeout != null:
return timeout(_that);case Unknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notFound,TResult Function( String message)?  invalidInput,TResult Function()?  timeout,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotFound() when notFound != null:
return notFound();case InvalidInput() when invalidInput != null:
return invalidInput(_that.message);case Timeout() when timeout != null:
return timeout();case Unknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notFound,required TResult Function( String message)  invalidInput,required TResult Function()  timeout,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case NotFound():
return notFound();case InvalidInput():
return invalidInput(_that.message);case Timeout():
return timeout();case Unknown():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notFound,TResult? Function( String message)?  invalidInput,TResult? Function()?  timeout,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case NotFound() when notFound != null:
return notFound();case InvalidInput() when invalidInput != null:
return invalidInput(_that.message);case Timeout() when timeout != null:
return timeout();case Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NotFound implements CalculationError {
  const NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalculationError.notFound()';
}


}




/// @nodoc


class InvalidInput implements CalculationError {
  const InvalidInput(this.message);
  

 final  String message;

/// Create a copy of CalculationError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidInputCopyWith<InvalidInput> get copyWith => _$InvalidInputCopyWithImpl<InvalidInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidInput&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CalculationError.invalidInput(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidInputCopyWith<$Res> implements $CalculationErrorCopyWith<$Res> {
  factory $InvalidInputCopyWith(InvalidInput value, $Res Function(InvalidInput) _then) = _$InvalidInputCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidInputCopyWithImpl<$Res>
    implements $InvalidInputCopyWith<$Res> {
  _$InvalidInputCopyWithImpl(this._self, this._then);

  final InvalidInput _self;
  final $Res Function(InvalidInput) _then;

/// Create a copy of CalculationError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidInput(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Timeout implements CalculationError {
  const Timeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalculationError.timeout()';
}


}




/// @nodoc


class Unknown implements CalculationError {
  const Unknown(this.message);
  

 final  String message;

/// Create a copy of CalculationError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownCopyWith<Unknown> get copyWith => _$UnknownCopyWithImpl<Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CalculationError.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownCopyWith<$Res> implements $CalculationErrorCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) _then) = _$UnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownCopyWithImpl<$Res>
    implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(this._self, this._then);

  final Unknown _self;
  final $Res Function(Unknown) _then;

/// Create a copy of CalculationError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

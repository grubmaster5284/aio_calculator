// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculationResultDto {

 String get functionId; double get value; Map<String, dynamic> get metadata;
/// Create a copy of CalculationResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculationResultDtoCopyWith<CalculationResultDto> get copyWith => _$CalculationResultDtoCopyWithImpl<CalculationResultDto>(this as CalculationResultDto, _$identity);

  /// Serializes this CalculationResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculationResultDto&&(identical(other.functionId, functionId) || other.functionId == functionId)&&(identical(other.value, value) || other.value == value)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,functionId,value,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'CalculationResultDto(functionId: $functionId, value: $value, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CalculationResultDtoCopyWith<$Res>  {
  factory $CalculationResultDtoCopyWith(CalculationResultDto value, $Res Function(CalculationResultDto) _then) = _$CalculationResultDtoCopyWithImpl;
@useResult
$Res call({
 String functionId, double value, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$CalculationResultDtoCopyWithImpl<$Res>
    implements $CalculationResultDtoCopyWith<$Res> {
  _$CalculationResultDtoCopyWithImpl(this._self, this._then);

  final CalculationResultDto _self;
  final $Res Function(CalculationResultDto) _then;

/// Create a copy of CalculationResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? functionId = null,Object? value = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
functionId: null == functionId ? _self.functionId : functionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculationResultDto].
extension CalculationResultDtoPatterns on CalculationResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculationResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculationResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculationResultDto value)  $default,){
final _that = this;
switch (_that) {
case _CalculationResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculationResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalculationResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String functionId,  double value,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculationResultDto() when $default != null:
return $default(_that.functionId,_that.value,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String functionId,  double value,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _CalculationResultDto():
return $default(_that.functionId,_that.value,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String functionId,  double value,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _CalculationResultDto() when $default != null:
return $default(_that.functionId,_that.value,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculationResultDto implements CalculationResultDto {
  const _CalculationResultDto({this.functionId = '', this.value = 0.0, final  Map<String, dynamic> metadata = const <String, dynamic>{}}): _metadata = metadata;
  factory _CalculationResultDto.fromJson(Map<String, dynamic> json) => _$CalculationResultDtoFromJson(json);

@override@JsonKey() final  String functionId;
@override@JsonKey() final  double value;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of CalculationResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculationResultDtoCopyWith<_CalculationResultDto> get copyWith => __$CalculationResultDtoCopyWithImpl<_CalculationResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculationResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculationResultDto&&(identical(other.functionId, functionId) || other.functionId == functionId)&&(identical(other.value, value) || other.value == value)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,functionId,value,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'CalculationResultDto(functionId: $functionId, value: $value, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CalculationResultDtoCopyWith<$Res> implements $CalculationResultDtoCopyWith<$Res> {
  factory _$CalculationResultDtoCopyWith(_CalculationResultDto value, $Res Function(_CalculationResultDto) _then) = __$CalculationResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String functionId, double value, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$CalculationResultDtoCopyWithImpl<$Res>
    implements _$CalculationResultDtoCopyWith<$Res> {
  __$CalculationResultDtoCopyWithImpl(this._self, this._then);

  final _CalculationResultDto _self;
  final $Res Function(_CalculationResultDto) _then;

/// Create a copy of CalculationResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? functionId = null,Object? value = null,Object? metadata = null,}) {
  return _then(_CalculationResultDto(
functionId: null == functionId ? _self.functionId : functionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on

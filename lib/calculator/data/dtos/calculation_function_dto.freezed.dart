// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_function_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculationFunctionDto {

 String get id; String get name; String get description; List<String> get parameters;
/// Create a copy of CalculationFunctionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculationFunctionDtoCopyWith<CalculationFunctionDto> get copyWith => _$CalculationFunctionDtoCopyWithImpl<CalculationFunctionDto>(this as CalculationFunctionDto, _$identity);

  /// Serializes this CalculationFunctionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculationFunctionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'CalculationFunctionDto(id: $id, name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $CalculationFunctionDtoCopyWith<$Res>  {
  factory $CalculationFunctionDtoCopyWith(CalculationFunctionDto value, $Res Function(CalculationFunctionDto) _then) = _$CalculationFunctionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, List<String> parameters
});




}
/// @nodoc
class _$CalculationFunctionDtoCopyWithImpl<$Res>
    implements $CalculationFunctionDtoCopyWith<$Res> {
  _$CalculationFunctionDtoCopyWithImpl(this._self, this._then);

  final CalculationFunctionDto _self;
  final $Res Function(CalculationFunctionDto) _then;

/// Create a copy of CalculationFunctionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculationFunctionDto].
extension CalculationFunctionDtoPatterns on CalculationFunctionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculationFunctionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculationFunctionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculationFunctionDto value)  $default,){
final _that = this;
switch (_that) {
case _CalculationFunctionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculationFunctionDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalculationFunctionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculationFunctionDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> parameters)  $default,) {final _that = this;
switch (_that) {
case _CalculationFunctionDto():
return $default(_that.id,_that.name,_that.description,_that.parameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  List<String> parameters)?  $default,) {final _that = this;
switch (_that) {
case _CalculationFunctionDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculationFunctionDto implements CalculationFunctionDto {
  const _CalculationFunctionDto({this.id = '', this.name = '', this.description = '', final  List<String> parameters = const <String>[]}): _parameters = parameters;
  factory _CalculationFunctionDto.fromJson(Map<String, dynamic> json) => _$CalculationFunctionDtoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
 final  List<String> _parameters;
@override@JsonKey() List<String> get parameters {
  if (_parameters is EqualUnmodifiableListView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parameters);
}


/// Create a copy of CalculationFunctionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculationFunctionDtoCopyWith<_CalculationFunctionDto> get copyWith => __$CalculationFunctionDtoCopyWithImpl<_CalculationFunctionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculationFunctionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculationFunctionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'CalculationFunctionDto(id: $id, name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$CalculationFunctionDtoCopyWith<$Res> implements $CalculationFunctionDtoCopyWith<$Res> {
  factory _$CalculationFunctionDtoCopyWith(_CalculationFunctionDto value, $Res Function(_CalculationFunctionDto) _then) = __$CalculationFunctionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, List<String> parameters
});




}
/// @nodoc
class __$CalculationFunctionDtoCopyWithImpl<$Res>
    implements _$CalculationFunctionDtoCopyWith<$Res> {
  __$CalculationFunctionDtoCopyWithImpl(this._self, this._then);

  final _CalculationFunctionDto _self;
  final $Res Function(_CalculationFunctionDto) _then;

/// Create a copy of CalculationFunctionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_CalculationFunctionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

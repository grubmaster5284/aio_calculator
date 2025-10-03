// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_function_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalculationFunctionModel {

 FunctionId get id; String get name; String get description; List<String> get parameters;
/// Create a copy of CalculationFunctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculationFunctionModelCopyWith<CalculationFunctionModel> get copyWith => _$CalculationFunctionModelCopyWithImpl<CalculationFunctionModel>(this as CalculationFunctionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculationFunctionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'CalculationFunctionModel(id: $id, name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $CalculationFunctionModelCopyWith<$Res>  {
  factory $CalculationFunctionModelCopyWith(CalculationFunctionModel value, $Res Function(CalculationFunctionModel) _then) = _$CalculationFunctionModelCopyWithImpl;
@useResult
$Res call({
 FunctionId id, String name, String description, List<String> parameters
});




}
/// @nodoc
class _$CalculationFunctionModelCopyWithImpl<$Res>
    implements $CalculationFunctionModelCopyWith<$Res> {
  _$CalculationFunctionModelCopyWithImpl(this._self, this._then);

  final CalculationFunctionModel _self;
  final $Res Function(CalculationFunctionModel) _then;

/// Create a copy of CalculationFunctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as FunctionId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculationFunctionModel].
extension CalculationFunctionModelPatterns on CalculationFunctionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculationFunctionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculationFunctionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculationFunctionModel value)  $default,){
final _that = this;
switch (_that) {
case _CalculationFunctionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculationFunctionModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalculationFunctionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FunctionId id,  String name,  String description,  List<String> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculationFunctionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FunctionId id,  String name,  String description,  List<String> parameters)  $default,) {final _that = this;
switch (_that) {
case _CalculationFunctionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FunctionId id,  String name,  String description,  List<String> parameters)?  $default,) {final _that = this;
switch (_that) {
case _CalculationFunctionModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc


class _CalculationFunctionModel implements CalculationFunctionModel {
  const _CalculationFunctionModel({required this.id, this.name = '', this.description = '', final  List<String> parameters = const <String>[]}): _parameters = parameters;
  

@override final  FunctionId id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
 final  List<String> _parameters;
@override@JsonKey() List<String> get parameters {
  if (_parameters is EqualUnmodifiableListView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parameters);
}


/// Create a copy of CalculationFunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculationFunctionModelCopyWith<_CalculationFunctionModel> get copyWith => __$CalculationFunctionModelCopyWithImpl<_CalculationFunctionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculationFunctionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'CalculationFunctionModel(id: $id, name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$CalculationFunctionModelCopyWith<$Res> implements $CalculationFunctionModelCopyWith<$Res> {
  factory _$CalculationFunctionModelCopyWith(_CalculationFunctionModel value, $Res Function(_CalculationFunctionModel) _then) = __$CalculationFunctionModelCopyWithImpl;
@override @useResult
$Res call({
 FunctionId id, String name, String description, List<String> parameters
});




}
/// @nodoc
class __$CalculationFunctionModelCopyWithImpl<$Res>
    implements _$CalculationFunctionModelCopyWith<$Res> {
  __$CalculationFunctionModelCopyWithImpl(this._self, this._then);

  final _CalculationFunctionModel _self;
  final $Res Function(_CalculationFunctionModel) _then;

/// Create a copy of CalculationFunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_CalculationFunctionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as FunctionId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

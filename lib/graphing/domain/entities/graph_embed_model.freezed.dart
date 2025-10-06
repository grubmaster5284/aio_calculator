// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_embed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphEmbed {

 String get html;
/// Create a copy of GraphEmbed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphEmbedCopyWith<GraphEmbed> get copyWith => _$GraphEmbedCopyWithImpl<GraphEmbed>(this as GraphEmbed, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphEmbed&&(identical(other.html, html) || other.html == html));
}


@override
int get hashCode => Object.hash(runtimeType,html);

@override
String toString() {
  return 'GraphEmbed(html: $html)';
}


}

/// @nodoc
abstract mixin class $GraphEmbedCopyWith<$Res>  {
  factory $GraphEmbedCopyWith(GraphEmbed value, $Res Function(GraphEmbed) _then) = _$GraphEmbedCopyWithImpl;
@useResult
$Res call({
 String html
});




}
/// @nodoc
class _$GraphEmbedCopyWithImpl<$Res>
    implements $GraphEmbedCopyWith<$Res> {
  _$GraphEmbedCopyWithImpl(this._self, this._then);

  final GraphEmbed _self;
  final $Res Function(GraphEmbed) _then;

/// Create a copy of GraphEmbed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? html = null,}) {
  return _then(_self.copyWith(
html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphEmbed].
extension GraphEmbedPatterns on GraphEmbed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphEmbed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphEmbed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphEmbed value)  $default,){
final _that = this;
switch (_that) {
case _GraphEmbed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphEmbed value)?  $default,){
final _that = this;
switch (_that) {
case _GraphEmbed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String html)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphEmbed() when $default != null:
return $default(_that.html);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String html)  $default,) {final _that = this;
switch (_that) {
case _GraphEmbed():
return $default(_that.html);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String html)?  $default,) {final _that = this;
switch (_that) {
case _GraphEmbed() when $default != null:
return $default(_that.html);case _:
  return null;

}
}

}

/// @nodoc


class _GraphEmbed implements GraphEmbed {
  const _GraphEmbed({required this.html});
  

@override final  String html;

/// Create a copy of GraphEmbed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphEmbedCopyWith<_GraphEmbed> get copyWith => __$GraphEmbedCopyWithImpl<_GraphEmbed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphEmbed&&(identical(other.html, html) || other.html == html));
}


@override
int get hashCode => Object.hash(runtimeType,html);

@override
String toString() {
  return 'GraphEmbed(html: $html)';
}


}

/// @nodoc
abstract mixin class _$GraphEmbedCopyWith<$Res> implements $GraphEmbedCopyWith<$Res> {
  factory _$GraphEmbedCopyWith(_GraphEmbed value, $Res Function(_GraphEmbed) _then) = __$GraphEmbedCopyWithImpl;
@override @useResult
$Res call({
 String html
});




}
/// @nodoc
class __$GraphEmbedCopyWithImpl<$Res>
    implements _$GraphEmbedCopyWith<$Res> {
  __$GraphEmbedCopyWithImpl(this._self, this._then);

  final _GraphEmbed _self;
  final $Res Function(_GraphEmbed) _then;

/// Create a copy of GraphEmbed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? html = null,}) {
  return _then(_GraphEmbed(
html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

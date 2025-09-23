// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_function_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculationFunctionDto _$CalculationFunctionDtoFromJson(
    Map<String, dynamic> json) {
  return _CalculationFunctionDto.fromJson(json);
}

/// @nodoc
mixin _$CalculationFunctionDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get parameters => throw _privateConstructorUsedError;

  /// Serializes this CalculationFunctionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculationFunctionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationFunctionDtoCopyWith<CalculationFunctionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationFunctionDtoCopyWith<$Res> {
  factory $CalculationFunctionDtoCopyWith(CalculationFunctionDto value,
          $Res Function(CalculationFunctionDto) then) =
      _$CalculationFunctionDtoCopyWithImpl<$Res, CalculationFunctionDto>;
  @useResult
  $Res call(
      {String id, String name, String description, List<String> parameters});
}

/// @nodoc
class _$CalculationFunctionDtoCopyWithImpl<$Res,
        $Val extends CalculationFunctionDto>
    implements $CalculationFunctionDtoCopyWith<$Res> {
  _$CalculationFunctionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationFunctionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? parameters = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationFunctionDtoImplCopyWith<$Res>
    implements $CalculationFunctionDtoCopyWith<$Res> {
  factory _$$CalculationFunctionDtoImplCopyWith(
          _$CalculationFunctionDtoImpl value,
          $Res Function(_$CalculationFunctionDtoImpl) then) =
      __$$CalculationFunctionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String description, List<String> parameters});
}

/// @nodoc
class __$$CalculationFunctionDtoImplCopyWithImpl<$Res>
    extends _$CalculationFunctionDtoCopyWithImpl<$Res,
        _$CalculationFunctionDtoImpl>
    implements _$$CalculationFunctionDtoImplCopyWith<$Res> {
  __$$CalculationFunctionDtoImplCopyWithImpl(
      _$CalculationFunctionDtoImpl _value,
      $Res Function(_$CalculationFunctionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculationFunctionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? parameters = null,
  }) {
    return _then(_$CalculationFunctionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationFunctionDtoImpl implements _CalculationFunctionDto {
  const _$CalculationFunctionDtoImpl(
      {this.id = '',
      this.name = '',
      this.description = '',
      final List<String> parameters = const <String>[]})
      : _parameters = parameters;

  factory _$CalculationFunctionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationFunctionDtoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<String> _parameters;
  @override
  @JsonKey()
  List<String> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'CalculationFunctionDto(id: $id, name: $name, description: $description, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationFunctionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of CalculationFunctionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationFunctionDtoImplCopyWith<_$CalculationFunctionDtoImpl>
      get copyWith => __$$CalculationFunctionDtoImplCopyWithImpl<
          _$CalculationFunctionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationFunctionDtoImplToJson(
      this,
    );
  }
}

abstract class _CalculationFunctionDto implements CalculationFunctionDto {
  const factory _CalculationFunctionDto(
      {final String id,
      final String name,
      final String description,
      final List<String> parameters}) = _$CalculationFunctionDtoImpl;

  factory _CalculationFunctionDto.fromJson(Map<String, dynamic> json) =
      _$CalculationFunctionDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get parameters;

  /// Create a copy of CalculationFunctionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationFunctionDtoImplCopyWith<_$CalculationFunctionDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

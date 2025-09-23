// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculationResultDto _$CalculationResultDtoFromJson(Map<String, dynamic> json) {
  return _CalculationResultDto.fromJson(json);
}

/// @nodoc
mixin _$CalculationResultDto {
  String get functionId => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this CalculationResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculationResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationResultDtoCopyWith<CalculationResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationResultDtoCopyWith<$Res> {
  factory $CalculationResultDtoCopyWith(CalculationResultDto value,
          $Res Function(CalculationResultDto) then) =
      _$CalculationResultDtoCopyWithImpl<$Res, CalculationResultDto>;
  @useResult
  $Res call({String functionId, double value, Map<String, dynamic> metadata});
}

/// @nodoc
class _$CalculationResultDtoCopyWithImpl<$Res,
        $Val extends CalculationResultDto>
    implements $CalculationResultDtoCopyWith<$Res> {
  _$CalculationResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionId = null,
    Object? value = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      functionId: null == functionId
          ? _value.functionId
          : functionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationResultDtoImplCopyWith<$Res>
    implements $CalculationResultDtoCopyWith<$Res> {
  factory _$$CalculationResultDtoImplCopyWith(_$CalculationResultDtoImpl value,
          $Res Function(_$CalculationResultDtoImpl) then) =
      __$$CalculationResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String functionId, double value, Map<String, dynamic> metadata});
}

/// @nodoc
class __$$CalculationResultDtoImplCopyWithImpl<$Res>
    extends _$CalculationResultDtoCopyWithImpl<$Res, _$CalculationResultDtoImpl>
    implements _$$CalculationResultDtoImplCopyWith<$Res> {
  __$$CalculationResultDtoImplCopyWithImpl(_$CalculationResultDtoImpl _value,
      $Res Function(_$CalculationResultDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculationResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionId = null,
    Object? value = null,
    Object? metadata = null,
  }) {
    return _then(_$CalculationResultDtoImpl(
      functionId: null == functionId
          ? _value.functionId
          : functionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationResultDtoImpl implements _CalculationResultDto {
  const _$CalculationResultDtoImpl(
      {this.functionId = '',
      this.value = 0.0,
      final Map<String, dynamic> metadata = const <String, dynamic>{}})
      : _metadata = metadata;

  factory _$CalculationResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationResultDtoImplFromJson(json);

  @override
  @JsonKey()
  final String functionId;
  @override
  @JsonKey()
  final double value;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'CalculationResultDto(functionId: $functionId, value: $value, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationResultDtoImpl &&
            (identical(other.functionId, functionId) ||
                other.functionId == functionId) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, functionId, value,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CalculationResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationResultDtoImplCopyWith<_$CalculationResultDtoImpl>
      get copyWith =>
          __$$CalculationResultDtoImplCopyWithImpl<_$CalculationResultDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationResultDtoImplToJson(
      this,
    );
  }
}

abstract class _CalculationResultDto implements CalculationResultDto {
  const factory _CalculationResultDto(
      {final String functionId,
      final double value,
      final Map<String, dynamic> metadata}) = _$CalculationResultDtoImpl;

  factory _CalculationResultDto.fromJson(Map<String, dynamic> json) =
      _$CalculationResultDtoImpl.fromJson;

  @override
  String get functionId;
  @override
  double get value;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of CalculationResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationResultDtoImplCopyWith<_$CalculationResultDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

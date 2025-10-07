// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RateDto _$RateDtoFromJson(Map<String, dynamic> json) {
  return _RateDto.fromJson(json);
}

/// @nodoc
mixin _$RateDto {
  String get baseCurrencyCode => throw _privateConstructorUsedError;
  String get quoteCurrencyCode => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateDtoCopyWith<RateDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateDtoCopyWith<$Res> {
  factory $RateDtoCopyWith(RateDto value, $Res Function(RateDto) then) =
      _$RateDtoCopyWithImpl<$Res, RateDto>;
  @useResult
  $Res call(
      {String baseCurrencyCode,
      String quoteCurrencyCode,
      double rate,
      String timestamp});
}

/// @nodoc
class _$RateDtoCopyWithImpl<$Res, $Val extends RateDto>
    implements $RateDtoCopyWith<$Res> {
  _$RateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? quoteCurrencyCode = null,
    Object? rate = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      quoteCurrencyCode: null == quoteCurrencyCode
          ? _value.quoteCurrencyCode
          : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateDtoImplCopyWith<$Res> implements $RateDtoCopyWith<$Res> {
  factory _$$RateDtoImplCopyWith(
          _$RateDtoImpl value, $Res Function(_$RateDtoImpl) then) =
      __$$RateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseCurrencyCode,
      String quoteCurrencyCode,
      double rate,
      String timestamp});
}

/// @nodoc
class __$$RateDtoImplCopyWithImpl<$Res>
    extends _$RateDtoCopyWithImpl<$Res, _$RateDtoImpl>
    implements _$$RateDtoImplCopyWith<$Res> {
  __$$RateDtoImplCopyWithImpl(
      _$RateDtoImpl _value, $Res Function(_$RateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? quoteCurrencyCode = null,
    Object? rate = null,
    Object? timestamp = null,
  }) {
    return _then(_$RateDtoImpl(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      quoteCurrencyCode: null == quoteCurrencyCode
          ? _value.quoteCurrencyCode
          : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateDtoImpl implements _RateDto {
  const _$RateDtoImpl(
      {this.baseCurrencyCode = '',
      this.quoteCurrencyCode = '',
      this.rate = 0.0,
      this.timestamp = ''});

  factory _$RateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateDtoImplFromJson(json);

  @override
  @JsonKey()
  final String baseCurrencyCode;
  @override
  @JsonKey()
  final String quoteCurrencyCode;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey()
  final String timestamp;

  @override
  String toString() {
    return 'RateDto(baseCurrencyCode: $baseCurrencyCode, quoteCurrencyCode: $quoteCurrencyCode, rate: $rate, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateDtoImpl &&
            (identical(other.baseCurrencyCode, baseCurrencyCode) ||
                other.baseCurrencyCode == baseCurrencyCode) &&
            (identical(other.quoteCurrencyCode, quoteCurrencyCode) ||
                other.quoteCurrencyCode == quoteCurrencyCode) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, baseCurrencyCode, quoteCurrencyCode, rate, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateDtoImplCopyWith<_$RateDtoImpl> get copyWith =>
      __$$RateDtoImplCopyWithImpl<_$RateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateDtoImplToJson(
      this,
    );
  }
}

abstract class _RateDto implements RateDto {
  const factory _RateDto(
      {final String baseCurrencyCode,
      final String quoteCurrencyCode,
      final double rate,
      final String timestamp}) = _$RateDtoImpl;

  factory _RateDto.fromJson(Map<String, dynamic> json) = _$RateDtoImpl.fromJson;

  @override
  String get baseCurrencyCode;
  @override
  String get quoteCurrencyCode;
  @override
  double get rate;
  @override
  String get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$RateDtoImplCopyWith<_$RateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

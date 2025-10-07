// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversionResultDto _$ConversionResultDtoFromJson(Map<String, dynamic> json) {
  return _ConversionResultDto.fromJson(json);
}

/// @nodoc
mixin _$ConversionResultDto {
  String get fromCurrencyCode => throw _privateConstructorUsedError;
  String get toCurrencyCode => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get amountIn => throw _privateConstructorUsedError;
  double get amountOut => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversionResultDtoCopyWith<ConversionResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionResultDtoCopyWith<$Res> {
  factory $ConversionResultDtoCopyWith(
          ConversionResultDto value, $Res Function(ConversionResultDto) then) =
      _$ConversionResultDtoCopyWithImpl<$Res, ConversionResultDto>;
  @useResult
  $Res call(
      {String fromCurrencyCode,
      String toCurrencyCode,
      double rate,
      double amountIn,
      double amountOut,
      String timestamp});
}

/// @nodoc
class _$ConversionResultDtoCopyWithImpl<$Res, $Val extends ConversionResultDto>
    implements $ConversionResultDtoCopyWith<$Res> {
  _$ConversionResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCurrencyCode = null,
    Object? toCurrencyCode = null,
    Object? rate = null,
    Object? amountIn = null,
    Object? amountOut = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      fromCurrencyCode: null == fromCurrencyCode
          ? _value.fromCurrencyCode
          : fromCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      toCurrencyCode: null == toCurrencyCode
          ? _value.toCurrencyCode
          : toCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amountIn: null == amountIn
          ? _value.amountIn
          : amountIn // ignore: cast_nullable_to_non_nullable
              as double,
      amountOut: null == amountOut
          ? _value.amountOut
          : amountOut // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversionResultDtoImplCopyWith<$Res>
    implements $ConversionResultDtoCopyWith<$Res> {
  factory _$$ConversionResultDtoImplCopyWith(_$ConversionResultDtoImpl value,
          $Res Function(_$ConversionResultDtoImpl) then) =
      __$$ConversionResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fromCurrencyCode,
      String toCurrencyCode,
      double rate,
      double amountIn,
      double amountOut,
      String timestamp});
}

/// @nodoc
class __$$ConversionResultDtoImplCopyWithImpl<$Res>
    extends _$ConversionResultDtoCopyWithImpl<$Res, _$ConversionResultDtoImpl>
    implements _$$ConversionResultDtoImplCopyWith<$Res> {
  __$$ConversionResultDtoImplCopyWithImpl(_$ConversionResultDtoImpl _value,
      $Res Function(_$ConversionResultDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCurrencyCode = null,
    Object? toCurrencyCode = null,
    Object? rate = null,
    Object? amountIn = null,
    Object? amountOut = null,
    Object? timestamp = null,
  }) {
    return _then(_$ConversionResultDtoImpl(
      fromCurrencyCode: null == fromCurrencyCode
          ? _value.fromCurrencyCode
          : fromCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      toCurrencyCode: null == toCurrencyCode
          ? _value.toCurrencyCode
          : toCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amountIn: null == amountIn
          ? _value.amountIn
          : amountIn // ignore: cast_nullable_to_non_nullable
              as double,
      amountOut: null == amountOut
          ? _value.amountOut
          : amountOut // ignore: cast_nullable_to_non_nullable
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
class _$ConversionResultDtoImpl implements _ConversionResultDto {
  const _$ConversionResultDtoImpl(
      {this.fromCurrencyCode = '',
      this.toCurrencyCode = '',
      this.rate = 0.0,
      this.amountIn = 0.0,
      this.amountOut = 0.0,
      this.timestamp = ''});

  factory _$ConversionResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionResultDtoImplFromJson(json);

  @override
  @JsonKey()
  final String fromCurrencyCode;
  @override
  @JsonKey()
  final String toCurrencyCode;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey()
  final double amountIn;
  @override
  @JsonKey()
  final double amountOut;
  @override
  @JsonKey()
  final String timestamp;

  @override
  String toString() {
    return 'ConversionResultDto(fromCurrencyCode: $fromCurrencyCode, toCurrencyCode: $toCurrencyCode, rate: $rate, amountIn: $amountIn, amountOut: $amountOut, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionResultDtoImpl &&
            (identical(other.fromCurrencyCode, fromCurrencyCode) ||
                other.fromCurrencyCode == fromCurrencyCode) &&
            (identical(other.toCurrencyCode, toCurrencyCode) ||
                other.toCurrencyCode == toCurrencyCode) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.amountIn, amountIn) ||
                other.amountIn == amountIn) &&
            (identical(other.amountOut, amountOut) ||
                other.amountOut == amountOut) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fromCurrencyCode, toCurrencyCode,
      rate, amountIn, amountOut, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionResultDtoImplCopyWith<_$ConversionResultDtoImpl> get copyWith =>
      __$$ConversionResultDtoImplCopyWithImpl<_$ConversionResultDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionResultDtoImplToJson(
      this,
    );
  }
}

abstract class _ConversionResultDto implements ConversionResultDto {
  const factory _ConversionResultDto(
      {final String fromCurrencyCode,
      final String toCurrencyCode,
      final double rate,
      final double amountIn,
      final double amountOut,
      final String timestamp}) = _$ConversionResultDtoImpl;

  factory _ConversionResultDto.fromJson(Map<String, dynamic> json) =
      _$ConversionResultDtoImpl.fromJson;

  @override
  String get fromCurrencyCode;
  @override
  String get toCurrencyCode;
  @override
  double get rate;
  @override
  double get amountIn;
  @override
  double get amountOut;
  @override
  String get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ConversionResultDtoImplCopyWith<_$ConversionResultDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

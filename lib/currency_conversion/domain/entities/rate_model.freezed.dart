// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RateModel {
  CurrencyCode get baseCurrencyCode => throw _privateConstructorUsedError;
  CurrencyCode get quoteCurrencyCode => throw _privateConstructorUsedError;
  BigInt get rateScaled => throw _privateConstructorUsedError;
  int get rateScale => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RateModelCopyWith<RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateModelCopyWith<$Res> {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) then) =
      _$RateModelCopyWithImpl<$Res, RateModel>;
  @useResult
  $Res call(
      {CurrencyCode baseCurrencyCode,
      CurrencyCode quoteCurrencyCode,
      BigInt rateScaled,
      int rateScale,
      DateTime timestamp});
}

/// @nodoc
class _$RateModelCopyWithImpl<$Res, $Val extends RateModel>
    implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? quoteCurrencyCode = null,
    Object? rateScaled = null,
    Object? rateScale = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      quoteCurrencyCode: null == quoteCurrencyCode
          ? _value.quoteCurrencyCode
          : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      rateScaled: null == rateScaled
          ? _value.rateScaled
          : rateScaled // ignore: cast_nullable_to_non_nullable
              as BigInt,
      rateScale: null == rateScale
          ? _value.rateScale
          : rateScale // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateModelImplCopyWith<$Res>
    implements $RateModelCopyWith<$Res> {
  factory _$$RateModelImplCopyWith(
          _$RateModelImpl value, $Res Function(_$RateModelImpl) then) =
      __$$RateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyCode baseCurrencyCode,
      CurrencyCode quoteCurrencyCode,
      BigInt rateScaled,
      int rateScale,
      DateTime timestamp});
}

/// @nodoc
class __$$RateModelImplCopyWithImpl<$Res>
    extends _$RateModelCopyWithImpl<$Res, _$RateModelImpl>
    implements _$$RateModelImplCopyWith<$Res> {
  __$$RateModelImplCopyWithImpl(
      _$RateModelImpl _value, $Res Function(_$RateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = null,
    Object? quoteCurrencyCode = null,
    Object? rateScaled = null,
    Object? rateScale = null,
    Object? timestamp = null,
  }) {
    return _then(_$RateModelImpl(
      baseCurrencyCode: null == baseCurrencyCode
          ? _value.baseCurrencyCode
          : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      quoteCurrencyCode: null == quoteCurrencyCode
          ? _value.quoteCurrencyCode
          : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      rateScaled: null == rateScaled
          ? _value.rateScaled
          : rateScaled // ignore: cast_nullable_to_non_nullable
              as BigInt,
      rateScale: null == rateScale
          ? _value.rateScale
          : rateScale // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$RateModelImpl extends _RateModel {
  const _$RateModelImpl(
      {required this.baseCurrencyCode,
      required this.quoteCurrencyCode,
      required this.rateScaled,
      this.rateScale = 6,
      required this.timestamp})
      : super._();

  @override
  final CurrencyCode baseCurrencyCode;
  @override
  final CurrencyCode quoteCurrencyCode;
  @override
  final BigInt rateScaled;
  @override
  @JsonKey()
  final int rateScale;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'RateModel(baseCurrencyCode: $baseCurrencyCode, quoteCurrencyCode: $quoteCurrencyCode, rateScaled: $rateScaled, rateScale: $rateScale, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateModelImpl &&
            (identical(other.baseCurrencyCode, baseCurrencyCode) ||
                other.baseCurrencyCode == baseCurrencyCode) &&
            (identical(other.quoteCurrencyCode, quoteCurrencyCode) ||
                other.quoteCurrencyCode == quoteCurrencyCode) &&
            (identical(other.rateScaled, rateScaled) ||
                other.rateScaled == rateScaled) &&
            (identical(other.rateScale, rateScale) ||
                other.rateScale == rateScale) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseCurrencyCode,
      quoteCurrencyCode, rateScaled, rateScale, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateModelImplCopyWith<_$RateModelImpl> get copyWith =>
      __$$RateModelImplCopyWithImpl<_$RateModelImpl>(this, _$identity);
}

abstract class _RateModel extends RateModel {
  const factory _RateModel(
      {required final CurrencyCode baseCurrencyCode,
      required final CurrencyCode quoteCurrencyCode,
      required final BigInt rateScaled,
      final int rateScale,
      required final DateTime timestamp}) = _$RateModelImpl;
  const _RateModel._() : super._();

  @override
  CurrencyCode get baseCurrencyCode;
  @override
  CurrencyCode get quoteCurrencyCode;
  @override
  BigInt get rateScaled;
  @override
  int get rateScale;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$RateModelImplCopyWith<_$RateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graphing_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphingError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidExpression,
    required TResult Function(String message) configuration,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidExpression,
    TResult? Function(String message)? configuration,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidExpression,
    TResult Function(String message)? configuration,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidExpressionError value) invalidExpression,
    required TResult Function(ConfigurationError value) configuration,
    required TResult Function(UnknownGraphingError value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidExpressionError value)? invalidExpression,
    TResult? Function(ConfigurationError value)? configuration,
    TResult? Function(UnknownGraphingError value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidExpressionError value)? invalidExpression,
    TResult Function(ConfigurationError value)? configuration,
    TResult Function(UnknownGraphingError value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GraphingErrorCopyWith<GraphingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphingErrorCopyWith<$Res> {
  factory $GraphingErrorCopyWith(
          GraphingError value, $Res Function(GraphingError) then) =
      _$GraphingErrorCopyWithImpl<$Res, GraphingError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GraphingErrorCopyWithImpl<$Res, $Val extends GraphingError>
    implements $GraphingErrorCopyWith<$Res> {
  _$GraphingErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidExpressionErrorImplCopyWith<$Res>
    implements $GraphingErrorCopyWith<$Res> {
  factory _$$InvalidExpressionErrorImplCopyWith(
          _$InvalidExpressionErrorImpl value,
          $Res Function(_$InvalidExpressionErrorImpl) then) =
      __$$InvalidExpressionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidExpressionErrorImplCopyWithImpl<$Res>
    extends _$GraphingErrorCopyWithImpl<$Res, _$InvalidExpressionErrorImpl>
    implements _$$InvalidExpressionErrorImplCopyWith<$Res> {
  __$$InvalidExpressionErrorImplCopyWithImpl(
      _$InvalidExpressionErrorImpl _value,
      $Res Function(_$InvalidExpressionErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidExpressionErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidExpressionErrorImpl implements InvalidExpressionError {
  const _$InvalidExpressionErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GraphingError.invalidExpression(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidExpressionErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidExpressionErrorImplCopyWith<_$InvalidExpressionErrorImpl>
      get copyWith => __$$InvalidExpressionErrorImplCopyWithImpl<
          _$InvalidExpressionErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidExpression,
    required TResult Function(String message) configuration,
    required TResult Function(String message) unknown,
  }) {
    return invalidExpression(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidExpression,
    TResult? Function(String message)? configuration,
    TResult? Function(String message)? unknown,
  }) {
    return invalidExpression?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidExpression,
    TResult Function(String message)? configuration,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidExpression != null) {
      return invalidExpression(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidExpressionError value) invalidExpression,
    required TResult Function(ConfigurationError value) configuration,
    required TResult Function(UnknownGraphingError value) unknown,
  }) {
    return invalidExpression(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidExpressionError value)? invalidExpression,
    TResult? Function(ConfigurationError value)? configuration,
    TResult? Function(UnknownGraphingError value)? unknown,
  }) {
    return invalidExpression?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidExpressionError value)? invalidExpression,
    TResult Function(ConfigurationError value)? configuration,
    TResult Function(UnknownGraphingError value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidExpression != null) {
      return invalidExpression(this);
    }
    return orElse();
  }
}

abstract class InvalidExpressionError implements GraphingError {
  const factory InvalidExpressionError({required final String message}) =
      _$InvalidExpressionErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidExpressionErrorImplCopyWith<_$InvalidExpressionErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfigurationErrorImplCopyWith<$Res>
    implements $GraphingErrorCopyWith<$Res> {
  factory _$$ConfigurationErrorImplCopyWith(_$ConfigurationErrorImpl value,
          $Res Function(_$ConfigurationErrorImpl) then) =
      __$$ConfigurationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConfigurationErrorImplCopyWithImpl<$Res>
    extends _$GraphingErrorCopyWithImpl<$Res, _$ConfigurationErrorImpl>
    implements _$$ConfigurationErrorImplCopyWith<$Res> {
  __$$ConfigurationErrorImplCopyWithImpl(_$ConfigurationErrorImpl _value,
      $Res Function(_$ConfigurationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConfigurationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfigurationErrorImpl implements ConfigurationError {
  const _$ConfigurationErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GraphingError.configuration(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationErrorImplCopyWith<_$ConfigurationErrorImpl> get copyWith =>
      __$$ConfigurationErrorImplCopyWithImpl<_$ConfigurationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidExpression,
    required TResult Function(String message) configuration,
    required TResult Function(String message) unknown,
  }) {
    return configuration(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidExpression,
    TResult? Function(String message)? configuration,
    TResult? Function(String message)? unknown,
  }) {
    return configuration?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidExpression,
    TResult Function(String message)? configuration,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (configuration != null) {
      return configuration(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidExpressionError value) invalidExpression,
    required TResult Function(ConfigurationError value) configuration,
    required TResult Function(UnknownGraphingError value) unknown,
  }) {
    return configuration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidExpressionError value)? invalidExpression,
    TResult? Function(ConfigurationError value)? configuration,
    TResult? Function(UnknownGraphingError value)? unknown,
  }) {
    return configuration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidExpressionError value)? invalidExpression,
    TResult Function(ConfigurationError value)? configuration,
    TResult Function(UnknownGraphingError value)? unknown,
    required TResult orElse(),
  }) {
    if (configuration != null) {
      return configuration(this);
    }
    return orElse();
  }
}

abstract class ConfigurationError implements GraphingError {
  const factory ConfigurationError({required final String message}) =
      _$ConfigurationErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ConfigurationErrorImplCopyWith<_$ConfigurationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownGraphingErrorImplCopyWith<$Res>
    implements $GraphingErrorCopyWith<$Res> {
  factory _$$UnknownGraphingErrorImplCopyWith(_$UnknownGraphingErrorImpl value,
          $Res Function(_$UnknownGraphingErrorImpl) then) =
      __$$UnknownGraphingErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownGraphingErrorImplCopyWithImpl<$Res>
    extends _$GraphingErrorCopyWithImpl<$Res, _$UnknownGraphingErrorImpl>
    implements _$$UnknownGraphingErrorImplCopyWith<$Res> {
  __$$UnknownGraphingErrorImplCopyWithImpl(_$UnknownGraphingErrorImpl _value,
      $Res Function(_$UnknownGraphingErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownGraphingErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownGraphingErrorImpl implements UnknownGraphingError {
  const _$UnknownGraphingErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GraphingError.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownGraphingErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownGraphingErrorImplCopyWith<_$UnknownGraphingErrorImpl>
      get copyWith =>
          __$$UnknownGraphingErrorImplCopyWithImpl<_$UnknownGraphingErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) invalidExpression,
    required TResult Function(String message) configuration,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? invalidExpression,
    TResult? Function(String message)? configuration,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? invalidExpression,
    TResult Function(String message)? configuration,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidExpressionError value) invalidExpression,
    required TResult Function(ConfigurationError value) configuration,
    required TResult Function(UnknownGraphingError value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidExpressionError value)? invalidExpression,
    TResult? Function(ConfigurationError value)? configuration,
    TResult? Function(UnknownGraphingError value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidExpressionError value)? invalidExpression,
    TResult Function(ConfigurationError value)? configuration,
    TResult Function(UnknownGraphingError value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownGraphingError implements GraphingError {
  const factory UnknownGraphingError({required final String message}) =
      _$UnknownGraphingErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnknownGraphingErrorImplCopyWith<_$UnknownGraphingErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

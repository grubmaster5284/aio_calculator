// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversionError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionErrorCopyWith<$Res> {
  factory $ConversionErrorCopyWith(
          ConversionError value, $Res Function(ConversionError) then) =
      _$ConversionErrorCopyWithImpl<$Res, ConversionError>;
}

/// @nodoc
class _$ConversionErrorCopyWithImpl<$Res, $Val extends ConversionError>
    implements $ConversionErrorCopyWith<$Res> {
  _$ConversionErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundImpl implements NotFound {
  const _$NotFoundImpl();

  @override
  String toString() {
    return 'ConversionError.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements ConversionError {
  const factory NotFound() = _$NotFoundImpl;
}

/// @nodoc
abstract class _$$InvalidInputImplCopyWith<$Res> {
  factory _$$InvalidInputImplCopyWith(
          _$InvalidInputImpl value, $Res Function(_$InvalidInputImpl) then) =
      __$$InvalidInputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidInputImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$InvalidInputImpl>
    implements _$$InvalidInputImplCopyWith<$Res> {
  __$$InvalidInputImplCopyWithImpl(
      _$InvalidInputImpl _value, $Res Function(_$InvalidInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidInputImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidInputImpl implements InvalidInput {
  const _$InvalidInputImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConversionError.invalidInput(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidInputImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidInputImplCopyWith<_$InvalidInputImpl> get copyWith =>
      __$$InvalidInputImplCopyWithImpl<_$InvalidInputImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return invalidInput(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return invalidInput?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return invalidInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return invalidInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(this);
    }
    return orElse();
  }
}

abstract class InvalidInput implements ConversionError {
  const factory InvalidInput(final String message) = _$InvalidInputImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$InvalidInputImplCopyWith<_$InvalidInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutImplCopyWith<$Res> {
  factory _$$TimeoutImplCopyWith(
          _$TimeoutImpl value, $Res Function(_$TimeoutImpl) then) =
      __$$TimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$TimeoutImpl>
    implements _$$TimeoutImplCopyWith<$Res> {
  __$$TimeoutImplCopyWithImpl(
      _$TimeoutImpl _value, $Res Function(_$TimeoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimeoutImpl implements Timeout {
  const _$TimeoutImpl();

  @override
  String toString() {
    return 'ConversionError.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class Timeout implements ConversionError {
  const factory Timeout() = _$TimeoutImpl;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConversionError.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements ConversionError {
  const factory NetworkError(final String message) = _$NetworkErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TooManyRequestsImplCopyWith<$Res> {
  factory _$$TooManyRequestsImplCopyWith(_$TooManyRequestsImpl value,
          $Res Function(_$TooManyRequestsImpl) then) =
      __$$TooManyRequestsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TooManyRequestsImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$TooManyRequestsImpl>
    implements _$$TooManyRequestsImplCopyWith<$Res> {
  __$$TooManyRequestsImplCopyWithImpl(
      _$TooManyRequestsImpl _value, $Res Function(_$TooManyRequestsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TooManyRequestsImpl implements TooManyRequests {
  const _$TooManyRequestsImpl();

  @override
  String toString() {
    return 'ConversionError.tooManyRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TooManyRequestsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return tooManyRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return tooManyRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return tooManyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return tooManyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(this);
    }
    return orElse();
  }
}

abstract class TooManyRequests implements ConversionError {
  const factory TooManyRequests() = _$TooManyRequestsImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedImpl implements Unauthorized {
  const _$UnauthorizedImpl();

  @override
  String toString() {
    return 'ConversionError.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements ConversionError {
  const factory Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$ForbiddenImplCopyWith<$Res> {
  factory _$$ForbiddenImplCopyWith(
          _$ForbiddenImpl value, $Res Function(_$ForbiddenImpl) then) =
      __$$ForbiddenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForbiddenImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$ForbiddenImpl>
    implements _$$ForbiddenImplCopyWith<$Res> {
  __$$ForbiddenImplCopyWithImpl(
      _$ForbiddenImpl _value, $Res Function(_$ForbiddenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ForbiddenImpl implements Forbidden {
  const _$ForbiddenImpl();

  @override
  String toString() {
    return 'ConversionError.forbidden()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ForbiddenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return forbidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return forbidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class Forbidden implements ConversionError {
  const factory Forbidden() = _$ForbiddenImpl;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$ConversionErrorCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements Unknown {
  const _$UnknownImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConversionError.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(String message) invalidInput,
    required TResult Function() timeout,
    required TResult Function(String message) networkError,
    required TResult Function() tooManyRequests,
    required TResult Function() unauthorized,
    required TResult Function() forbidden,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(String message)? invalidInput,
    TResult? Function()? timeout,
    TResult? Function(String message)? networkError,
    TResult? Function()? tooManyRequests,
    TResult? Function()? unauthorized,
    TResult? Function()? forbidden,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(String message)? invalidInput,
    TResult Function()? timeout,
    TResult Function(String message)? networkError,
    TResult Function()? tooManyRequests,
    TResult Function()? unauthorized,
    TResult Function()? forbidden,
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
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidInput value) invalidInput,
    required TResult Function(Timeout value) timeout,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(TooManyRequests value) tooManyRequests,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidInput value)? invalidInput,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(TooManyRequests value)? tooManyRequests,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidInput value)? invalidInput,
    TResult Function(Timeout value)? timeout,
    TResult Function(NetworkError value)? networkError,
    TResult Function(TooManyRequests value)? tooManyRequests,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements ConversionError {
  const factory Unknown(final String message) = _$UnknownImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

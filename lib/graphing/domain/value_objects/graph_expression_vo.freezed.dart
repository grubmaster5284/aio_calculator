// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_expression_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphExpression {
  String get latex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GraphExpressionCopyWith<GraphExpression> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphExpressionCopyWith<$Res> {
  factory $GraphExpressionCopyWith(
          GraphExpression value, $Res Function(GraphExpression) then) =
      _$GraphExpressionCopyWithImpl<$Res, GraphExpression>;
  @useResult
  $Res call({String latex});
}

/// @nodoc
class _$GraphExpressionCopyWithImpl<$Res, $Val extends GraphExpression>
    implements $GraphExpressionCopyWith<$Res> {
  _$GraphExpressionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latex = null,
  }) {
    return _then(_value.copyWith(
      latex: null == latex
          ? _value.latex
          : latex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphExpressionImplCopyWith<$Res>
    implements $GraphExpressionCopyWith<$Res> {
  factory _$$GraphExpressionImplCopyWith(_$GraphExpressionImpl value,
          $Res Function(_$GraphExpressionImpl) then) =
      __$$GraphExpressionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latex});
}

/// @nodoc
class __$$GraphExpressionImplCopyWithImpl<$Res>
    extends _$GraphExpressionCopyWithImpl<$Res, _$GraphExpressionImpl>
    implements _$$GraphExpressionImplCopyWith<$Res> {
  __$$GraphExpressionImplCopyWithImpl(
      _$GraphExpressionImpl _value, $Res Function(_$GraphExpressionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latex = null,
  }) {
    return _then(_$GraphExpressionImpl(
      null == latex
          ? _value.latex
          : latex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GraphExpressionImpl implements _GraphExpression {
  _$GraphExpressionImpl(this.latex)
      : assert(latex.trim().isNotEmpty || latex.isEmpty,
            'Graph expression cannot be only whitespace');

  @override
  final String latex;

  @override
  String toString() {
    return 'GraphExpression(latex: $latex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphExpressionImpl &&
            (identical(other.latex, latex) || other.latex == latex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphExpressionImplCopyWith<_$GraphExpressionImpl> get copyWith =>
      __$$GraphExpressionImplCopyWithImpl<_$GraphExpressionImpl>(
          this, _$identity);
}

abstract class _GraphExpression implements GraphExpression {
  factory _GraphExpression(final String latex) = _$GraphExpressionImpl;

  @override
  String get latex;
  @override
  @JsonKey(ignore: true)
  _$$GraphExpressionImplCopyWith<_$GraphExpressionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

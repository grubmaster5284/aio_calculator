// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphConfig {
  GraphExpression get expression => throw _privateConstructorUsedError;
  bool get showExpressionsPanel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GraphConfigCopyWith<GraphConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphConfigCopyWith<$Res> {
  factory $GraphConfigCopyWith(
          GraphConfig value, $Res Function(GraphConfig) then) =
      _$GraphConfigCopyWithImpl<$Res, GraphConfig>;
  @useResult
  $Res call({GraphExpression expression, bool showExpressionsPanel});

  $GraphExpressionCopyWith<$Res> get expression;
}

/// @nodoc
class _$GraphConfigCopyWithImpl<$Res, $Val extends GraphConfig>
    implements $GraphConfigCopyWith<$Res> {
  _$GraphConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? showExpressionsPanel = null,
  }) {
    return _then(_value.copyWith(
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as GraphExpression,
      showExpressionsPanel: null == showExpressionsPanel
          ? _value.showExpressionsPanel
          : showExpressionsPanel // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GraphExpressionCopyWith<$Res> get expression {
    return $GraphExpressionCopyWith<$Res>(_value.expression, (value) {
      return _then(_value.copyWith(expression: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GraphConfigImplCopyWith<$Res>
    implements $GraphConfigCopyWith<$Res> {
  factory _$$GraphConfigImplCopyWith(
          _$GraphConfigImpl value, $Res Function(_$GraphConfigImpl) then) =
      __$$GraphConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GraphExpression expression, bool showExpressionsPanel});

  @override
  $GraphExpressionCopyWith<$Res> get expression;
}

/// @nodoc
class __$$GraphConfigImplCopyWithImpl<$Res>
    extends _$GraphConfigCopyWithImpl<$Res, _$GraphConfigImpl>
    implements _$$GraphConfigImplCopyWith<$Res> {
  __$$GraphConfigImplCopyWithImpl(
      _$GraphConfigImpl _value, $Res Function(_$GraphConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? showExpressionsPanel = null,
  }) {
    return _then(_$GraphConfigImpl(
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as GraphExpression,
      showExpressionsPanel: null == showExpressionsPanel
          ? _value.showExpressionsPanel
          : showExpressionsPanel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GraphConfigImpl implements _GraphConfig {
  const _$GraphConfigImpl(
      {required this.expression, required this.showExpressionsPanel});

  @override
  final GraphExpression expression;
  @override
  final bool showExpressionsPanel;

  @override
  String toString() {
    return 'GraphConfig(expression: $expression, showExpressionsPanel: $showExpressionsPanel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphConfigImpl &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.showExpressionsPanel, showExpressionsPanel) ||
                other.showExpressionsPanel == showExpressionsPanel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, expression, showExpressionsPanel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphConfigImplCopyWith<_$GraphConfigImpl> get copyWith =>
      __$$GraphConfigImplCopyWithImpl<_$GraphConfigImpl>(this, _$identity);
}

abstract class _GraphConfig implements GraphConfig {
  const factory _GraphConfig(
      {required final GraphExpression expression,
      required final bool showExpressionsPanel}) = _$GraphConfigImpl;

  @override
  GraphExpression get expression;
  @override
  bool get showExpressionsPanel;
  @override
  @JsonKey(ignore: true)
  _$$GraphConfigImplCopyWith<_$GraphConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_function_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculationFunctionModel {
  FunctionId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get parameters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculationFunctionModelCopyWith<CalculationFunctionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationFunctionModelCopyWith<$Res> {
  factory $CalculationFunctionModelCopyWith(CalculationFunctionModel value,
          $Res Function(CalculationFunctionModel) then) =
      _$CalculationFunctionModelCopyWithImpl<$Res, CalculationFunctionModel>;
  @useResult
  $Res call(
      {FunctionId id,
      String name,
      String description,
      List<String> parameters});
}

/// @nodoc
class _$CalculationFunctionModelCopyWithImpl<$Res,
        $Val extends CalculationFunctionModel>
    implements $CalculationFunctionModelCopyWith<$Res> {
  _$CalculationFunctionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as FunctionId,
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
abstract class _$$CalculationFunctionModelImplCopyWith<$Res>
    implements $CalculationFunctionModelCopyWith<$Res> {
  factory _$$CalculationFunctionModelImplCopyWith(
          _$CalculationFunctionModelImpl value,
          $Res Function(_$CalculationFunctionModelImpl) then) =
      __$$CalculationFunctionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FunctionId id,
      String name,
      String description,
      List<String> parameters});
}

/// @nodoc
class __$$CalculationFunctionModelImplCopyWithImpl<$Res>
    extends _$CalculationFunctionModelCopyWithImpl<$Res,
        _$CalculationFunctionModelImpl>
    implements _$$CalculationFunctionModelImplCopyWith<$Res> {
  __$$CalculationFunctionModelImplCopyWithImpl(
      _$CalculationFunctionModelImpl _value,
      $Res Function(_$CalculationFunctionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? parameters = null,
  }) {
    return _then(_$CalculationFunctionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as FunctionId,
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

class _$CalculationFunctionModelImpl implements _CalculationFunctionModel {
  const _$CalculationFunctionModelImpl(
      {required this.id,
      this.name = '',
      this.description = '',
      final List<String> parameters = const <String>[]})
      : _parameters = parameters;

  @override
  final FunctionId id;
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
    return 'CalculationFunctionModel(id: $id, name: $name, description: $description, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationFunctionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_parameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationFunctionModelImplCopyWith<_$CalculationFunctionModelImpl>
      get copyWith => __$$CalculationFunctionModelImplCopyWithImpl<
          _$CalculationFunctionModelImpl>(this, _$identity);
}

abstract class _CalculationFunctionModel implements CalculationFunctionModel {
  const factory _CalculationFunctionModel(
      {required final FunctionId id,
      final String name,
      final String description,
      final List<String> parameters}) = _$CalculationFunctionModelImpl;

  @override
  FunctionId get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get parameters;
  @override
  @JsonKey(ignore: true)
  _$$CalculationFunctionModelImplCopyWith<_$CalculationFunctionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

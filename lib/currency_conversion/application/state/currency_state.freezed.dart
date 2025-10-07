// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyState {
  DataState<ConversionResultModel> get conversionState =>
      throw _privateConstructorUsedError;
  DataState<List<CurrencyModel>> get supportedCurrenciesState =>
      throw _privateConstructorUsedError;
  DataState<RateModel> get rateState => throw _privateConstructorUsedError;
  String get selectedFromCurrency => throw _privateConstructorUsedError;
  String get selectedToCurrency => throw _privateConstructorUsedError;
  String get amountInput => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  bool get isSwapping => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyStateCopyWith<CurrencyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyStateCopyWith<$Res> {
  factory $CurrencyStateCopyWith(
          CurrencyState value, $Res Function(CurrencyState) then) =
      _$CurrencyStateCopyWithImpl<$Res, CurrencyState>;
  @useResult
  $Res call(
      {DataState<ConversionResultModel> conversionState,
      DataState<List<CurrencyModel>> supportedCurrenciesState,
      DataState<RateModel> rateState,
      String selectedFromCurrency,
      String selectedToCurrency,
      String amountInput,
      bool isRefreshing,
      bool isSwapping});

  $DataStateCopyWith<ConversionResultModel, $Res> get conversionState;
  $DataStateCopyWith<List<CurrencyModel>, $Res> get supportedCurrenciesState;
  $DataStateCopyWith<RateModel, $Res> get rateState;
}

/// @nodoc
class _$CurrencyStateCopyWithImpl<$Res, $Val extends CurrencyState>
    implements $CurrencyStateCopyWith<$Res> {
  _$CurrencyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversionState = null,
    Object? supportedCurrenciesState = null,
    Object? rateState = null,
    Object? selectedFromCurrency = null,
    Object? selectedToCurrency = null,
    Object? amountInput = null,
    Object? isRefreshing = null,
    Object? isSwapping = null,
  }) {
    return _then(_value.copyWith(
      conversionState: null == conversionState
          ? _value.conversionState
          : conversionState // ignore: cast_nullable_to_non_nullable
              as DataState<ConversionResultModel>,
      supportedCurrenciesState: null == supportedCurrenciesState
          ? _value.supportedCurrenciesState
          : supportedCurrenciesState // ignore: cast_nullable_to_non_nullable
              as DataState<List<CurrencyModel>>,
      rateState: null == rateState
          ? _value.rateState
          : rateState // ignore: cast_nullable_to_non_nullable
              as DataState<RateModel>,
      selectedFromCurrency: null == selectedFromCurrency
          ? _value.selectedFromCurrency
          : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      selectedToCurrency: null == selectedToCurrency
          ? _value.selectedToCurrency
          : selectedToCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      amountInput: null == amountInput
          ? _value.amountInput
          : amountInput // ignore: cast_nullable_to_non_nullable
              as String,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSwapping: null == isSwapping
          ? _value.isSwapping
          : isSwapping // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataStateCopyWith<ConversionResultModel, $Res> get conversionState {
    return $DataStateCopyWith<ConversionResultModel, $Res>(
        _value.conversionState, (value) {
      return _then(_value.copyWith(conversionState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataStateCopyWith<List<CurrencyModel>, $Res> get supportedCurrenciesState {
    return $DataStateCopyWith<List<CurrencyModel>, $Res>(
        _value.supportedCurrenciesState, (value) {
      return _then(_value.copyWith(supportedCurrenciesState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataStateCopyWith<RateModel, $Res> get rateState {
    return $DataStateCopyWith<RateModel, $Res>(_value.rateState, (value) {
      return _then(_value.copyWith(rateState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyStateImplCopyWith<$Res>
    implements $CurrencyStateCopyWith<$Res> {
  factory _$$CurrencyStateImplCopyWith(
          _$CurrencyStateImpl value, $Res Function(_$CurrencyStateImpl) then) =
      __$$CurrencyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataState<ConversionResultModel> conversionState,
      DataState<List<CurrencyModel>> supportedCurrenciesState,
      DataState<RateModel> rateState,
      String selectedFromCurrency,
      String selectedToCurrency,
      String amountInput,
      bool isRefreshing,
      bool isSwapping});

  @override
  $DataStateCopyWith<ConversionResultModel, $Res> get conversionState;
  @override
  $DataStateCopyWith<List<CurrencyModel>, $Res> get supportedCurrenciesState;
  @override
  $DataStateCopyWith<RateModel, $Res> get rateState;
}

/// @nodoc
class __$$CurrencyStateImplCopyWithImpl<$Res>
    extends _$CurrencyStateCopyWithImpl<$Res, _$CurrencyStateImpl>
    implements _$$CurrencyStateImplCopyWith<$Res> {
  __$$CurrencyStateImplCopyWithImpl(
      _$CurrencyStateImpl _value, $Res Function(_$CurrencyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversionState = null,
    Object? supportedCurrenciesState = null,
    Object? rateState = null,
    Object? selectedFromCurrency = null,
    Object? selectedToCurrency = null,
    Object? amountInput = null,
    Object? isRefreshing = null,
    Object? isSwapping = null,
  }) {
    return _then(_$CurrencyStateImpl(
      conversionState: null == conversionState
          ? _value.conversionState
          : conversionState // ignore: cast_nullable_to_non_nullable
              as DataState<ConversionResultModel>,
      supportedCurrenciesState: null == supportedCurrenciesState
          ? _value.supportedCurrenciesState
          : supportedCurrenciesState // ignore: cast_nullable_to_non_nullable
              as DataState<List<CurrencyModel>>,
      rateState: null == rateState
          ? _value.rateState
          : rateState // ignore: cast_nullable_to_non_nullable
              as DataState<RateModel>,
      selectedFromCurrency: null == selectedFromCurrency
          ? _value.selectedFromCurrency
          : selectedFromCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      selectedToCurrency: null == selectedToCurrency
          ? _value.selectedToCurrency
          : selectedToCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      amountInput: null == amountInput
          ? _value.amountInput
          : amountInput // ignore: cast_nullable_to_non_nullable
              as String,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSwapping: null == isSwapping
          ? _value.isSwapping
          : isSwapping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CurrencyStateImpl extends _CurrencyState {
  const _$CurrencyStateImpl(
      {this.conversionState = const DataState<ConversionResultModel>.initial(),
      this.supportedCurrenciesState =
          const DataState<List<CurrencyModel>>.initial(),
      this.rateState = const DataState<RateModel>.initial(),
      this.selectedFromCurrency = 'USD',
      this.selectedToCurrency = 'EUR',
      this.amountInput = '',
      this.isRefreshing = false,
      this.isSwapping = false})
      : super._();

  @override
  @JsonKey()
  final DataState<ConversionResultModel> conversionState;
  @override
  @JsonKey()
  final DataState<List<CurrencyModel>> supportedCurrenciesState;
  @override
  @JsonKey()
  final DataState<RateModel> rateState;
  @override
  @JsonKey()
  final String selectedFromCurrency;
  @override
  @JsonKey()
  final String selectedToCurrency;
  @override
  @JsonKey()
  final String amountInput;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  @JsonKey()
  final bool isSwapping;

  @override
  String toString() {
    return 'CurrencyState(conversionState: $conversionState, supportedCurrenciesState: $supportedCurrenciesState, rateState: $rateState, selectedFromCurrency: $selectedFromCurrency, selectedToCurrency: $selectedToCurrency, amountInput: $amountInput, isRefreshing: $isRefreshing, isSwapping: $isSwapping)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyStateImpl &&
            (identical(other.conversionState, conversionState) ||
                other.conversionState == conversionState) &&
            (identical(
                    other.supportedCurrenciesState, supportedCurrenciesState) ||
                other.supportedCurrenciesState == supportedCurrenciesState) &&
            (identical(other.rateState, rateState) ||
                other.rateState == rateState) &&
            (identical(other.selectedFromCurrency, selectedFromCurrency) ||
                other.selectedFromCurrency == selectedFromCurrency) &&
            (identical(other.selectedToCurrency, selectedToCurrency) ||
                other.selectedToCurrency == selectedToCurrency) &&
            (identical(other.amountInput, amountInput) ||
                other.amountInput == amountInput) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isSwapping, isSwapping) ||
                other.isSwapping == isSwapping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      conversionState,
      supportedCurrenciesState,
      rateState,
      selectedFromCurrency,
      selectedToCurrency,
      amountInput,
      isRefreshing,
      isSwapping);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      __$$CurrencyStateImplCopyWithImpl<_$CurrencyStateImpl>(this, _$identity);
}

abstract class _CurrencyState extends CurrencyState {
  const factory _CurrencyState(
      {final DataState<ConversionResultModel> conversionState,
      final DataState<List<CurrencyModel>> supportedCurrenciesState,
      final DataState<RateModel> rateState,
      final String selectedFromCurrency,
      final String selectedToCurrency,
      final String amountInput,
      final bool isRefreshing,
      final bool isSwapping}) = _$CurrencyStateImpl;
  const _CurrencyState._() : super._();

  @override
  DataState<ConversionResultModel> get conversionState;
  @override
  DataState<List<CurrencyModel>> get supportedCurrenciesState;
  @override
  DataState<RateModel> get rateState;
  @override
  String get selectedFromCurrency;
  @override
  String get selectedToCurrency;
  @override
  String get amountInput;
  @override
  bool get isRefreshing;
  @override
  bool get isSwapping;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

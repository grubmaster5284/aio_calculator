import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

part 'currency_model.freezed.dart';

/// Domain entity representing a currency with its metadata.
@freezed
abstract class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    required CurrencyCode code,
    @Default('') String name,
    @Default('') String symbol,
  }) = _CurrencyModel;

  const CurrencyModel._();

  @override
  String toString() => '${code.value} ($name)';
}



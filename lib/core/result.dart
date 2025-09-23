/// A lightweight Result type for success/failure flows across layers.
/// Use [Result.success] for success and [Result.failure] for errors.
class Result<SuccessType, ErrorType> {
  final SuccessType? value;
  final ErrorType? error;

  const Result._({this.value, this.error});

  const Result.success(SuccessType value)
      : this._(value: value, error: null);

  const Result.failure(ErrorType error)
      : this._(value: null, error: error);

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  SuccessType get requireValue {
    if (value == null) throw StateError('Tried to access value on failure');
    return value as SuccessType;
  }

  ErrorType get requireError {
    if (error == null) throw StateError('Tried to access error on success');
    return error as ErrorType;
  }
}



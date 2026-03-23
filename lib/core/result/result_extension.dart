import 'package:bnv_opendata/core/result/result.dart';

extension ResultX<T> on Result<T> {
  R map<R>({
    required R Function(Success<T> success) success,
    required R Function(Failure<T> failure) failure,
  }) {
    if (this is Success<T>) return success(this as Success<T>);
    return failure(this as Failure<T>);
  }

  R maybeWhen<R>({
    R Function(T data)? success,
    R Function(ApiError error)? failure,
    required R Function() orElse,
  }) {
    if (this is Success<T> && success != null) {
      return success((this as Success<T>).data);
    }
    if (this is Failure<T> && failure != null) {
      return failure((this as Failure<T>).error);
    }
    return orElse();
  }
}

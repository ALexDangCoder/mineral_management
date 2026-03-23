sealed class Result<T> {
  const Result();

  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  });

  factory Result.success(T data) = Success<T>;
  factory Result.failure(ApiError error) = Failure<T>;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  }) => success(data);
}

class Failure<T> extends Result<T> {
  final ApiError error;
  const Failure(this.error);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  }) => failure(error);
}


enum ApiErrorType {
  server,
  network,
  timeout,
  unauthorized,
  unknown,
}

class ApiError {
  final String message;
  final int? code;
  final dynamic data;
  final ApiErrorType type;

  const ApiError({
    required this.message,
    this.code,
    this.data,
    this.type = ApiErrorType.unknown,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] ?? 'Unknown error',
      code: json['code'] as int?,
      data: json['data'],
      type: ApiErrorType.unknown,
    );
  }

  factory ApiError.networkFromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] ?? 'Network error',
      code: json['code'] as int?,
      data: json['data'],
      type: ApiErrorType.network,
    );
  }

  factory ApiError.timeoutFromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] ?? 'Request timeout',
      code: json['code'] as int?,
      data: json['data'],
      type: ApiErrorType.timeout,
    );
  }

  factory ApiError.unauthorizedFromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] ?? 'Unauthorized',
      code: json['code'] as int?,
      data: json['data'],
      type: ApiErrorType.unauthorized,
    );
  }
}

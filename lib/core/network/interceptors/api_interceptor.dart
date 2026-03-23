import 'package:bnv_opendata/core/result/result.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ApiError apiError;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        apiError = ApiError.timeout(err.message ?? 'Request timeout');
        break;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        apiError = ApiError(
          message: err.response?.data?['message'] ?? 'Server error',
          code: statusCode,
          data: err.response?.data,
          type: ApiErrorType.server,
        );
        break;

      case DioExceptionType.cancel:
        apiError = const ApiError(
          message: 'Request cancelled',
        );
        break;

      case DioExceptionType.connectionError:
        apiError = ApiError.network(err.message ?? 'Network error');
        break;

      default:
        apiError = ApiError(
          message: err.message ?? 'Unknown error',
        );
    }

    // Trả về lỗi đã chuẩn hoá
    handler.next(DioException(
      requestOptions: err.requestOptions,
      error: apiError,
    ));
  }
}

import 'package:bnv_opendata/core/result/result.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ApiError apiError;
    final Map<String, dynamic> json = err.response?.data is Map<String, dynamic>
        ? err.response?.data as Map<String, dynamic>
        : {};
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        apiError = ApiError.timeoutFromJson(json);
        break;

      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          apiError = ApiError.unauthorizedFromJson(json);
        } else {
          apiError = ApiError.fromJson(json);
        }
        break;

      case DioExceptionType.cancel:
        apiError = const ApiError(
          message: 'Request cancelled',
        );
        break;

      case DioExceptionType.connectionError:
        apiError = ApiError.networkFromJson(json);
        break;

      default:
        apiError = ApiError(
          message: err.message ?? 'Unknown error',
          code: err.response?.statusCode,
          data: err.response?.data,
        );
    }

    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: apiError,
    ));
  }
}

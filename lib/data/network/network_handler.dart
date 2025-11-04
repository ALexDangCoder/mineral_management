import 'package:bnv_opendata/data/exception/app_exception.dart';
// import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:dio/dio.dart';

class NetworkHandler {
  static AppException handleError(DioExceptionType error) {
    return _handleError(error);
  }

  static AppException _handleError(error) {
    // if (error is! DioError) {
    //   return AppException(S.current.error, S.current.something_went_wrong);
    // }
    if (_isNetWorkError(error)) {
      return AppException(S.current.error, S.current.something_went_wrong);
    }
    final parsedException = _parseError(error);
    final errorCode = error.response?.statusCode;
    if (errorCode == 503) {
      return MaintenanceException();
    }
    return parsedException;
  }

  static bool _isNetWorkError(DioExceptionType error) {
    final errorType = error;
    switch (errorType) {
      case DioExceptionType.cancel:
        return true;
      case DioExceptionType.connectionTimeout:
        return true;
      case DioExceptionType.receiveTimeout:
        return true;
      case DioExceptionType.sendTimeout:
        return true;
      case DioExceptionType.unknown:
        return true;
      case DioExceptionType.connectionError:
        return true;
      default:
        return true;
    }
  }

  static AppException _parseError(DioError error) {
    if (error.response?.data is! Map<String, dynamic>) {
      return AppException(S.current.error, S.current.something_went_wrong);
    }
    return AppException(S.current.error, S.current.something_went_wrong);
  }
}

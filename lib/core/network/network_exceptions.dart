import 'package:dio/dio.dart';

class NetworkExceptions {
  static String map(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";

      case DioExceptionType.badResponse:
        return e.response?.data["message"] ??
            "Server error";

      default:
        return "Unexpected error";
    }
  }
}
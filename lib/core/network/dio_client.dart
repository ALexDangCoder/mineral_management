import 'package:bnv_opendata/core/network/interceptors/auth_interceptor.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
class DioClient {
  final Dio dio;

  DioClient({
    required String baseUrl,
    required AuthEventBus eventBus,
  }) : dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ) {
    dio.interceptors.addAll([
      AuthInterceptor(eventBus),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }
}
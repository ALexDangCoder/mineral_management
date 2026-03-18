import 'dart:io';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:bnv_opendata/core/network/interceptors/auth_interceptor.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:dio/dio.dart';

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
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    dio.interceptors.addAll([
      AuthInterceptor(eventBus),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }
}
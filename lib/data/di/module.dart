import 'package:bnv_opendata/data/di/flutter_transformer.dart';
import 'package:bnv_opendata/domain/env/model/app_constants.dart';
import 'package:bnv_opendata/domain/locals/prefs_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void configureDependencies() {}

int _connectTimeOut = 60000;

Dio provideDio() {
  final appConstants = Get.find<AppConstants>();
  final options = BaseOptions(
    baseUrl: appConstants.baseUrl,
    receiveTimeout: Duration(milliseconds: _connectTimeOut),
    connectTimeout: Duration(milliseconds: _connectTimeOut),
    followRedirects: false,
  );
  final dio = Dio(options);
  dio.transformer = FlutterTransformer();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        final String accessToken = PrefsService.getToken();
        options.baseUrl = appConstants.baseUrl;
        options.headers['Content-Type'] = 'application/json';
        options.headers['X-Client-Version'] = '1.0';
        if (accessToken.isNotEmpty) {
          options.headers.remove('Authorization');
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        return handler.next(e); //continue
      },
    ),
  );
  if (Foundation.kDebugMode) {
    dio.interceptors.add(dioLogger());
  }
  return dio;
}

PrettyDioLogger dioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    maxWidth: 100,
  );
}

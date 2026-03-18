import 'package:bnv_opendata/presentation/main_cubit/auth_event.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  // final TokenStorage tokenStorage;
  final AuthEventBus eventBus;
  // AuthInterceptor(this.tokenStorage);
  AuthInterceptor(this.eventBus);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // final token = await tokenStorage.getToken();

    // if (token != null) {
      // options.headers['Authorization'] = 'Bearer $token';
    // }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final path = err.requestOptions.path;
    final isLoginEndpoint = path.contains('/auth/token');

    if (err.response?.statusCode == 401 && !isLoginEndpoint) {
      eventBus.emit(SessionExpiredEvent());
    }

    super.onError(err, handler);
  }

}
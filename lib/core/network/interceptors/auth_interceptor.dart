import 'package:bnv_opendata/presentation/main_cubit/auth_event.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final AppLocalStorageRepository localStorage;
  final AuthEventBus eventBus;

  AuthInterceptor(this.localStorage, this.eventBus);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await localStorage.getToken();
    final isLogin = options.path.contains('/auth/token') && options.method == 'POST';

    if (token != null && token.isNotEmpty && !isLogin) {
      options.headers['Authorization'] = 'Bearer $token'; // Chèn token vào tất cả Request trừ Login
    }

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
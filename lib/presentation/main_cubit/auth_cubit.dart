import 'dart:async';

import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/domain/usecases/usecase_export.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event.dart';
import 'package:bnv_opendata/presentation/main_cubit/auth_event_bus.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'auth_state.dart';

class AuthCubit extends BaseCubit<AuthState> {
  AuthCubit(
    this.checkAuthStatusUseCase,
    this.eventBus,
    this.authRepository,
  ) : super(
          const AuthState(),
        ) {
    _sub = eventBus.stream.listen((event) {
      if (event is SessionExpiredEvent) {
        print('========= LISTEN EVENT BUS');
        sessionExpired();
      }
    });
  }

  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final AuthEventBus eventBus;
  final AuthRepository authRepository;
  StreamSubscription? _sub;
  bool _isSessionExpiredHandled = false;

  Future<void> sessionExpired() async {
    if (_isSessionExpiredHandled) return;
    _isSessionExpiredHandled = true;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(
      authStatus: AuthStatusEnum.sessionExpired,
    ));
  }

  void resetSessionExpired() {
    _isSessionExpiredHandled = false;
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    final token = await checkAuthStatusUseCase.call();
    if (token) {
      emit(state.copyWith(authStatus: AuthStatusEnum.authenticated));
    } else {
      emit(state.copyWith(authStatus: AuthStatusEnum.unauthenticated));
    }
  }

  Future<void> setAuthStatus({
    AuthStatusEnum authStatus = AuthStatusEnum.unknown,
    UserModel? user,
  }) async {
    emit(
      state.copyWith(
        authStatus: authStatus,
        user: user,
      ),
    );
  }

  Future<void> logout() async {
    try {
      await authRepository.logout();
    } catch (_) {}
    emit(state.copyWith(
      authStatus: AuthStatusEnum.unauthenticated,
    ));
  }

  Future<void> saveToken(String token) async {
    // await authRepository.saveAccessToken(token);
    emit(Authenticated());
  }
}

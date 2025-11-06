import 'dart:developer';

import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'auth_state.dart';

class AuthCubit extends BaseCubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> checkAuthenticationStatus() async {
    emit(AuthLoading());
    final token = await authRepository.getSavedAccessToken();
    log('Saved Access Token: $token');
    if (token != null && token.isNotEmpty) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoading());
    Future.delayed(const Duration(milliseconds: 800), () async {
      await authRepository.login(username, password);
      emit(Authenticated());
    });
  }

  Future<void> changePassword({
    required String current,
    required String newPass,
  }) async {
    emit(ChangingPassLoading());
    Future.delayed(const Duration(milliseconds: 800), () {
      authRepository.changePassword(current, newPass);
      emit(ChangedPasswordSuccess());
    });
  }

  Future<void> logout() async {
    await authRepository.logout();
    emit(Unauthenticated());
  }

  Future<void> saveToken(String token) async {
    // await authRepository.saveAccessToken(token);
    emit(Authenticated());
  }
}

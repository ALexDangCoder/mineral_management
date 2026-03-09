import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/domain/usecases/usecase_export.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginUseCase,
  ) : super(const LoginState());
  final LoginUseCase loginUseCase;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(eventState: const LoadingState()));
    Future.delayed(const Duration(milliseconds: 800), () async {
      final response = await loginUseCase.call(username, password);
      response.when(
        success: (user) {
          emit(state.copyWith(
            eventState: LoadedState(data: user),
          ));
        },
        failure: (_) {
          emit(state.copyWith(eventState: const ErrorState()));
        },
      );
    });
  }

  void changeUsername(String input) {
    emit(
      state.copyWith(
        username: input.trim(),
      ),
    );
    validateInput();
  }

  void changePassword(String input) {
    emit(
      state.copyWith(
        password: input.trim(),
      ),
    );
    validateInput();
  }

  Future<void> validateInput() async {
    emit(
      state.copyWith(
          loginBtnIsEnable: (state.username?.length ?? 0) >= 6 &&
              (state.password?.length ?? 0) >= 8),
    );
  }

  void toggleShowPass() {
    emit(state.copyWith(isShowPass: !state.isShowPass));
  }
}

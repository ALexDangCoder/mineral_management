import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

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

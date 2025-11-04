import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void changeUsername(String input) {
    emit(
      state.copyWith(
        username: input.trim(),
        loginBtnIsEnable: (state.username?.length ?? 0) > 6 &&
            (state.password?.length ?? 0) >= 6,
      ),
    );
  }

  void changePassword(String input) {
    emit(
      state.copyWith(
        password: input.trim(),
        loginBtnIsEnable: (state.username?.length ?? 0) > 6 &&
            (state.password?.length ?? 0) >= 6,
      ),
    );
  }

  Future<bool> validateInput() async {
    ///
    return state.loginBtnIsEnable;
  }
}

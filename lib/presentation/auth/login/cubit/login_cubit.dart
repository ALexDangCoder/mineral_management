import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/repositories/auth_repository.dart';
import 'package:bnv_opendata/domain/usecases/usecase_export.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginUseCase,
    this.authRepository,
  ) : super(const LoginState());
  final LoginUseCase loginUseCase;
  final AuthRepository authRepository;

  Future<void> preLogin() async {
    final username = await authRepository.getCachedUsername();
    print('======USERNAME $username');
    if (username != null && username.isNotEmpty) {
      emit(
        state.copyWith(
          username: username,
          cachedUsername: username,
        ),
      );
      await validateInput();
    }
  }

  Future<String?> sendCode(String email) async {
    emit(state.copyWith(eventState: const LoadingState()));
    final result = await authRepository.sendCode(email);

    return result.when(
      success: (data) {
        emit(state.copyWith(eventState: LoadedState(data: data)));
        return null;
      },
      failure: (error) {
        emit(state.copyWith(eventState: ErrorState(data: error.message)));
        return error.message;
      },
    );
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(eventState: const LoadingState()));

    final response = await loginUseCase.call(username, password);
    response.when(
      success: (user) {
        emit(
          state.copyWith(
            eventState: LoadedState(data: user),
          ),
        );
      },
      failure: (failure) {
        if (failure.data != null && failure.data is Map<String, dynamic>) {
          final Map<String, dynamic> data =
              failure.data as Map<String, dynamic>;
          if (data.containsKey('requireCaptcha')) {
            emit(
              state.copyWith(isRequireCaptcha: data['requireCaptcha'] as bool),
            );
          }
        }

        emit(state.copyWith(eventState: ErrorState(data: failure.message)));
      },
    );
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
        loginBtnIsEnable: (state.username?.isNotEmpty == true) &&
            (state.password?.length ?? 0) >= 8,
      ),
    );
  }

  void toggleShowPass() {
    emit(state.copyWith(isShowPass: !state.isShowPass));
  }
}

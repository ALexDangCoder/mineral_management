import 'package:bnv_opendata/domain/usecases/usecase_export.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends BaseCubit<ChangePasswordState> {
  ChangePasswordCubit(
    this.changePasswordUseCase,
  ) : super(
          const ChangePasswordState(),
        );
  final ChangePasswordUseCase changePasswordUseCase;

  Future<void> changePassword({
    required String current,
    required String newPass,
  }) async {
    emit(state.copyWith(eventState: const LoadingState()));
    Future.delayed(const Duration(milliseconds: 800), () async {
      final result = await changePasswordUseCase.call(current, newPass);
      result.when(success: (_) {
        emit(state.copyWith(eventState: const LoadedState()));
      }, failure: (__) {
        emit(state.copyWith(eventState: const ErrorState()));
      });
    });
  }

  Future<bool> validateInput({
    required String current,
    required String newPass,
    required String confirmPass,
  }) async {
    // if error =>
    // emit(state.copyWith(
    //     validationInput: const ErrorState(data: 'Input không hợp lệ')));

    //if valid input =>
    emit(state.copyWith(validationInput: const LoadedState()));
    return true;
  }
}

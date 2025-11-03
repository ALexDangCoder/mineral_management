import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends BaseCubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

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

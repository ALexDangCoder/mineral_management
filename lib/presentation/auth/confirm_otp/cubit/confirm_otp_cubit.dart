import 'dart:async';

import 'package:bnv_opendata/domain/repositories/auth_repository.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'confirm_otp_state.dart';

class ConfirmOtpCubit extends BaseCubit<ConfirmOtpState> {
  final String email;
  final AuthRepository authRepository;

  ConfirmOtpCubit({
    required this.email,
    required this.authRepository,
  }) : super(const ConfirmOtpState());

  Timer? _timer;
  String _otpCode = '';

  void requestOtp() async {
    if (!state.canResend) return;

    emit(state.copyWith(eventState: const LoadingState()));
    final result = await authRepository.sendCode(email);
    
    result.when(
      success: (data) {
        emit(state.copyWith(eventState: LoadedState(data: data)));
        _startTimer();
      },
      failure: (message) {
        emit(state.copyWith(eventState: ErrorState(data: message)));
      },
    );
  }

  void startTimer() {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    emit(
      state.copyWith(
        second: 60,
        canResend: false,
      ),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newSeconds = state.second - 1;

      if (newSeconds <= 0) {
        timer.cancel();
        emit(
          state.copyWith(
            second: 0,
            canResend: true,
          ),
        );
      } else {
        emit(
          state.copyWith(second: newSeconds),
        );
      }
    });
  }

  Future<bool> confirmOtp() async {
    emit(state.copyWith(eventState: const LoadingState()));
    final result = await authRepository.verifyCode(email, _otpCode);
    
    return result.when(
      success: (data) {
        emit(state.copyWith(eventState: LoadedState(data: data)));
        return true;
      },
      failure: (message) {
        emit(state.copyWith(eventState: ErrorState(data: message)));
        return false;
      },
    );
  }

  Future<void> onChangeOtp({String? otpCode}) async {
    _otpCode = otpCode ?? '';
    emit(state.copyWith(confirmBtnIsEnable: _otpCode.length == 6));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

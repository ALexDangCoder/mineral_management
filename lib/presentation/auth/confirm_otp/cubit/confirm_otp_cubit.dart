import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/config/base/base_state.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';

part 'confirm_otp_state.dart';

class ConfirmOtpCubit extends BaseCubit<ConfirmOtpState> {
  ConfirmOtpCubit() : super(const ConfirmOtpState());

  Timer? _timer;

  void requestOtp() {
    if (!state.canResend) return;

    // otpRepository.sendOtp();

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

  Future<void> confirmOtp() async {
    // emit(state.copyWith(confirmBtnIsEnable: otpCode?.length == 8));
  }

  Future<void> onChangeOtp({String? otpCode}) async {
    emit(state.copyWith(confirmBtnIsEnable: otpCode?.length == 8));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

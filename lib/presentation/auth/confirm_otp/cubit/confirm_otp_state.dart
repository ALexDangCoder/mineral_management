part of 'confirm_otp_cubit.dart';

final class ConfirmOtpState extends BaseState {
  final int second;
  final bool canResend;
  final bool confirmBtnIsEnable;

  const ConfirmOtpState({
    this.second = 60,
    this.canResend = true,
    this.confirmBtnIsEnable = false,
  });

  ConfirmOtpState copyWith({
    int? second,
    bool? canResend,
    bool? confirmBtnIsEnable,
  }) {
    return ConfirmOtpState(
      second: second ?? this.second,
      canResend: canResend ?? this.canResend,
      confirmBtnIsEnable: confirmBtnIsEnable ?? this.confirmBtnIsEnable,
    );
  }

  @override
  List<Object?> get props => [
        second,
        canResend,
        confirmBtnIsEnable,
      ];
}

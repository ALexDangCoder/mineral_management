part of 'confirm_otp_cubit.dart';

final class ConfirmOtpState extends BaseState {
  final int second;
  final bool canResend;
  final bool confirmBtnIsEnable;
  final BaseState? eventState;

  const ConfirmOtpState({
    this.second = 60,
    this.canResend = true,
    this.confirmBtnIsEnable = false,
    this.eventState,
  });

  ConfirmOtpState copyWith({
    int? second,
    bool? canResend,
    bool? confirmBtnIsEnable,
    BaseState? eventState,
  }) {
    return ConfirmOtpState(
      second: second ?? this.second,
      canResend: canResend ?? this.canResend,
      confirmBtnIsEnable: confirmBtnIsEnable ?? this.confirmBtnIsEnable,
      eventState: eventState ?? this.eventState,
    );
  }

  @override
  List<Object?> get props => [
        second,
        canResend,
        confirmBtnIsEnable,
        eventState,
      ];
}

class ConfirmCodeSuccess extends BaseState {}
// class ConfirmCodeF extends BaseState {}

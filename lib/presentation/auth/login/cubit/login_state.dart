part of 'login_cubit.dart';

class LoginState extends BaseState {
  final BaseState? eventState;
  final String? username;
  final String? password;
  final bool loginBtnIsEnable;
  final bool isShowPass;

  const LoginState(
      {this.eventState,
      this.username,
      this.password,
      this.loginBtnIsEnable = false,
      this.isShowPass = false,});

  LoginState copyWith({
    BaseState? eventState,
    String? username,
    String? password,
    bool? loginBtnIsEnable,
    bool? isShowPass,
  }) {
    return LoginState(
      eventState: eventState ?? this.eventState,
      username: username ?? this.username,
      password: password ?? this.password,
      loginBtnIsEnable: loginBtnIsEnable ?? this.loginBtnIsEnable,
      isShowPass: isShowPass ?? this.isShowPass,
    );
  }

  @override
  List<Object?> get props => [
        eventState,
        username,
        password,
        loginBtnIsEnable,
        isShowPass,
      ];
}

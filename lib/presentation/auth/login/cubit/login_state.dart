part of 'login_cubit.dart';

class LoginState extends BaseState {
  final BaseState? eventState;
  final String? username;
  final String? password;
  final bool loginBtnIsEnable;
  final bool isShowPass;
  final String? cachedUsername;

  const LoginState({
    this.eventState,
    this.username,
    this.password,
    this.loginBtnIsEnable = false,
    this.isShowPass = false,
    this.cachedUsername,
  });

  LoginState copyWith(
      {BaseState? eventState,
      String? username,
      String? password,
      bool? loginBtnIsEnable,
      bool? isShowPass,
      String? cachedUsername}) {
    return LoginState(
      eventState: eventState,
      username: username ?? this.username,
      password: password ?? this.password,
      loginBtnIsEnable: loginBtnIsEnable ?? this.loginBtnIsEnable,
      isShowPass: isShowPass ?? this.isShowPass,
      cachedUsername: cachedUsername,
    );
  }

  @override
  List<Object?> get props => [
        eventState,
        username,
        password,
        loginBtnIsEnable,
        isShowPass,
        cachedUsername,
      ];
}

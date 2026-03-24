part of 'login_cubit.dart';

class LoginState extends BaseState {
  final BaseState? eventState;
  final String? username;
  final String? password;
  final String captcha;
  final bool loginBtnIsEnable;
  final bool isShowPass;
  final bool isRequireCaptcha;
  final String? cachedUsername;

  const LoginState({
    this.eventState,
    this.username,
    this.password,
    this.captcha = '',
    this.loginBtnIsEnable = false,
    this.isShowPass = false,
    this.cachedUsername,
    this.isRequireCaptcha = false,
  });

  LoginState copyWith(
      {BaseState? eventState,
      String? username,
      String? password,
      String? captcha,
      bool? loginBtnIsEnable,
      bool? isShowPass,
      bool? isRequireCaptcha,
      String? cachedUsername}) {
    return LoginState(
      eventState: eventState,
      username: username ?? this.username,
      password: password ?? this.password,
      captcha: captcha ?? this.captcha,
      loginBtnIsEnable: loginBtnIsEnable ?? this.loginBtnIsEnable,
      isShowPass: isShowPass ?? this.isShowPass,
      cachedUsername: cachedUsername,
      isRequireCaptcha: isRequireCaptcha ?? this.isRequireCaptcha,
    );
  }

  bool get isValidWithCaptcha =>
      !isRequireCaptcha || captcha.length > 3;

  @override
  List<Object?> get props => [
        eventState,
        username,
        password,
        captcha,
        loginBtnIsEnable,
        isShowPass,
        cachedUsername,
        isRequireCaptcha,
      ];
}

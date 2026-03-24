part of 'captcha_cubit.dart';

@immutable
sealed class CaptchaState {}

final class CaptchaInitial extends CaptchaState {}

final class CaptchaLoading extends CaptchaState {}

final class CaptchaError extends CaptchaState {
  final String? message;

  CaptchaError(this.message);
}

final class CaptchaLoaded extends CaptchaState {
  final String? imageBase64;
  CaptchaLoaded(this.imageBase64);
}

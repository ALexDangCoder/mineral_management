import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'captcha_state.dart';

class CaptchaCubit extends Cubit<CaptchaState> {
  CaptchaCubit() : super(CaptchaInitial());
}

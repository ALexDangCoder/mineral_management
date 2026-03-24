import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/domain/repositories/auth_repository.dart';

import 'package:meta/meta.dart';

part 'captcha_state.dart';

class CaptchaCubit extends Cubit<CaptchaState> {
  CaptchaCubit(this._authRepository) : super(CaptchaInitial());

  final AuthRepository _authRepository;

  Future<void> loadCaptcha() async {
    // emit(CaptchaLoaded(
    //     'iVBORw0KGgoAAAANSUhEUgAAAMgAAABQCAIAAADTD63nAAAmuElEQVR4Xu2ce7yVVZnH9/FCpFmRlmJeUBIyRSTzkohIJqSEohkWKWioiAJBgReUVFQUFVDJlEkNSQPxAlInbqLoTDrN6DTlJOWo6Uwj44Rzn/LaZ768z9nP+zvvftZe4Lb/fP7Yn332eS/rXeu7vs+z3v2eU6u9F+/FnynWSTxaj8ck/lLir4pYsWLF9ttvb7vzZtWqVY8X8YTEX0v8rB5/I/G3Ek/W4ymJv6vHzzvH30v8oh6/lHi6Hv8g8SuJZ+qxXuLXEr+px7MS/1iP5ySel3ihHr/tHC/W4yWJf5L453r8TuJfJF6uxwaJf63HKxL/JvH7emyUeFXi3+vxH53jP+vxXxL/LfE/9fhfif+rRxUsp0rBaqTK4vTTT6+TWeN9E7CcKgUrpErBcqqagOVUKVhOVQospyoFllOlYDlVKbCcqgpYTlUKLKcqBZZTpWA5VSmwnKoUWE5VBSynKgWWU6VgOVXNwBJbxWD99Kc/XblyZaO0GqlSsMRWMVhOVROwxFYZXSlYTpWCFVKlYImtYrDEVnldKVhiqxisUlY5XSlYYqsYLKdKwVKqUmCJrTK6qoLlVKXAElttAouoSMupUrCcqhRYYqsYLKVKwXKqUmC'));
    // return;
    emit(CaptchaLoading());
    final result = await _authRepository.getCaptcha();
    result.when(success: (image) {
      emit(CaptchaLoaded(image));
    }, failure: (failure) {
      emit(CaptchaError(failure.message));
    });
  }
}

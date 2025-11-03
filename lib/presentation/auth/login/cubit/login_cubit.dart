import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());


  Future<void> validateInput(String username, String password) async {
    ///
  }
}

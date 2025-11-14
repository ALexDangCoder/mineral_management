import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState());

  Future<void> selectPage(int indexPage) async {
    emit(state.copyWith(indexPage: indexPage));
  }
}

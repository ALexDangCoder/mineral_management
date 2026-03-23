import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._authRepository) : super(const HomeState());

  final AuthRepository _authRepository;

  Future<void> getUserInfo() async {
    emit(state.copyWith(eventState: const LoadingState()));

    final result = await _authRepository.getUserProfile();
    
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            userInfoResponse: data,
            eventState: LoadedState(data: data),
          ),
        );
      },
      failure: (message) {
        emit(state.copyWith(eventState: ErrorState(data: message)));
      },
    );
  }
}

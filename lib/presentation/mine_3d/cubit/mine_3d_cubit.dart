import 'package:bnv_opendata/data/repositories/mine_repositories.dart';
import 'package:bnv_opendata/presentation/mine_3d/cubit/mine_3d_state.dart';
import 'package:bloc/bloc.dart';

class Mine3DCubit extends Cubit<Mine3DState> {
  final MineRepository _repository;
  Mine3DCubit(this._repository) : super(Mine3DInitial());

  Future<void> loadMine3DModel() async {
    emit(Mine3DLoading());
    try {
      final mine = await _repository.fetchMine3DModel();
      emit(Mine3DLoaded(mine));
    } catch (e) {
      emit(Mine3DError(e.toString()));
    }
  }
}

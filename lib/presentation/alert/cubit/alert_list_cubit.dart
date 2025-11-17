import 'package:bnv_opendata/data/repositories/alert_repository.dart';
import 'package:bnv_opendata/presentation/alert/cubit/alert_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertListCubit extends Cubit<AlertListState> {
  final AlertRepository _repo;
  AlertListCubit(this._repo) : super(const AlertListState());

  Future<void> load() async {
    emit(state.copyWith(status: AlertListStatus.loading));
    try {
      final data = await _repo.fetchAlertGroups();
      emit(state.copyWith(status: AlertListStatus.success, items: data));
    } catch (e) {
      emit(state.copyWith(status: AlertListStatus.failure, error: e.toString()));
    }
  }
}

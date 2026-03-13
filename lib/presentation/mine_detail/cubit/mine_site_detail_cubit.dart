import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'mine_site_detail_state.dart';

class MineSiteDetailCubit extends Cubit<MineSiteDetailState> {
  MineSiteDetailCubit({
    required this.siteId,
    MineModuleRepository? repository,
  })  : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const MineSiteDetailState());

  final String siteId;
  final MineModuleRepository _repository;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final site = await _repository.getMineSiteById(siteId);
      if (site == null) {
        emit(
          state.copyWith(
            status: MineScreenStatus.empty,
            errorMessage: 'Khong tim thay thong tin khu mo.',
          ),
        );
        return;
      }
      emit(state.copyWith(
          status: MineScreenStatus.success, site: site, errorMessage: null));
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Khong the tai chi tiet khu mo.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
  }

  Future<void> refresh() async {
    await fetch();
  }

  Future<void> retry() async {
    await fetch();
  }
}

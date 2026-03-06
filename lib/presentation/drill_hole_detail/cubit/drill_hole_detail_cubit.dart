import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/drill_hole.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'drill_hole_detail_state.dart';

class DrillHoleDetailCubit extends Cubit<DrillHoleDetailState> {
  DrillHoleDetailCubit({
    required this.drillHoleId,
    MineModuleRepository? repository,
  })  : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const DrillHoleDetailState());

  final String drillHoleId;
  final MineModuleRepository _repository;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final hole = await _repository.getDrillHoleById(drillHoleId);
      if (hole == null) {
        emit(
          state.copyWith(
            status: MineScreenStatus.empty,
            errorMessage: 'Khong tim thay thong tin lo khoan.',
          ),
        );
        return;
      }
      final site = await _repository.getMineSiteById(hole.siteId);
      emit(
        state.copyWith(
          status: MineScreenStatus.success,
          drillHole: hole,
          site: site,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Khong the tai chi tiet lo khoan.',
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

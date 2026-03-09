import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/mine_region.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'mine_list_state.dart';

class MineListCubit extends Cubit<MineListState> {
  MineListCubit({MineModuleRepository? repository})
      : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const MineListState());

  final MineModuleRepository _repository;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final regions = await _repository.getMineRegions();
      emit(
        state.copyWith(
          status:
              regions.isEmpty ? MineScreenStatus.empty : MineScreenStatus.success,
          regions: regions,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Khong the tai danh sach vung mo.',
        ),
      );
    }
  }

  Future<void> toggleRegion(String regionId) async {
    if (state.expandedRegionId == regionId) {
      emit(state.copyWith(clearExpandedRegion: true));
      return;
    }

    emit(state.copyWith(expandedRegionId: regionId));

    if (state.sitesByRegion.containsKey(regionId)) {
      return;
    }

    final nextLoading = Set<String>.from(state.loadingRegionIds)..add(regionId);
    emit(state.copyWith(loadingRegionIds: nextLoading));

    try {
      final sites = await _repository.getMineSitesByRegion(regionId);
      final nextSites = Map<String, List<MineSite>>.from(state.sitesByRegion)
        ..[regionId] = sites;
      final loadingAfter = Set<String>.from(state.loadingRegionIds)
        ..remove(regionId);
      emit(
        state.copyWith(
          sitesByRegion: nextSites,
          loadingRegionIds: loadingAfter,
          regionSiteErrors: Map<String, String?>.from(state.regionSiteErrors)
            ..remove(regionId),
        ),
      );
    } catch (_) {
      final loadingAfter = Set<String>.from(state.loadingRegionIds)
        ..remove(regionId);
      final nextErrors = Map<String, String?>.from(state.regionSiteErrors)
        ..[regionId] = 'Khong the tai danh sach khu mo.';
      emit(
        state.copyWith(
          loadingRegionIds: loadingAfter,
          regionSiteErrors: nextErrors,
        ),
      );
    }
  }

  Future<void> refresh() async {
    await fetch();
  }

  Future<void> retry() async {
    await fetch();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

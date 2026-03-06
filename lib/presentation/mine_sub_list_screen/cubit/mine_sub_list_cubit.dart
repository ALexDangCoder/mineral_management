import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'mine_sub_list_state.dart';

class MineSubListCubit extends Cubit<MineSubListState> {
  MineSubListCubit({
    required this.regionId,
    MineModuleRepository? repository,
  })  : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const MineSubListState());

  final String regionId;
  final MineModuleRepository _repository;
  Timer? _searchDebounce;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final sites = await _repository.getMineSitesByRegion(regionId);
      final filtered = _filterSites(sites, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          sites: sites,
          filteredSites: filtered,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Khong the tai danh sach khu mo.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      final filtered = _filterSites(state.sites, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          filteredSites: filtered,
          errorMessage: null,
        ),
      );
    });
  }

  Future<void> refresh() async {
    await fetch();
  }

  Future<void> retry() async {
    await fetch();
  }

  List<MineSite> _filterSites(List<MineSite> input, String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return input;
    }
    return input
        .where(
          (site) =>
              site.name.toLowerCase().contains(normalized) ||
              site.code.toLowerCase().contains(normalized),
        )
        .toList();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}

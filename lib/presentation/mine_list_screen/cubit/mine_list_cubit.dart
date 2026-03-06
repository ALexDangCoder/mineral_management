import 'dart:async';

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
  Timer? _searchDebounce;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final regions = await _repository.getMineRegions();
      final filtered = _filterRegions(regions, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          regions: regions,
          filteredRegions: filtered,
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

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      final filtered = _filterRegions(state.regions, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          filteredRegions: filtered,
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

  List<MineRegion> _filterRegions(List<MineRegion> input, String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return input;
    }
    return input
        .where((region) => region.name.toLowerCase().contains(normalized))
        .toList();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}

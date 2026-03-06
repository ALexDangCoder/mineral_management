import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/closure_plan.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'closure_plan_list_state.dart';

class ClosurePlanListCubit extends Cubit<ClosurePlanListState> {
  ClosurePlanListCubit({
    required this.siteId,
    MineModuleRepository? repository,
  })  : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const ClosurePlanListState());

  final String siteId;
  final MineModuleRepository _repository;
  Timer? _searchDebounce;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final plans = await _repository.getClosurePlansBySite(siteId);
      final filtered = _filterPlans(plans, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          plans: plans,
          filteredPlans: filtered,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải danh sách đề án đóng cửa.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      final filtered = _filterPlans(state.plans, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          filteredPlans: filtered,
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

  List<ClosurePlan> _filterPlans(List<ClosurePlan> input, String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return input;
    }
    return input
        .where(
          (plan) =>
              plan.code.toLowerCase().contains(normalized) ||
              plan.name.toLowerCase().contains(normalized),
        )
        .toList();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}

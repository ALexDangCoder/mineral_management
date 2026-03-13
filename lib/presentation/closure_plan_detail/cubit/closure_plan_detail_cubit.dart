import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/models/closure_plan.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'closure_plan_detail_state.dart';

class ClosurePlanDetailCubit extends Cubit<ClosurePlanDetailState> {
  ClosurePlanDetailCubit({
    required this.planId,
    MineModuleRepository? repository,
  })  : _repository = repository ?? FakeMineModuleRepository.instance,
        super(const ClosurePlanDetailState());

  final String planId;
  final MineModuleRepository _repository;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final plan = await _repository.getClosurePlanById(planId);
      if (plan == null) {
        emit(
          state.copyWith(
            status: MineScreenStatus.empty,
            errorMessage: 'Khong tim thay de an dong cua.',
          ),
        );
        return;
      }
      final site = await _repository.getMineSiteById(plan.siteId);
      emit(
        state.copyWith(
          status: MineScreenStatus.success,
          plan: plan,
          site: site,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Khong the tai chi tiet de an dong cua.',
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

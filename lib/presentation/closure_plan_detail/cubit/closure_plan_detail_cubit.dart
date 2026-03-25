import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'closure_plan_detail_state.dart';

class ClosurePlanDetailCubit extends Cubit<ClosurePlanDetailState> {
  ClosurePlanDetailCubit({
    required this.planId,
    required MainMineRepository repository,
  })  : _repository = repository,
        super(const ClosurePlanDetailState());

  final String planId;
  final MainMineRepository _repository;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    final result = await _repository.getMineClosurePlanDetail({'id': planId});
    result.when(
      success: (plan) async {
        if (plan.areaId != null) {
          final areaResult =
              await _repository.getDetailMineArea({'id': plan.areaId});
          areaResult.when(
            success: (area) {
              emit(state.copyWith(
                status: MineScreenStatus.success,
                plan: plan,
                area: area,
              ));
            },
            failure: (error) {
              emit(state.copyWith(
                status: MineScreenStatus.success,
                plan: plan,
              ));
            },
          );
        } else {
          emit(state.copyWith(
            status: MineScreenStatus.success,
            plan: plan,
          ));
        }
      },
      failure: (error) {
        emit(state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải chi tiết đề án đóng cửa.',
        ));
      },
    );
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

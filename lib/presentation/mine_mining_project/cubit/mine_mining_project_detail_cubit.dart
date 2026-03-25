import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mine_mining_project_detail_state.dart';

class MineMiningProjectDetailCubit extends Cubit<MineMiningProjectDetailState> {
  MineMiningProjectDetailCubit(this._mainMineRepository)
      : super(const MineMiningProjectDetailState());

  final MainMineRepository _mainMineRepository;

  Future<void> init(String id) async {
    emit(state.copyWith(id: id));
    await fetch();
  }

  Future<void> fetch() async {
    if (state.id == null) return;
    
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final result = await _mainMineRepository.getMiningProjectDetail({
        'id': state.id,
      });
      result.when(
        success: (data) {
          emit(
            state.copyWith(
              miningProject: data,
              status: MineScreenStatus.success,
            ),
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              status: MineScreenStatus.failure,
              errorMessage: 'Không thể tải chi tiết dự án khai thác.',
            ),
          );
        },
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Đã có lỗi xảy ra. Vui lòng thử lại sau.',
        ),
      );
    }
  }

  Future<void> refresh() async {
    await fetch();
  }
}

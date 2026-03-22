import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mine_site_detail_state.dart';

class MineSiteDetailCubit extends Cubit<MineSiteDetailState> {
  MineSiteDetailCubit(this._mainMineRepository)
      : super(const MineSiteDetailState());

  final MainMineRepository _mainMineRepository;

  Future<void> init(String areaId) async {
    emit(state.copyWith(areaId: areaId));
    await fetch();
  }

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      final result = await _mainMineRepository.getDetailMineArea({
        'id': state.areaId,
      });
      result.when(success: (data) {
        emit(
          state.copyWith(
            mineAreaModel: data,
            status: MineScreenStatus.success,
          ),
        );
      }, failure: (failure) {
        emit(
          state.copyWith(
            status: MineScreenStatus.failure,
            errorMessage: 'Không thể tải chi tiết khu mỏ.',
          ),
        );
      });

      // if (result == null) {
      //   emit(
      //     state.copyWith(
      //       status: MineScreenStatus.empty,
      //       errorMessage: 'Khong tim thay thong tin khu mo.',
      //     ),
      //   );
      //   return;
      // }
      // emit(state.copyWith(
      //     status: MineScreenStatus.success,
      //     mineAreaModel: null,
      //     errorMessage: null));
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải chi tiết khu mỏ.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(areaId: value));
  }

  Future<void> refresh() async {
    await fetch();
  }

  Future<void> retry() async {
    await fetch();
  }
}

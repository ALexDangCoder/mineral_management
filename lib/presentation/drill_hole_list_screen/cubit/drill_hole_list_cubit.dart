import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/drill_hole_model.dart';
import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:bnv_opendata/utils/constants/enums/mine_status_enum.dart';
import 'package:meta/meta.dart';

part 'drill_hole_list_state.dart';

class DrillHoleListCubit extends Cubit<DrillHoleListState> {
  DrillHoleListCubit() : super(const DrillHoleListState());

  final fakeHoleList = [
    const DrillHoleModel(
      holeId: 0,
      holeName: 'Lỗ khoan LK1',
      description: 'XXy',
      mine: MineModel(
          id: 0,
          mineName: 'Khu mỏ Thạch Khê',
          mineralType: 'Sắt',
          status: MineStatusEnum.active),
    ),
    const DrillHoleModel(
      holeId: 1,
      holeName: 'Lỗ khoan LK2',
      description: 'ZZZZ',
      mine: MineModel(
          id: 2,
          mineName: 'Mỏ Apatit Lào Cai',
          mineralType: 'Apatit',
          status: MineStatusEnum.pause),
    )
  ];

  Future<void> fetchHoleList({
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (state.isLoadingMore == true || (state.hasMore == false && isLoadMore)) {
      return;
    }
    emit(
      state.copyWith(
        eventState:
            (isLoadMore || isRefresh) ? state.eventState : const LoadingState(),
        isLoadingMore: isLoadMore ? true : false,
      ),
    );
    // final result = xxx cal API
    emit(
      state.copyWith(
        eventState: const LoadedState(),
        data: fakeHoleList,
        // hasMore: data.content.length == max,
        // page: data.current + 1,
        isLoadingMore: false,
      ),
    );
  }
}

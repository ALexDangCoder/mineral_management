import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:bnv_opendata/utils/constants/enums/mine_status_enum.dart';

part 'mine_list_state.dart';

class MineListCubit extends BaseCubit<MineListState> {
  MineListCubit() : super(const MineListState());

  Future<void> fetchDataMineList({
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
        data: [
          const MineModel(
              id: 0,
              mineName: 'Khu mỏ Thạch Khê',
              mineralType: 'Sắt',
              status: MineStatusEnum.active),
          const MineModel(
              id: 1,
              mineName: 'Mỏ Than Nà Pó',
              mineralType: 'Than',
              status: MineStatusEnum.active),
          const MineModel(
              id: 2,
              mineName: 'Mỏ Apatit Lào Cai',
              mineralType: 'Apatit',
              status: MineStatusEnum.pause),
        ],
        // hasMore: data.content.length == max,
        // page: data.current + 1,
        isLoadingMore: false,
      ),
    );
  }
}

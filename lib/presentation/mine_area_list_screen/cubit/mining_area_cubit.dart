import 'package:bnv_opendata/data/models/mining_area_model.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';

part 'mining_area_state.dart';

class MiningAreaCubit extends BaseCubit<MiningAreaState> {
  MiningAreaCubit(this._mainMineRepository) : super(const MiningAreaState());

  final MainMineRepository _mainMineRepository;

  Future<void> fetchMineAreaList(MineRegionModel? region) async {
    // await
    emit(
      state.copyWith(
          regionModel: region, regionIdList: [region?.regionId ?? '']),
    );
    await getListMineAreas();
  }

  Future<void> getListMineAreas({int? page = 1, String? searchKey}) async {
    if (page == 1) {
      emit(state.copyWith(screenStatus: MineScreenStatus.loading));
    }
    final params = BasePageParam<ListAreaFilter>(
      pageSize: 10,
      pageNow: page,
      filter: ListAreaFilter(
        regionId: state.regionIdList,
        areaName: state.searchKey,
      ),
    );
    final result = await _mainMineRepository.getListMineAreas(
      params.toJson(
        (filter) => filter.toJson(),
      ),
    );
    result.when(
      success: (data) {
        final List<MineAreaModel>? arrivalList = data.items;
        final List<MineAreaModel>? newList;
        if (data.pageNow == 1) {
          newList = arrivalList;
        } else {
          newList = [...?state.mineAreaList, ...?arrivalList];
        }
        emit(
          state.copyWith(
            screenStatus: (newList?.isEmpty ?? false)
                ? MineScreenStatus.empty
                : MineScreenStatus.success,
            mineAreaList: newList,
            hasMore: (data.pageNow ?? 0) < (data.pageTotal ?? 0),
            page: (data.pageNow ?? 0) + 1,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            screenStatus: MineScreenStatus.failure,
            errorMessage: failure,
          ),
        );
      },
    );
  }

  Future<void> retry() async {
    await getListMineAreas();
  }

  Future<void> refresh() async {
    await getListMineAreas();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore == true || state.hasMore == false) return;
    emit(state.copyWith(isLoadingMore: true));
    await getListMineAreas(page: state.page);
  }

  Future<void> searchMiningAreas(String query) async {
    emit(state.copyWith(searchKey: query));
    if (query.isEmpty || state.screenStatus == MineScreenStatus.loading) {
      return;
    }

    await getListMineAreas();
  }
}

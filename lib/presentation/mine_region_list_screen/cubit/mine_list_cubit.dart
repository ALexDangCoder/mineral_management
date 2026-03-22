import 'package:bnv_opendata/data/models/mine_region.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/repositories/fake_mine_module_repository.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mine_list_state.dart';

class MineListCubit extends Cubit<MineListState> {
  MineListCubit(
    this._mainMineRepository,
  ) : super(const MineListState());
  final MainMineRepository _mainMineRepository;

  Future<void> getListMineRegions({int? page = 1}) async {
    if (page == 1) {
      emit(state.copyWith(status: MineScreenStatus.loading));
    }
    final params = BasePageParam<ListMineRegionFilter>(
      pageSize: 10,
      pageNow: page,
      filter: ListMineRegionFilter(
        regionName: state.searchKey,
        status: 1,
      ),
    );
    final result = await _mainMineRepository.getListMineRegions(
      params.toJson(
        (filter) => filter.toJson(),
      ),
    );
    result.when(
      success: (data) {
        final List<MineRegionModel>? arrivalList = data.items;
        final List<MineRegionModel>? newList;
        if (data.pageNow == 1) {
          newList = arrivalList;
        } else {
          newList = [...?state.mineRegions, ...?arrivalList];
        }
        emit(
          state.copyWith(
            status: (newList?.isEmpty ?? false)
                ? MineScreenStatus.empty
                : MineScreenStatus.success,
            mineRegions: newList,
            hasMore: (data.pageNow ?? 0) < (data.pageTotal ?? 0),
            page: (data.pageNow ?? 0) + 1,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            status: MineScreenStatus.failure,
            errorMessage: failure,
          ),
        );
      },
    );
  }

  Future<void> init() => getListMineRegions();

  Future<void> searchMineRegions(String searchKey) async {
    emit(state.copyWith(searchKey: searchKey));
    if (searchKey.isEmpty) {
      return;
    }
    await getListMineRegions();
  }

  Future<void> refresh() async {
    await getListMineRegions();
  }

  Future<void> retry() async {
    await getListMineRegions();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore == true || state.hasMore == false) return;
    emit(state.copyWith(isLoadingMore: true));
    await Future.delayed(const Duration(milliseconds: 1200));
    await getListMineRegions(page: state.page);
  }
}

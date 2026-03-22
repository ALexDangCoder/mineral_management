import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:meta/meta.dart';

part 'region_list_state.dart';

class RegionListCubit extends BaseListCubit<MineRegionModel> {

  final MainMineRepository _repository;

  RegionListCubit(this._repository);

  @override
  Future<ResultPage<MineRegionModel>> fetchData({int? page, String? searchKey})
  async {
    final params = BasePageParam<ListMineRegionFilter>(
      pageSize: 8,
      pageNow: page,
      filter: ListMineRegionFilter(
        regionName: searchKey,
        status: 1,
      ),
    );

    final result = await _repository.getListMineRegions(
      params.toJson((filter) => filter.toJson()),
    );
    return result.when(
      success: (data) => ResultPage<MineRegionModel>(
        items: data.items,
        pageNow: data.pageNow,
        pageTotal: data.pageTotal,
      ),
      failure: (failure) => throw Exception(failure),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:meta/meta.dart';

part 'mine_area_list_state.dart';

class MineAreaListCubit extends BaseListCubit<MineAreaModel> {
  final MainMineRepository _repository;

  MineAreaListCubit(this._repository);

  @override
  Future<ResultPage<MineAreaModel>> fetchData(
      {int? page, String? searchKey}) async {
    final params = BasePageParam<ListAreaFilter>(
      pageSize: 10,
      pageNow: page,
      filter: ListAreaFilter(
        areaName: searchKey,
        status: 1,
      ),
    );

    final result = await _repository.getListMineAreas(
      params.toJson((filter) => filter.toJson()),
    );
    return result.when(
      success: (data) => ResultPage<MineAreaModel>(
        items: data.items,
        pageNow: data.pageNow,
        pageTotal: data.pageTotal,
      ),
      failure: (failure) => throw Exception(failure),
    );
  }
}

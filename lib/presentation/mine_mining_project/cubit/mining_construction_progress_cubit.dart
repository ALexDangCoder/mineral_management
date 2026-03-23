import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';

class MiningConstructionProgressCubit extends BaseListCubit<PlannedBoreholeModel> {
  final MainMineRepository _repository;
  final String projectId;

  MiningConstructionProgressCubit(this._repository, this.projectId);

  @override
  Future<ResultPage<PlannedBoreholeModel>> fetchData(
      {int? page, String? searchKey}) async {
    final params = BasePageParam<Map<String, dynamic>>(
      pageSize: 10,
      pageNow: page,
      filter: {
        "projectId": projectId,
        "boreholeName": searchKey,
      },
    );

    // Using the existing lo-khoan-du-kien (planned boreholes) endpoint as per spreadsheet
    final result = await _repository.getListPlannedBoreholes(
      params.toJson((filter) => filter),
    );

    return result.when(
      success: (data) => data,
      failure: (failure) => throw Exception(failure),
    );
  }
}

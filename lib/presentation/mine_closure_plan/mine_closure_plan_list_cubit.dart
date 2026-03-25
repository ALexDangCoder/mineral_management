import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';

class MineClosurePlanListCubit extends BaseListCubit<MineClosurePlanModel> {
  final MainMineRepository _repository;

  MineClosurePlanListCubit(this._repository);

  @override
  Future<ResultPage<MineClosurePlanModel>> fetchData(
      {int? page, String? searchKey}) async {
    final request = MineClosurePlanRequest(
      pageSize: 10,
      pageNow: page,
      filter: MineClosurePlanFilter(
        closurePlanName: searchKey,
        status: 1, // As per user request: "status": 1
      ),
    );

    final result = await _repository.filterMineClosurePlans(request);

    return result.when(
      success: (data) => data,
      failure: (failure) => throw Exception(failure),
    );
  }
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';


part 'construction_progress_state.dart';

class ConstructionProgressCubit extends BaseListCubit<PlannedBoreholeModel> {
  final MainMineRepository _repository;

  ConstructionProgressCubit(this._repository);

  @override
  Future<ResultPage<PlannedBoreholeModel>> fetchData(
      {int? page, String? searchKey}) async {
    final params = {
      'pageSize': 10,
      'pageNow': page,
      'filter': {
        'projectId': searchKey,
      },
    };

    final result = await _repository.getListPlannedBoreholes(params);
    return result.when(
      success: (data) => ResultPage<PlannedBoreholeModel>(
        items: data.items,
        pageNow: data.pageNow,
        pageTotal: data.pageTotal,
      ),
      failure: (failure) => throw Exception(failure),
    );
  }
}

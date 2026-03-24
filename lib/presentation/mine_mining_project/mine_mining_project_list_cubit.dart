import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';

class MineMiningProjectListCubit extends BaseListCubit<MiningProjectModel> {
  final MainMineRepository _repository;

  MineMiningProjectListCubit(this._repository);

  @override
  Future<ResultPage<MiningProjectModel>> fetchData(
      {int? page, String? searchKey}) async {
    final request = MiningProjectRequest(
      pageSize: 10,
      pageNow: page,
      filter: MiningProjectFilter(
        miningName: searchKey,
        status: 1, // Correct status as per user request
      ),
    );

    final result = await _repository.filterMiningProjects(request);

    return result.when(
      success: (data) => data,
      failure: (failure) => throw Exception(failure),
    );
  }
}

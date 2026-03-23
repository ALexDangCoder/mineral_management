import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';

class MineClosurePlanListCubit extends BaseListCubit<ProposalPlanModel> {
  final MainMineRepository _repository;

  MineClosurePlanListCubit(this._repository);

  @override
  Future<ResultPage<ProposalPlanModel>> fetchData(
      {int? page, String? searchKey}) async {
    final params = BasePageParam<ListProposalPlanFilter>(
      pageSize: 10,
      pageNow: page,
      filter: ListProposalPlanFilter(
        projectName: searchKey,
        status: 2, // Assuming status 2 is for Closure Plan as requested
      ),
    );

    final result = await _repository.getListProposalPlans(
      params.toJson((filter) => filter.toJson()),
    );

    return result.when(
      success: (data) => ResultPage<ProposalPlanModel>(
        items: data.items,
        pageNow: data.pageNow,
        pageTotal: data.pageTotal,
      ),
      failure: (failure) => throw Exception(failure),
    );
  }
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/cubit/base_list_cubit.dart';

class MiningPaymentProgressCubit extends BaseListCubit<dynamic> {
  final MainMineRepository _repository;
  final String projectId;

  MiningPaymentProgressCubit(this._repository, this.projectId);

  @override
  Future<ResultPage<dynamic>> fetchData(
      {int? page, String? searchKey}) async {
    final params = BasePageParam<Map<String, dynamic>>(
      pageSize: 10,
      pageNow: page,
      filter: {
        "projectId": projectId,
        "paymentName": searchKey,
      },
    );

    // Using the existing ke-hoach-thanh-toan endpoint as per spreadsheet
    final result = await _repository.getPaymentPlan(
      params.toJson((filter) => filter),
    );

    // Since getPaymentPlan returns dynamic, we wrap it into a ResultPage
    // If the API returns a ResultPage<dynamic> already, we can use it directly
    return result.when(
      success: (data) {
        if (data is Map<String, dynamic> && data.containsKey('items')) {
            return ResultPage<dynamic>.fromJson(data, (json) => json);
        }
        return ResultPage<dynamic>(items: data is List ? data : [], pageNow: 1, pageTotal: 1);
      },
      failure: (failure) => throw Exception(failure),
    );
  }
}

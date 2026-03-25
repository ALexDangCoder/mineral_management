import 'package:bnv_opendata/core/network/api_service.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';
import 'package:bnv_opendata/domain/models/json_object.dart';

abstract class MainMineRemoteDataSource {
  Future<BaseResponse<ResultPage<MineRegionModel>>> getListMineRegions(
    JSONObject param,
  );

  Future<BaseResponse<ResultPage<MineAreaModel>>> getListMineAreas(
    JSONObject param,
  );

  Future<BaseResponse<MineRegionModel>> getDetailMineRegion(JSONObject param);

  Future<BaseResponse<MineAreaModel>> getDetailMineArea(JSONObject param);

  Future<BaseResponse<ResultPage<GeologicalReportModel>>>
      getListGeologicalReports(
    JSONObject param,
  );

  Future<BaseResponse<ResultPage<ProposalPlanModel>>> getListProposalPlans(
    JSONObject param,
  );

  Future<BaseResponse<ResultPage<PlannedBoreholeModel>>>
      getListPlannedBoreholes(
    JSONObject param,
  );

  Future<BaseResponse<ResultPage<MiningProjectModel>>> filterMiningProjects(
    MiningProjectRequest request,
  );

  Future<BaseResponse<ResultPage<MineClosurePlanModel>>> filterMineClosurePlans(
    MineClosurePlanRequest request,
  );

  Future<BaseResponse<dynamic>> getPaymentPlan(JSONObject param);
}

class MainMineRemoteDataSourceImpl implements MainMineRemoteDataSource {
  final ApiService apiService;

  MainMineRemoteDataSourceImpl(this.apiService);

  @override
  Future<BaseResponse<MineAreaModel>> getDetailMineArea(JSONObject param) {
    return apiService.getDetailMineArea(param);
  }

  @override
  Future<BaseResponse<MineRegionModel>> getDetailMineRegion(JSONObject param) {
    return apiService.getDetailMineRegion(param);
  }

  @override
  Future<BaseResponse<ResultPage<MineAreaModel>>> getListMineAreas(
      JSONObject param) {
    return apiService.getListMineAreas(param);
  }

  @override
  Future<BaseResponse<ResultPage<MineRegionModel>>> getListMineRegions(
      JSONObject param) {
    return apiService.getListMineRegions(param);
  }

  @override
  Future<BaseResponse<ResultPage<GeologicalReportModel>>>
      getListGeologicalReports(JSONObject param) {
    return apiService.getListGeologicalReports(param);
  }

  @override
  Future<BaseResponse<ResultPage<ProposalPlanModel>>> getListProposalPlans(
      JSONObject param) {
    return apiService.getListProposalPlans(param);
  }

  @override
  Future<BaseResponse<ResultPage<PlannedBoreholeModel>>>
      getListPlannedBoreholes(JSONObject param) async {
    return apiService.getListPlannedBoreholes(param);
  }

  @override
  Future<BaseResponse<ResultPage<MiningProjectModel>>> filterMiningProjects(
      MiningProjectRequest request) {
    return apiService.filterMiningProjects(request);
  }

  @override
  Future<BaseResponse<ResultPage<MineClosurePlanModel>>> filterMineClosurePlans(
      MineClosurePlanRequest request) {
    return apiService.filterMineClosurePlans(request);
  }

  @override
  Future<BaseResponse<dynamic>> getPaymentPlan(JSONObject param) async {
    return apiService.getPaymentPlan(param);
  }
}

import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/models/json_object.dart';

abstract class MainMineRepository {
  Future<Result<ResultPage<MineRegionModel>>> getListMineRegions(JSONObject param);

  Future<Result<ListMineAreasResponse>> getListMineAreas(JSONObject param);

  Future<Result<MineRegionModel>> getDetailMineRegion(JSONObject param);

  Future<Result<MineAreaModel>> getDetailMineArea(JSONObject param);

  Future<Result<ListGeologicalReportsResponse>> getListGeologicalReports(
      JSONObject param);

  Future<Result<ListProposalPlanResponse>> getListProposalPlans(
      JSONObject param);
}

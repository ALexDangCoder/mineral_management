import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/main_mine_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/base_response_extension.dart';
import 'package:bnv_opendata/domain/models/json_object.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';

class MainMineRepositoryImpl implements MainMineRepository {
  final MainMineRemoteDataSource remoteDataSource;

  MainMineRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<MineAreaModel>> getDetailMineArea(JSONObject param) async {
    return remoteDataSource.getDetailMineArea(param).asResult();
  }

  @override
  Future<Result<MineRegionModel>> getDetailMineRegion(JSONObject param) async {
    return remoteDataSource.getDetailMineRegion(param).asResult();
  }

  @override
  Future<Result<ResultPage<MineAreaModel>>> getListMineAreas(
      JSONObject param) async {
    return remoteDataSource.getListMineAreas(param).asResult();
  }

  @override
  Future<Result<ResultPage<MineRegionModel>>> getListMineRegions(
      JSONObject param) async {
    return remoteDataSource.getListMineRegions(param).asResult();
  }

  @override
  Future<Result<ResultPage<GeologicalReportModel>>> getListGeologicalReports(
      JSONObject param) async {
    return remoteDataSource.getListGeologicalReports(param).asResult();
  }

  @override
  Future<Result<ResultPage<ProposalPlanModel>>> getListProposalPlans(
      JSONObject param) async {
    return remoteDataSource.getListProposalPlans(param).asResult();
  }

  @override
  Future<Result<ResultPage<PlannedBoreholeModel>>> getListPlannedBoreholes(
      JSONObject param) async {
    return remoteDataSource.getListPlannedBoreholes(param).asResult();
  }

  @override
  Future<Result<dynamic>> getPaymentPlan(JSONObject param) async {
    return remoteDataSource.getPaymentPlan(param).asResult();
  }
}

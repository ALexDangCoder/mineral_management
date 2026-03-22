import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/main_mine_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/models/json_object.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';

class MainMineRepositoryImpl implements MainMineRepository {
  final MainMineRemoteDataSource remoteDataSource;

  MainMineRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<MineAreaModel>> getDetailMineArea(JSONObject param) async {
    try {
      final response = await remoteDataSource.getDetailMineArea(param);
      if (response.code == 200 && response.data != null) {
        return Success(response.data!);
      } else {
        return Failure(response.message ?? '');
      }
    } catch (e) {
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<MineRegionModel>> getDetailMineRegion(JSONObject param) async {
    try {
      final response = await remoteDataSource.getDetailMineRegion(param);
      if (response.code == 200 && response.data != null) {
        return Success(response.data!);
      } else {
        return Failure(response.message ?? '');
      }
    } catch (e) {
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<ListMineAreasResponse>> getListMineAreas(
      JSONObject param) async {
    try {
      final response = await remoteDataSource.getListMineAreas(param);
      if (response.code == 200 && response.data != null) {
        return Success(response.data!);
      } else {
        return Failure(response.message ?? '');
      }
    } catch (e) {
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<ResultPage<MineRegionModel>>> getListMineRegions(
      JSONObject param) async {
    try {
      final response = await remoteDataSource.getListMineRegions(param);
      print('===== RESPONSE ${response}');
      if (response.code == 200 && response.data != null) {
        print('====== YYYYYYY');
        final resultPage = response.data as ResultPage<MineRegionModel>;
        return Success(resultPage);
      } else {
        return const Failure('Lỗi hệ thống khi tải');
      }
    } catch (e) {
      print('======= ERROR: ${e.toString()}');
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<ListGeologicalReportsResponse>> getListGeologicalReports(
      JSONObject param) async {
    try {
      final response = await remoteDataSource.getListGeologicalReports(param);
      if (response.code == 200 && response.data != null) {
        return Success(response.data!);
      } else {
        return Failure(response.message ?? '');
      }
    } catch (e) {
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<ListProposalPlanResponse>> getListProposalPlans(
      JSONObject param) async {
    try {
      final response = await remoteDataSource.getListProposalPlans(param);
      if (response.code == 200 && response.data != null) {
        return Success(response.data!);
      } else {
        return Failure(response.message ?? '');
      }
    } catch (e) {
      return const Failure('Lỗi hệ thống khi tải');
    }
  }
}

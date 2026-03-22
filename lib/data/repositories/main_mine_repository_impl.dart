import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/main_mine_remote_datasource.dart';
import 'package:bnv_opendata/data/models/response/list_mine_areas_response.dart';
import 'package:bnv_opendata/data/models/response/list_mine_regions_response.dart';
import 'package:bnv_opendata/data/models/response/mine_area_model.dart';
import 'package:bnv_opendata/data/models/response/mine_region_model.dart';
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
  Future<Result<ListMineRegionsResponse>> getListMineRegions(
      JSONObject param) async {
    try {
      final response = await remoteDataSource.getListMineRegions(param);
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

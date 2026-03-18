import 'package:bnv_opendata/core/network/api_service.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthResponse>> login(LoginRequest request);
  Future<dynamic> changePassword(String currentPass, String newPass);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequest request) {
    return apiService.login(request);
  }

  @override
  Future<dynamic> changePassword(String currentPass, String newPass) {
    return apiService.changePassword(currentPass+newPass);
  }
}

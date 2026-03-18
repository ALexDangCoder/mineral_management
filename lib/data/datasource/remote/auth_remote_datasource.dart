import 'package:bnv_opendata/core/network/api_service.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthResponse>> login(LoginRequest request);
  Future<void> logout(String token);
  Future<dynamic> changePassword(String currentPass, String newPass);
  Future<BaseResponse<dynamic>> sendCode(String email);
  Future<BaseResponse<dynamic>> verifyCode(String email, String code);
  Future<BaseResponse<UserInfoResponse>> getUserProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequest request) {
    return apiService.login(request);
  }

  @override
  Future<void> logout(String token) {
    return apiService.logout(token);
  }

  @override
  Future<dynamic> changePassword(String currentPass, String newPass) {
    return apiService.changePassword(currentPass+newPass); // Keeping current hardcode, we'll fix this later
  }

  @override
  Future<BaseResponse<dynamic>> sendCode(String email) {
    return apiService.sendCode(SendCodeRequest(email: email));
  }

  @override
  Future<BaseResponse<dynamic>> verifyCode(String email, String code) {
    return apiService.verifyCode(VerifyCodeRequest(email: email, code: code));
  }

  @override
  Future<BaseResponse<UserInfoResponse>> getUserProfile() {
    return apiService.getUserProfile();
  }
}

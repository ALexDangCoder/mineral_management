import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ================= AUTH =================
  @POST('/api/auth/public/auth/token')
  Future<BaseResponse<AuthResponse>> login(
    @Body() LoginRequest request,
  );

  @DELETE('/api/auth/public/auth/token')
  Future<dynamic> logout(
    @Query('token') String token,
  );

  @POST('/api/auth/public/auth/send-code')
  Future<BaseResponse<dynamic>> sendCode(
    @Body() SendCodeRequest request,
  );

  @POST('/api/auth/public/auth/verify-code')
  Future<BaseResponse<dynamic>> verifyCode(
    @Body() VerifyCodeRequest request,
  );

  @POST('/auth/change-password')
  Future<dynamic> changePassword(
    @Body() dynamic request,
  );

  @GET('/get-notifications')
  Future<dynamic> getNotification(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/api/auth/auth/user')
  Future<BaseResponse<UserInfoResponse>> getUserProfile();
}

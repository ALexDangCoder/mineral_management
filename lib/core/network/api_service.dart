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

  @POST('/auth/change-password')
  Future<dynamic> changePassword(
    @Body() dynamic request,
  );

  @GET('/get-notifications')
  Future<dynamic> getNotification(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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

  @POST('/api/auth/public/auth/captcha')
  Future<dynamic> getCaptcha();

  @GET('/get-notifications')
  Future<dynamic> getNotification(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/api/auth/auth/user')
  Future<BaseResponse<UserInfoResponse>> getUserProfile();

  @POST('/api/sys/vung-mo/filter')
  Future<BaseResponse<ResultPage<MineRegionModel>>> getListMineRegions(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/sys/khu-mo/filter')
  Future<BaseResponse<ResultPage<MineAreaModel>>> getListMineAreas(
    @Body() Map<String, dynamic> body,
  );

  @GET('/api/sys/vung-mo/get-by-id')
  Future<BaseResponse<MineRegionModel>> getDetailMineRegion(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/api/sys/khu-mo/get-by-id')
  Future<BaseResponse<MineAreaModel>> getDetailMineArea(
    @Queries() Map<String, dynamic> queries,
  );

  @POST('/api/geological/bao-cao-dia-chat-master/filter')
  Future<BaseResponse<ResultPage<GeologicalReportModel>>>
      getListGeologicalReports(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/exploration/de-an-phuong-an/filter')
  Future<BaseResponse<ResultPage<ProposalPlanModel>>> getListProposalPlans(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/exploration/lo-khoan-du-kien/filter')
  Future<BaseResponse<ResultPage<PlannedBoreholeModel>>>
      getListPlannedBoreholes(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/exploration/ke-hoach-thanh-toan/filter')
  Future<BaseResponse<dynamic>> getPaymentPlan(
    @Body() Map<String, dynamic> body,
  );
  @POST('/api/notification/he-thong-canh-bao/filter')
  Future<NotificationResponse<ResultPage<SystemAlert>>> filterSystemAlerts(
    @Body() SystemAlertFilterRequest request,
  );

  @POST('/api/mining-project/du-an-khai-thac/filter')
  Future<BaseResponse<ResultPage<MiningProjectModel>>> filterMiningProjects(
    @Body() MiningProjectRequest request,
  );

  @POST('/api/mine-closure/de-an-dong-cua-mo/filter')
  Future<BaseResponse<ResultPage<MineClosurePlanModel>>> filterMineClosurePlans(
    @Body() MineClosurePlanRequest request,
  );

  @GET('/api/mine-closure/de-an-dong-cua-mo/get-by-id')
  Future<BaseResponse<MineClosurePlanModel>> getMineClosurePlanDetail(
    @Queries() Map<String, dynamic> queries,
  );
}

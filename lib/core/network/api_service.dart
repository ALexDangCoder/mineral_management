import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ================= AUTH =================
  @POST('/auth/login')
  Future<dynamic> login(
    @Body() dynamic request,
  );

  @POST('/auth/change-password')
  Future<dynamic> changePassword(
    @Body() dynamic request,
  );
}

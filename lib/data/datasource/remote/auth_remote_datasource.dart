import 'package:bnv_opendata/core/network/api_service.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> login(
    dynamic request,
  );
  Future<dynamic> changePassword(String currentPass, String newPass);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<dynamic> login(
    dynamic request,
  ) {
    return apiService.login(request);
  }

  @override
  Future<dynamic> changePassword(String currentPass, String newPass) {
    return apiService.changePassword(currentPass+newPass);
  }
}

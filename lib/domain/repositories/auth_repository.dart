import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/entities/auth_status_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthEntity>> login(String username, String password);

  Future<void> logout();

  Future<Result<dynamic>> changePassword(String currentPass, String newPass);

  Future<AuthStatusEntity> getAuthStatus();

  Future<String?> getCachedUsername();

  Future<Map<String, dynamic>?> getSavedUserInfo();

  Future<Result<dynamic>> sendCode(String email);

  Future<Result<dynamic>> verifyCode(String email, String code);

  Future<Result<UserInfoResponse>> getUserProfile();
}

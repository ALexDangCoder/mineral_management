import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> login(String username, String password);

  Future<void> logout();

  Future<Result<dynamic>> changePassword(String currentPass, String newPass);

  Future<bool> isLoggedIn();

  Future<Map<String, dynamic>?> getSavedUserInfo();
}

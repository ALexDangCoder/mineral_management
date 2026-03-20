import 'package:bnv_opendata/domain/entities/auth_entity.dart';

abstract class AppLocalStorageRepository {
  Future<void> saveSession(AuthEntity authEntity);

  Future<void> saveUsername(String username);

  Future<String?> getUsername();

  Future<AuthEntity?> getSession();

  Future<void> removeSession();

  Future<void> saveUserInfo(Map<String, dynamic> user);

  Future<Map<String, dynamic>?> getUserInfo();

  Future<void> removeUserInfo();

  Future<void> clearAll();
}

abstract class AppLocalStorageRepository {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> removeToken();

  Future<void> saveUserInfo(Map<String, dynamic> user);

  Future<Map<String, dynamic>?> getUserInfo();

  Future<void> removeUserInfo();

  Future<void> clearAll();
}

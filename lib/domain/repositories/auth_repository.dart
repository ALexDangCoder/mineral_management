abstract class AuthRepository {
  Future<void> login(String username, String password);

  Future<void> logout();

  Future<void> changePassword(String currentPass, String newPass);

  Future<String?> getSavedAccessToken();
}

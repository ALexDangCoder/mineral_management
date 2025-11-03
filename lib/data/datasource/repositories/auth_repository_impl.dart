import 'dart:developer';

import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:bnv_opendata/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppLocalStorageRepository localStorage;

  AuthRepositoryImpl(this.localStorage);

  @override
  Future<void> login(String username, String password) async {
    // 🔹 Gửi request đến API thật
    // final response = await http.post(...)
    log('Send API Login with Username: $username & password');
    const token = 'abc123_token_fake';

    await localStorage.saveToken(token);

    // 🔹 Trả về User entity
    // return User(username: username, token: token);
  }

  @override
  Future<void> changePassword(String currentPass, String newPass) async {

  }

  @override
  Future<void> logout() async {
    await localStorage.removeUserInfo();
    await localStorage.removeToken();
  }

  @override
  Future<String?> getSavedAccessToken() async {
    return localStorage.getToken();
  }
}

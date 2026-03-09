import 'dart:developer';

import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/auth_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:bnv_opendata/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppLocalStorageRepository localStorage;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.localStorage,
    this.remoteDataSource,
  );

  @override
  Future<Result<UserModel>> login(String username, String password) async {
    final user = UserModel(
      username: username,
      fullName: 'Nguyen Van A',
      phone: '0961125389',
      position: 'Kỹ thuật hiện trường',
    );
    try {
      //TODO
      // final response = await remoteDataSource.login(username + password);
      log('Send API Login with Username: $username & password');
      const token = 'abc123_token_fake';
      await localStorage.saveToken(token);
      await localStorage.saveUserInfo(
        user.toJson(),
      );
      return Success(user);
    } on Exception catch (e) {
      // TODO
      return const Failure('');
    }

    // 🔹 Trả về User entity
    // return User(username: username, token: token);
  }

  @override
  Future<Result<dynamic>> changePassword(
    String currentPass,
    String newPass,
  ) async {
    try {
      final response =
          await remoteDataSource.changePassword(currentPass, newPass);
      return const Success('');
    } on Exception catch (e) {
      // TODO
      return const Failure('');
    }
  }

  @override
  Future<void> logout() async {
    await localStorage.removeUserInfo();
    await localStorage.removeToken();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await localStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<Map<String, dynamic>?> getSavedUserInfo() async {
    return localStorage.getUserInfo();
  }
}

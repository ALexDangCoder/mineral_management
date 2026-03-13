import 'dart:convert';

import 'package:bnv_opendata/data/datasource/local/secure_storage_service.dart';
import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:bnv_opendata/utils/constants/app_constants.dart';

class AppLocalStorageRepositoryImpl implements AppLocalStorageRepository {
  final SecureStorageService dataSource;

  AppLocalStorageRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveToken(String token) async {
    await dataSource.write(StorageKeys.accessToken, token);
  }

  @override
  Future<String?> getToken() async {
    return dataSource.read(StorageKeys.accessToken);
  }

  @override
  Future<void> removeToken() async {
    await dataSource.delete(StorageKeys.accessToken);
  }

  @override
  Future<void> saveUserInfo(Map<String, dynamic> user) async {
    await dataSource.write(StorageKeys.userInfo, jsonEncode(user));
  }

  @override
  Future<Map<String, dynamic>?> getUserInfo() async {
    final jsonString = await dataSource.read(StorageKeys.userInfo);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  @override
  Future<void> removeUserInfo() async {
    await dataSource.delete(StorageKeys.userInfo);
  }

  @override
  Future<void> clearAll() async {
    await dataSource.deleteAll();
  }
}

import 'dart:convert';

import 'package:bnv_opendata/data/datasource/local/secure_storage_service.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:bnv_opendata/utils/constants/app_constants.dart';

class AppLocalStorageRepositoryImpl implements AppLocalStorageRepository {
  final SecureStorageService dataSource;

  AppLocalStorageRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveSession(AuthEntity authEntity) async {
    await dataSource.write(
      key: StorageKeys.authSession,
      value: authEntity.toRawJson(),
    );
  }

  @override
  Future<void> saveUsername(String username) async {
    await dataSource.write(
      key: StorageKeys.username,
      value: username,
    );
  }

  @override
  Future<String?> getUsername() async {
    return dataSource.read(StorageKeys.username);
  }

  @override
  Future<AuthEntity?> getSession() async {
    final raw = await dataSource.read(StorageKeys.authSession);
    if (raw == null) return null;
    try {
      return AuthEntity.fromRawJson(raw);
    } catch (_) {
      return null; // tránh crash khi data corrupt
    }
  }

  @override
  Future<void> removeSession() async {
    await dataSource.delete(StorageKeys.authSession);
  }

  @override
  Future<void> saveUserInfo(Map<String, dynamic> user) async {
    await dataSource.write(key: StorageKeys.userInfo, value: jsonEncode(user));
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

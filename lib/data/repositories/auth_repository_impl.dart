import 'dart:developer';

import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/auth_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/entities/auth_status_entity.dart';
import 'package:bnv_opendata/domain/repositories/app_local_storate_repository.dart';
import 'package:bnv_opendata/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppLocalStorageRepository localStorage;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.localStorage,
    this.remoteDataSource,
  );

  @override
  Future<Result<AuthEntity>> login(String username, String password) async {
    try {
      log('Send API Login with Username: $username');
      final request = LoginRequest(username: username, password: password);
      final response = await remoteDataSource.login(request);

      if (response.code == 0 && response.data != null) {
        final authResponse = response.data;
        final now = DateTime.now();
        final authEntity = AuthEntity(
          accessToken: authResponse?.accessToken ?? '',
          refreshToken: authResponse?.refreshToken ?? '',
          accessExpireAt: now.add(
            Duration(seconds: authResponse?.accessExpireIn ?? 0),
          ),
          refreshExpireAt: now.add(
            Duration(seconds: authResponse?.refreshExpireIn ?? 0),
          ),
          isFirstLogin: (authResponse?.isFirstLogin ?? 0) == 1,
        );
        // final token = response.data!.accessToken ?? '';
        await localStorage.saveSession(authEntity);
        await localStorage.saveUsername(username);

        // await localStorage.saveUserInfo(user.toJson());
        return Success(authEntity);
      } else {
        return Failure(response.message ?? 'Đăng nhập thất bại');
      }
    } on DioException catch (e) {
      log('Login DioException: $e');
      // Đọc message từ body response của API khi API trả về lỗi HTTP!=200
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return Failure(data['message'].toString());
      }
      return const Failure('Lỗi kết nối, vui lòng thử lại');
    } on Exception catch (e) {
      log('Login Exception: $e');
      return const Failure('Lỗi hệ thống khi đăng nhập');
    }
  }

  @override
  Future<Result<dynamic>> changePassword(
    String currentPass,
    String newPass,
  ) async {
    try {
      await remoteDataSource.changePassword(currentPass, newPass);
      return const Success('');
    } on Exception catch (_) {
      // TODO
      return const Failure('');
    }
  }

  @override
  Future<void> logout() async {
    try {
      final authEntity = await localStorage.getSession();
      if (authEntity != null && authEntity.accessToken.isNotEmpty) {
        await remoteDataSource.logout(authEntity.accessToken);
      }
    } catch (e) {
      log('Logout API error (ignored): $e');
    } finally {
      await localStorage.removeUserInfo();
      await localStorage.removeSession();
    }
  }

  @override
  Future<AuthStatusEntity> getAuthStatus() async {
    final session = await localStorage.getSession();
    if (session == null) {
      return AuthStatusEntity(authStatus: AuthStatusEnum.unauthenticated);
    }

    if (_isAccessTokenValid(session)) {
      return AuthStatusEntity(
        authStatus: AuthStatusEnum.authenticated,
        authEntity: session,
      );
    } else {
      return AuthStatusEntity(authStatus: AuthStatusEnum.sessionExpired);
    }
  }

  bool _isAccessTokenValid(AuthEntity s) {
    return DateTime.now().isBefore(s.accessExpireAt);
  }

  @override
  Future<String?> getCachedUsername() async {
    return localStorage.getUsername();
  }

  @override
  Future<Map<String, dynamic>?> getSavedUserInfo() async {
    return localStorage.getUserInfo();
  }

  @override
  Future<Result<dynamic>> sendCode(String email) async {
    try {
      final response = await remoteDataSource.sendCode(email);
      if (response.code == 0) {
        return const Success('Gửi OTP thành công');
      }
      return Failure(response.message ?? 'Gửi OTP thất bại');
    } on DioException catch (e) {
      log('sendCode DioException: $e');
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return Failure(data['message'].toString());
      }
      return const Failure('Lỗi kết nối, vui lòng thử lại');
    } catch (e) {
      log('sendCode Exception: $e');
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<dynamic>> verifyCode(String email, String code) async {
    try {
      final response = await remoteDataSource.verifyCode(email, code);
      if (response.code == 0) {
        return const Success('Xác nhận OTP thành công');
      }
      return Failure(response.message ?? 'Mã OTP không đúng');
    } on DioException catch (e) {
      log('verifyCode DioException: $e');
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return Failure(data['message'].toString());
      }
      return const Failure('Lỗi kết nối, vui lòng thử lại');
    } catch (e) {
      log('verifyCode Exception: $e');
      return const Failure('Lỗi hệ thống khi tải');
    }
  }

  @override
  Future<Result<UserInfoResponse>> getUserProfile() async {
    try {
      final response = await remoteDataSource.getUserProfile();
      if (response.code == 0 || response.code == 200 || response.data != null) {
        return Success(response.data!);
      }
      return Failure(response.message ?? 'Lỗi tải dữ liệu người dùng');
    } on DioException catch (e) {
      log('getUserProfile DioException: $e');
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return Failure(data['message'].toString());
      }
      return const Failure('Lỗi kết nối, vui lòng thử lại');
    } catch (e) {
      log('getUserProfile Exception: $e');
      return const Failure('Lỗi hệ thống khi tải');
    }
  }
}

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
        return Result.success(authEntity);
      } else {
        return Result.failure(
          ApiError(
            message: response.message ?? 'Unknown error',
            code: response.code,
            data: response.data,
            type: ApiErrorType.server,
          ),
        );
      }
    } on DioException catch (e) {
      log('Login DioException: $e');
      if (e.error is ApiError) {
        return Result.failure(e.error! as ApiError);
      }
      return Result.failure(
        ApiError(
          message: e.message ?? 'Unknown Dio error',
        ),
      );
    } on Exception catch (e) {
      return Result.failure(
        ApiError(
          message: e.toString(),
        ),
      );
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
    } on Exception catch (e) {
      return Result.failure(
        ApiError(
          message: e.toString(),
        ),
      );
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
        return Result.success('Gửi OTP thành công');
      }
      return Result.failure(
        ApiError(
          message: response.message ?? 'Gửi OTP thất bại',
        ),
      );
    } on DioException catch (e) {
      if (e.error is ApiError) {
        return Result.failure(e.error! as ApiError);
      }
      return Result.failure(
        ApiError(
          message: e.message ?? 'Unknown Dio error',
        ),
      );
    } catch (e) {
      return Result.failure(
        ApiError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<dynamic>> verifyCode(String email, String code) async {
    try {
      final response = await remoteDataSource.verifyCode(email, code);
      if (response.code == 0) {
        return Result.success('Xác nhận OTP thành công');
      }
      return Result.failure(
        ApiError(
          message: response.message ?? 'Mã OTP không đúng',
        ),
      );
    } catch (e) {
      return Result.failure(
        ApiError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<UserInfoResponse>> getUserProfile() async {
    try {
      final response = await remoteDataSource.getUserProfile();
      if (response.code == 0 || response.code == 200 || response.data != null) {
        return Result.success(response.data!);
      }
      return Result.failure(
        ApiError(
            message: response.message ??
                'Lỗi tải dữ liệu '
                    'người dùng'),
      );
    } catch (e) {
      log('getUserProfile Exception: $e');
      return Result.failure(
        ApiError(
          message: e.toString(),
        ),
      );
    }
  }
}

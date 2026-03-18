import 'dart:developer';

import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/datasource/remote/auth_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
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
  Future<Result<UserModel>> login(String username, String password) async {
    try {
      log('Send API Login with Username: $username');
      final request = LoginRequest(username: username, password: password);
      final response = await remoteDataSource.login(request);
      
      if (response.code == 0 && response.data != null) {
        final token = response.data!.accessToken ?? '';
        await localStorage.saveToken(token);
        
        final user = UserModel(
          username: username,
          fullName: 'Đăng nhập thành công',
        );
        await localStorage.saveUserInfo(user.toJson());
        return Success(user);
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
      final token = await localStorage.getToken();
      if (token != null && token.isNotEmpty) {
        await remoteDataSource.logout(token);
      }
    } catch (e) {
      log('Logout API error (ignored): $e');
    } finally {
      await localStorage.removeUserInfo();
      await localStorage.removeToken();
    }
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

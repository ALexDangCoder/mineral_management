import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/utils/hash_util.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<AuthEntity>> call(
    String email,
    String password,
  ) {
    final String hashedPassword = HashUtil.hashString(password);
    return repository.login(email, hashedPassword);
  }
}

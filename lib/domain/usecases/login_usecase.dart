import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<AuthEntity>> call(
      String email,
      String password,
      ) {
    return repository.login(email, password);
  }
}
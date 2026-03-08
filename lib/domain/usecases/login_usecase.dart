import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<UserModel>> call(
      String email,
      String password,
      ) {
    return repository.login(email, password);
  }
}
import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Result<dynamic>> call(String currentPass, String newPass) {
    return repository.changePassword(currentPass, newPass);
  }
}
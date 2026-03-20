import 'package:bnv_opendata/domain/entities/auth_status_entity.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';

class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<AuthStatusEntity> call() {
    return repository.getAuthStatus();
  }
}
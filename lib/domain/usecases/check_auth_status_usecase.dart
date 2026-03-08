import 'package:bnv_opendata/domain/repositories/repository_exports.dart';

class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<bool> call() {
    return repository.isLoggedIn();
  }
}
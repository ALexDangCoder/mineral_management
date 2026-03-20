import 'package:bnv_opendata/core/enums/auth_status_enum.dart';
import 'package:bnv_opendata/domain/entities/auth_entity.dart';

class AuthStatusEntity {
  final AuthStatusEnum authStatus;
  final AuthEntity? authEntity;

  AuthStatusEntity({
    required this.authStatus,
    this.authEntity,
  });
}

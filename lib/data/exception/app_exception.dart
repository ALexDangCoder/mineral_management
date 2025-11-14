// import 'package:bnv_opendata/resources/generated/l10n.dart';

import 'package:bnv_opendata/resources/generated/l10n.dart';

class AppException implements Exception {
  String title;
  String message;

  AppException(this.title, this.message);

  @override
  String toString() => '$title $message';
}

class CommonException extends AppException {
  CommonException() : super(S.current.error, S.current.something_went_wrong);
}

class NoNetworkException extends AppException {
  NoNetworkException() : super(S.current.error, S.current.error_network);
}

class ExpiredException extends AppException {
  ExpiredException() : super(S.current.error, S.current.error_network);
}

class UnauthorizedException extends AppException {
  UnauthorizedException() : super(S.current.error, S.current.error_network);
}

class MaintenanceException extends AppException {
  MaintenanceException() : super(S.current.error, S.current.error_network);
}

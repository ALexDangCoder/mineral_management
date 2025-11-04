import 'package:bnv_opendata/data/exception/app_exception.dart';
import 'package:bnv_opendata/data/network/network_checker.dart';
import 'package:bnv_opendata/data/network/network_handler.dart';
import 'package:bnv_opendata/domain/locals/logger.dart';
import 'package:bnv_opendata/resources/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;

  const factory Result.error(AppException exception) = Error<T>;
}

Result<T> runCatching<T>(T Function() block) {
  try {
    return Result.success(block());
  } catch (e) {
    return Result.error(
      AppException(
        S.current.error,
        S.current.something_went_wrong,
      ),
    );
  }
}

Future<Result<E>> runCatchingAsync<T, E>(
  Future<T> Function() block,
  E Function(T) map,
) async {
  final connected = await CheckerNetwork.checkNetwork();
  if (!connected) {
    return Result.error(NoNetworkException());
  }
  try {
    final response = await block();
    return Result.success(map(response));
  } catch (e) {
    logger.e(e);
    if (e is DioExceptionType) {
      return Result.error(NetworkHandler.handleError(e));
    } else {
      return Result.error(
        AppException(
          S.current.error,
          S.current.something_went_wrong,
        ),
      );
    }
  }
}

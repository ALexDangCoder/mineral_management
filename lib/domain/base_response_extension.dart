// data/utils/result_extensions.dart
import 'package:bnv_opendata/core/result/result.dart';
import 'package:bnv_opendata/data/models/response/base_response.dart';
import 'package:dio/dio.dart';

extension BaseResponseX<T> on Future<BaseResponse<T>> {
  Future<Result<T>> asResult() async {
    try {
      final response = await this;
      if (response.code == 200 && response.data != null) {
        return Result.success(response.data!);
      }
      return Result.failure(ApiError(
        message: response.message ?? 'Unknown error',
        code: response.code,
        data: response.data,
        type: ApiErrorType.server,
      ));
    } on DioException catch (e) {
      if (e.error is ApiError) {
        return Result.failure(e.error! as ApiError);
      }
      return Result.failure(ApiError(message: e.message ?? 'Unknown Dio error'));
    } catch (e) {
      return Result.failure(ApiError(message: e.toString()));
    }
  }
}

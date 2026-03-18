import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    String? timestamp,
    String? service,
    String? sessionId,
    String? requestId,
    int? code,
    String? message,
    T? data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

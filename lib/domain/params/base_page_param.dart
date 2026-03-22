import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_page_param.freezed.dart';

part 'base_page_param.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class BasePageParam<T> with _$BasePageParam<T> {
  const factory BasePageParam({
    int? pageSize,
    int? pageNow,
    T? filter,
  }) = _BasePageParam<T>;

  factory BasePageParam.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BasePageParamFromJson(json, fromJsonT);
}

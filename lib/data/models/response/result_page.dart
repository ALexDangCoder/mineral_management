import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_page.freezed.dart';
part 'result_page.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ResultPage<T> with _$ResultPage<T> {
  const factory ResultPage({
    List<T>? items,
    int? pageNow,
    int? pageTotal,
    int? pageSize,
  }) = _ResultPage<T>;

  factory ResultPage.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ResultPageFromJson(json, fromJsonT);
}
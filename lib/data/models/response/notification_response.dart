import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class NotificationResponse<T> with _$NotificationResponse<T> {
  const factory NotificationResponse({
    bool? status,
    String? traceID,
    int? code,
    String? userMessage,
    T? data,
  }) = _NotificationResponse<T>;

  factory NotificationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NotificationResponseFromJson(json, fromJsonT);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_alert_filter_request.freezed.dart';
part 'system_alert_filter_request.g.dart';

@freezed
sealed class SystemAlertFilterRequest with _$SystemAlertFilterRequest {
  const factory SystemAlertFilterRequest({
    int? pageSize,
    int? pageNow,
    Map<String, dynamic>? filter,
    String? exportType,
  }) = _SystemAlertFilterRequest;

  factory SystemAlertFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$SystemAlertFilterRequestFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_alert.freezed.dart';
part 'system_alert.g.dart';

@freezed
sealed class SystemAlert with _$SystemAlert {
  const factory SystemAlert({
    int? id,
    String? alertId,
    String? alertType,
    String? alertTitle,
    String? alertContent,
    String? objectId,
    String? objectType,
    String? createdTimeAt,
    String? expiryDate,
    int? status,
    String? severity,
    String? recipients,
    String? sendMethod,
    int? sentFlag,
  }) = _SystemAlert;

  factory SystemAlert.fromJson(Map<String, dynamic> json) =>
      _$SystemAlertFromJson(json);
}

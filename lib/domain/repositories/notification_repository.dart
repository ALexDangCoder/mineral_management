import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/request/system_alert_filter_request.dart';
import 'package:bnv_opendata/data/models/response/notification_response.dart';
import 'package:bnv_opendata/data/models/response/system_alert.dart';

abstract class NotificationRepository {
  Future<NotificationResponse<ResultPage<SystemAlert>>> filterSystemAlerts(
      SystemAlertFilterRequest request);

  Future<void> markRead(String id, {bool read = true});
  Future<void> markManyRead(Iterable<String> ids, {bool read = true});
}

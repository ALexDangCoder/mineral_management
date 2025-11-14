import 'package:bnv_opendata/data/model/notification_model.dart';

abstract class NotificationRepository {
  Future<List<AppNotification>> fetchAll();
  Future<void> markRead(String id, {bool read = true});
  Future<void> markManyRead(Iterable<String> ids, {bool read = true});
}

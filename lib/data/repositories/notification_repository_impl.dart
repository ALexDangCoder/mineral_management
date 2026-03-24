import 'package:bnv_opendata/data/datasource/remote/notification_remote_datasource.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/request/system_alert_filter_request.dart';
import 'package:bnv_opendata/data/models/response/notification_response.dart';
import 'package:bnv_opendata/data/models/response/system_alert.dart';
import 'package:bnv_opendata/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<NotificationResponse<ResultPage<SystemAlert>>> filterSystemAlerts(
      SystemAlertFilterRequest request) {
    return remoteDataSource.filterSystemAlerts(request);
  }

  @override
  Future<void> markRead(String id, {bool read = true}) async {
    // Current API doesn't seem to have markRead for system alerts yet,
    // or it might be a different endpoint. Keeping it as a placeholder.
  }

  @override
  Future<void> markManyRead(Iterable<String> ids, {bool read = true}) async {
    // Placeholder
  }
}

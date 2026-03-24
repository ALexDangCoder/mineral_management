import 'package:bnv_opendata/core/network/api_service.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/data/models/request/system_alert_filter_request.dart';
import 'package:bnv_opendata/data/models/response/notification_response.dart';
import 'package:bnv_opendata/data/models/response/system_alert.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationResponse<ResultPage<SystemAlert>>> filterSystemAlerts(
      SystemAlertFilterRequest request);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future<NotificationResponse<ResultPage<SystemAlert>>> filterSystemAlerts(
      SystemAlertFilterRequest request) {
    return apiService.filterSystemAlerts(request);
  }
}

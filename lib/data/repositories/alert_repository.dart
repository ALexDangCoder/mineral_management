
import 'package:bnv_opendata/data/model/alert_group.dart';

abstract class AlertRepository {
  Future<List<AlertGroup>> fetchAlertGroups();
}


import 'package:bnv_opendata/data/model/alert_medel.dart';

abstract class AlertRepository {
  Future<List<AlertGroup>> fetchAlertGroups();
}

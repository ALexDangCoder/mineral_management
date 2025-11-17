import 'package:bnv_opendata/data/model/alert_medel.dart';
import 'package:bnv_opendata/data/repositories/alert_repository.dart';

class AlertRepositoryImpl implements AlertRepository {
  @override
  Future<List<AlertGroup>> fetchAlertGroups() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      AlertGroup(
        type: AlertModel.licenseExpired,
        title: 'Cảnh báo hết hạn giấy phép',
        subtitle: 'Có 2 giấy phép sắp hết hạn.',
        count: 2,
      ),
      AlertGroup(
        type: AlertModel.mineClosurePlan,
        title: 'Cảnh báo Đề án đóng cửa mỏ',
        subtitle: 'Có 1 đề án sắp hết hiệu lực.',
        count: 1,
      ),
    ];
  }
}

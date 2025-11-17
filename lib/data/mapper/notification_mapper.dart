import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';

Map<String, dynamic> notificationToMap(AppNotification n) => {
  'id': n.id,
  'title': n.title,
  'content': n.content,
  'createdAt': n.createdAt.toIso8601String(),
  'category': n.category.name,
  'isRead': n.isRead,
};

AppNotification notificationFromMap(Map<String, dynamic> m) {
  return AppNotification(
    id: m['id'] as String,
    title: (m['title'] as String?) ?? '',
    content: (m['content'] as String?) ?? '',
    createdAt: DateTime.tryParse((m['createdAt'] as String?) ?? '') ?? DateTime.now(),
    category: _catFromName(m['category'] as String?),
    isRead: (m['isRead'] as bool?) ?? false,
  );
}

NotificationCategoryEnum _catFromName(String? n) {
  switch ((n ?? '').toLowerCase()) {
    case 'activity': return NotificationCategoryEnum.activity;
    case 'legal':    return NotificationCategoryEnum.legal;
    case 'finance':  return NotificationCategoryEnum.finance;
    case 'system':   return NotificationCategoryEnum.system;
    case 'all':
    default:         return NotificationCategoryEnum.all;
  }
}

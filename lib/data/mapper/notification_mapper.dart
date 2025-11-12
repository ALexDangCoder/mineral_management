import 'package:bnv_opendata/data/model/notification_model.dart';

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

NotificationCategory _catFromName(String? n) {
  switch ((n ?? '').toLowerCase()) {
    case 'activity': return NotificationCategory.activity;
    case 'legal':    return NotificationCategory.legal;
    case 'finance':  return NotificationCategory.finance;
    case 'system':   return NotificationCategory.system;
    case 'all':
    default:         return NotificationCategory.all;
  }
}

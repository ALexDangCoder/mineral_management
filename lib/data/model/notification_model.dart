import 'package:bnv_opendata/utils/constants/enums.dart';

class AppNotification {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final NotificationCategoryEnum category;
  final bool isRead;

  AppNotification({
    required this.id,
    required this.category,
    required this.title,
    required this.content,
    required this.createdAt,
    this.isRead = false,
  });

  AppNotification coppyWith({bool? isRead}) => AppNotification(
    id: id,
    category: category,
    title: title,
    content: content,
    createdAt: createdAt,
    isRead: isRead ?? this.isRead,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
    'category': category.asName,
    'isRead': isRead,
  };

  factory AppNotification.fromMap(Map<String, dynamic> m) => AppNotification(
    id: m['id'] as String,
    title: (m['title'] as String?) ?? '',
    content: (m['content'] as String?) ?? '',
    createdAt: DateTime.tryParse((m['createdAt'] as String?) ?? '') ?? DateTime.now(),
    category: notificationCategoryEnumFromName(m['category'] as String?),
    isRead: (m['isRead'] as bool?) ?? false,
  );
}

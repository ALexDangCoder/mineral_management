enum NotificationCategory { all, activity, legal, finance, system }

class AppNotification {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final NotificationCategory category;
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
      isRead: isRead ?? this.isRead);
}

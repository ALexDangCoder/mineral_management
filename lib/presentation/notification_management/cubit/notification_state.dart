import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';

class NotificationState {
  final bool loading;
  final List<AppNotification> items;
  final NotificationCategoryEnum selected;
  final NotificationStatusFilterEnum statusFilter;
  final NotificationSortEnum sort;

  const NotificationState({
    this.loading = false,
    this.items = const [],
    this.selected = NotificationCategoryEnum.all,
    this.statusFilter = NotificationStatusFilterEnum.all,
    this.sort = NotificationSortEnum.none,
  });

  NotificationState copyWith({
    bool? loading,
    List<AppNotification>? items,
    NotificationCategoryEnum? selected,
    NotificationStatusFilterEnum? statusFilter,
    NotificationSortEnum? sort,
  }) {
    return NotificationState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
      selected: selected ?? this.selected,
      statusFilter: statusFilter ?? this.statusFilter,
      sort: sort ?? this.sort,
    );
  }

  List<AppNotification> get _byCategory =>
      selected == NotificationCategoryEnum.all
          ? items
          : items.where((e) => e.category == selected).toList();

  List<AppNotification> get _byStatus {
    switch (statusFilter) {
      case NotificationStatusFilterEnum.read:
        return _byCategory.where((e) => e.isRead).toList();
      case NotificationStatusFilterEnum.unread:
        return _byCategory.where((e) => !e.isRead).toList();
      case NotificationStatusFilterEnum.all:
      return _byCategory;
    }
  }

  List<AppNotification> get rendered {
    final list = [..._byStatus];
    switch (sort) {
      case NotificationSortEnum.titleAZ:
        list.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case NotificationSortEnum.titleZA:
        list.sort(
            (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      case NotificationSortEnum.none:
        break;
    }
    return list;
  }
}

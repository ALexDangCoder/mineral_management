import 'package:bnv_opendata/data/models/response/system_alert.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';

class NotificationState {
  final bool loading;
  final List<SystemAlert> items;
  final NotificationCategoryEnum selected;
  final NotificationStatusFilterEnum statusFilter;
  final NotificationSortEnum sort;
  final int pageNow;
  final int pageTotal;
  final bool hasMore;

  const NotificationState({
    this.loading = false,
    this.items = const [],
    this.selected = NotificationCategoryEnum.all,
    this.statusFilter = NotificationStatusFilterEnum.all,
    this.sort = NotificationSortEnum.none,
    this.pageNow = 1,
    this.pageTotal = 1,
    this.hasMore = false,
  });

  NotificationState copyWith({
    bool? loading,
    List<SystemAlert>? items,
    NotificationCategoryEnum? selected,
    NotificationStatusFilterEnum? statusFilter,
    NotificationSortEnum? sort,
    int? pageNow,
    int? pageTotal,
    bool? hasMore,
  }) {
    return NotificationState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
      selected: selected ?? this.selected,
      statusFilter: statusFilter ?? this.statusFilter,
      sort: sort ?? this.sort,
      pageNow: pageNow ?? this.pageNow,
      pageTotal: pageTotal ?? this.pageTotal,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  // SystemAlert doesn't have a direct 'category' field that matches NotificationCategoryEnum,
  // but we can map alertType or similar if needed. For now, let's just return items.
  List<SystemAlert> get _byCategory => items;

  List<SystemAlert> get _byStatus {
    switch (statusFilter) {
      case NotificationStatusFilterEnum.read:
        return _byCategory.where((e) => e.status == 2).toList(); // Assuming 2 is read
      case NotificationStatusFilterEnum.unread:
        return _byCategory.where((e) => e.status == 1).toList(); // Assuming 1 is unread
      case NotificationStatusFilterEnum.all:
      return _byCategory;
    }
  }

  List<SystemAlert> get rendered {
    final list = [..._byStatus];
    switch (sort) {
      case NotificationSortEnum.titleAZ:
        list.sort(
            (a, b) => (a.alertTitle ?? '').toLowerCase().compareTo((b.alertTitle ?? '').toLowerCase()));
        break;
      case NotificationSortEnum.titleZA:
        list.sort(
            (a, b) => (b.alertTitle ?? '').toLowerCase().compareTo((a.alertTitle ?? '').toLowerCase()));
        break;
      case NotificationSortEnum.none:
        break;
    }
    return list;
  }
}

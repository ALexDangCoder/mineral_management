import 'package:equatable/equatable.dart';
import 'package:bnv_opendata/data/model/notification_model.dart';

class NotificationState extends Equatable {
  final List<AppNotification> items;
  final NotificationCategory selected;
  final bool loading;

  const NotificationState({
    this.items = const [],
    this.selected = NotificationCategory.all,
    this.loading = false,
  });

  NotificationState copyWith({
    List<AppNotification>? items,
    NotificationCategory? selected,
    bool? loading,
  }) => NotificationState(
    items: items ?? this.items,
    selected: selected ?? this.selected,
    loading: loading ?? this.loading,
  );

  List<AppNotification> get visible =>
      selected == NotificationCategory.all
          ? items
          : items.where((e) => e.category == selected).toList();

  @override
  List<Object?> get props => [items, selected, loading];
}

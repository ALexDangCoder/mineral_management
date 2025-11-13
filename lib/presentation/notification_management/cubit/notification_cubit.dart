import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/data/repositories/notification_repository.dart';
import 'package:bnv_opendata/presentation/notification_management/cubit/notification_state.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repo;
  NotificationCubit(this.repo) : super(const NotificationState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    final items = await repo.fetchAll();
    emit(state.copyWith(loading: false, items: items));
  }

  void select(NotificationCategoryEnum cat) {
    emit(state.copyWith(selected: cat));
  }

  void setStatusFilter(NotificationStatusFilterEnum f) {
    emit(state.copyWith(statusFilter: f));
  }

  void setSort(NotificationSortEnum s) {
    emit(state.copyWith(sort: s));
  }

  Future<void> markRead(String id, {bool read = true}) async {
    final updated = state.items
        .map((n) => n.id == id ? n.coppyWith(isRead: read) : n)
        .toList();
    emit(state.copyWith(items: updated));
    await repo.markRead(id, read: read);
  }

  Future<void> markAllVisibleRead() async {
    final ids = state.rendered.map((e) => e.id);
    final updated = state.items
        .map((n) => ids.contains(n.id) ? n.coppyWith(isRead: true) : n)
        .toList();
    emit(state.copyWith(items: updated));
    await repo.markManyRead(ids, read: true);
  }
}

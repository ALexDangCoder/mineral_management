import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/data/repositories/notification_repository_impl.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepositoryImpl repo;
  NotificationCubit(this.repo) : super(const NotificationState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    final data = await repo.fetchAll();
    emit(state.copyWith(items: data, loading: false));
  }

  void select(NotificationCategory cat) {
    emit(state.copyWith(selected: cat));
  }


  Future<void> markAllVisibleRead() async {
    final ids = state.visible.map((e) => e.id).toList();
    final idSet = ids.toSet();
    // optimistic update
    final updated = state.items
        .map((n) => idSet.contains(n.id) ? n.coppyWith(isRead: true) : n)
        .toList();
    emit(state.copyWith(items: updated));
    // fallback call từng cái nếu repo chưa có batch
    for (final id in ids) {
      await repo.markRead(id, read: true);
    }
  }

  Future<void> markRead(String id, {bool read = true}) async {
    // optimistic update: chỉ item có id trùng mới đổi
    final updated = state.items
        .map((n) => n.id == id ? n.coppyWith(isRead: read) : n)
        .toList();

    emit(state.copyWith(items: updated));
    await repo.markRead(id, read: read);
  }

}

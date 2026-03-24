import 'package:bnv_opendata/data/models/request/system_alert_filter_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bnv_opendata/domain/repositories/notification_repository.dart';
import 'package:bnv_opendata/presentation/notification_management/cubit/notification_state.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repo;
  final String? objectId;

  NotificationCubit(this.repo, {this.objectId}) : super(const NotificationState());

  Future<void> load({bool refresh = true}) async {
    if (refresh) {
      emit(state.copyWith(loading: true, items: [], pageNow: 1));
    } else {
      if (!state.hasMore) return;
      emit(state.copyWith(pageNow: state.pageNow + 1));
    }

    final request = SystemAlertFilterRequest(
      pageSize: 20,
      pageNow: state.pageNow,
      filter: objectId != null ? {'objectId': objectId} : {},
    );

    try {
      final response = await repo.filterSystemAlerts(request);
      final pagedData = response.data;
      if (pagedData != null) {
        final newItems = pagedData.items ?? [];
        final updatedItems = refresh ? newItems : [...state.items, ...newItems];
        emit(state.copyWith(
          loading: false,
          items: updatedItems,
          pageTotal: pagedData.pageTotal ?? 1,
          hasMore: (pagedData.pageNow ?? 1) < (pagedData.pageTotal ?? 1),
        ));
      } else {
        emit(state.copyWith(loading: false));
      }
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
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

  Future<void> markRead(String alertId, {bool read = true}) async {
    final updated = state.items
        .map((n) => n.alertId == alertId ? n.copyWith(status: read ? 2 : 1) : n)
        .toList();
    emit(state.copyWith(items: updated));
    await repo.markRead(alertId, read: read);
  }

  Future<void> markAllVisibleRead() async {
    final ids = state.rendered.map((e) => e.alertId ?? '').where((id) => id.isNotEmpty);
    // ... logic to update local items ...
    await repo.markManyRead(ids, read: true);
  }
}

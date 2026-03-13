import 'dart:async';

import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'geological_report_list_state.dart';

class GeologicalReportListCubit extends Cubit<GeologicalReportListState> {
  GeologicalReportListCubit() : super(const GeologicalReportListState());

  Timer? _searchDebounce;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      const reports = <GeologicalReportItem>[
        GeologicalReportItem(
          id: '1',
          code: 'BCDC0111',
          name: 'Báo cáo địa chất mỏ Mạo Khê',
          mineSite: 'Khu mỏ Mạo Khê',
          mineral: 'Than',
          status: 'Đang thực hiện',
        ),
        GeologicalReportItem(
          id: '2',
          code: 'BCDC01101',
          name: 'Báo cáo địa chất mỏ Bành Long',
          mineSite: 'Khu mỏ Mạo Khê',
          mineral: 'Than',
          status: 'Đang thực hiện',
        ),
      ];

      final filtered = _filterReports(reports, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          reports: reports,
          filteredReports: filtered,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải danh sách báo cáo địa chất.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      final filtered = _filterReports(state.reports, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          filteredReports: filtered,
          errorMessage: null,
        ),
      );
    });
  }

  Future<void> refresh() async {
    await fetch();
  }

  Future<void> retry() async {
    await fetch();
  }

  List<GeologicalReportItem> _filterReports(
    List<GeologicalReportItem> input,
    String query,
  ) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return input;
    }
    return input
        .where(
          (item) =>
              item.code.toLowerCase().contains(normalized) ||
              item.name.toLowerCase().contains(normalized),
        )
        .toList();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}

class GeologicalReportItem extends Equatable {
  const GeologicalReportItem({
    required this.id,
    required this.code,
    required this.name,
    required this.mineSite,
    required this.mineral,
    required this.status,
  });

  final String id;
  final String code;
  final String name;
  final String mineSite;
  final String mineral;
  final String status;

  @override
  List<Object?> get props => [id, code, name, mineSite, mineral, status];
}

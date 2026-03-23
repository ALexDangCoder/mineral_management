import 'dart:async';

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'geological_report_list_state.dart';

class GeologicalReportListCubit extends Cubit<GeologicalReportListState> {
  GeologicalReportListCubit(this._mainMineRepository)
      : super(const GeologicalReportListState());

  Timer? _searchDebounce;
  final MainMineRepository _mainMineRepository;

  Future<void> init() => getReportList();

  Future<void> getReportList({int? page = 1}) async {
    if (page == 1) {
      emit(state.copyWith(status: MineScreenStatus.loading));
    }
    try {
      final params = BasePageParam<ListGeologicalReportFilter>(
        pageSize: 10,
        pageNow: page,
        filter: ListGeologicalReportFilter(reportName: state.searchKey
            // regionId: state.regionIdList,
            // areaName: state.searchKey,
            ),
      );
      final result = await _mainMineRepository.getListGeologicalReports(
        params.toJson(
          (filter) => filter.toJson(),
        ),
      );
      result.when(
        success: (data) {
          final List<GeologicalReportModel>? arrivalList = data.items;
          final List<GeologicalReportModel>? newList;
          if (data.pageNow == 1) {
            newList = arrivalList;
          } else {
            newList = [...state.reports, ...?arrivalList];
          }
          emit(
            state.copyWith(
              status: (newList?.isEmpty ?? false)
                  ? MineScreenStatus.empty
                  : MineScreenStatus.success,
              reports: newList,
              hasMore: (data.pageNow ?? 0) < (data.pageTotal ?? 0),
              page: (data.pageNow ?? 0) + 1,
              isLoadingMore: false,
            ),
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              status: MineScreenStatus.failure,
              errorMessage: failure.message,
            ),
          );
        },
      );
    } catch (_) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải danh sách báo cáo địa chất.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(searchKey: value));
    if (value.isEmpty || state.status == MineScreenStatus.loading) {
      return;
    }
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      // final filtered = _filterReports(state.reports, state.query);
      await getReportList();
    });
  }

  Future<void> refresh() async {
    await getReportList();
  }

  Future<void> retry() async {
    await getReportList();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore == true || state.hasMore == false) return;
    emit(state.copyWith(isLoadingMore: true));
    await getReportList(page: state.page);
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

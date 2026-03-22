import 'dart:async';

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/domain/params/param_exports.dart';
import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'proposal_plan_list_state.dart';

class ProposalPlanListCubit extends Cubit<ProposalPlanListState> {
  ProposalPlanListCubit(this._mainMineRepository)
      : super(const ProposalPlanListState());

  Timer? _searchDebounce;
  final MainMineRepository _mainMineRepository;

  Future<void> init() => getProposalPlansList();

  Future<void> getProposalPlansList({int? page = 1}) async {
    if (page == 1) {
      emit(state.copyWith(status: MineScreenStatus.loading));
    }
    try {
      final params = BasePageParam<ListProposalPlanFilter>(
        pageSize: 10,
        pageNow: page,
        filter: ListProposalPlanFilter(projectName: state.searchKey
            // regionId: state.regionIdList,
            // areaName: state.searchKey,
            ),
      );
      final result = await _mainMineRepository.getListProposalPlans(
        params.toJson(
          (filter) => filter.toJson(),
        ),
      );
      result.when(
        success: (data) {
          final List<ProposalPlanModel>? arrivalList = data.items;
          final List<ProposalPlanModel>? newList;
          if (data.pageNow == 1) {
            newList = arrivalList;
          } else {
            newList = [...state.plans, ...?arrivalList];
          }
          emit(
            state.copyWith(
              status: (newList?.isEmpty ?? false)
                  ? MineScreenStatus.empty
                  : MineScreenStatus.success,
              plans: newList,
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
              errorMessage: failure,
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
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      await getProposalPlansList();
    });
  }

  Future<void> refresh() async {
    await getProposalPlansList();
  }

  Future<void> retry() async {
    await getProposalPlansList();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore == true || state.hasMore == false) return;
    emit(state.copyWith(isLoadingMore: true));
    await getProposalPlansList(page: state.page);
  }

  List<ProposalPlanItem> _filterPlans(
      List<ProposalPlanItem> input, String query) {
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

class ProposalPlanItem extends Equatable {
  const ProposalPlanItem({
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

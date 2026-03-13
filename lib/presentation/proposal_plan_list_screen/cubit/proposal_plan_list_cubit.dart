import 'dart:async';

import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'proposal_plan_list_state.dart';

class ProposalPlanListCubit extends Cubit<ProposalPlanListState> {
  ProposalPlanListCubit() : super(const ProposalPlanListState());

  Timer? _searchDebounce;

  Future<void> init() => fetch();

  Future<void> fetch() async {
    emit(state.copyWith(status: MineScreenStatus.loading, errorMessage: null));
    try {
      const plans = <ProposalPlanItem>[
        ProposalPlanItem(
          id: '1',
          code: 'DAPA0111',
          name: 'Đề án thăm dò mỏ Mạo Khê',
          mineSite: 'Khu mỏ Mạo Khê',
          mineral: 'Than',
          status: 'Đang thi công',
        ),
        ProposalPlanItem(
          id: '2',
          code: 'DAPA01101',
          name: 'Đề án thăm dò mỏ Bành Long',
          mineSite: 'Khu mỏ Mạo Khê',
          mineral: 'Than',
          status: 'Đang thi công',
        ),
      ];
      final filtered = _filterPlans(plans, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          plans: plans,
          filteredPlans: filtered,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MineScreenStatus.failure,
          errorMessage: 'Không thể tải danh sách đề án.',
        ),
      );
    }
  }

  void onSearchChanged(String value) {
    emit(state.copyWith(query: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      final filtered = _filterPlans(state.plans, state.query);
      emit(
        state.copyWith(
          status: filtered.isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          filteredPlans: filtered,
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

  List<ProposalPlanItem> _filterPlans(List<ProposalPlanItem> input, String query) {
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

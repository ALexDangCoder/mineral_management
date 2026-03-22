part of 'proposal_plan_list_cubit.dart';

class ProposalPlanListState extends Equatable {
  const ProposalPlanListState({
    this.status = MineScreenStatus.initial,
    this.searchKey = '',
    this.plans = const <ProposalPlanModel>[],
    // this.filteredPlans = const <ProposalPlanItem>[],
    this.errorMessage,
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
  });

  final MineScreenStatus status;
  final String searchKey;
  final List<ProposalPlanModel> plans;

  // final List<ProposalPlanItem> filteredPlans;
  final String? errorMessage;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;

  ProposalPlanListState copyWith({
    MineScreenStatus? status,
    String? searchKey,
    List<ProposalPlanModel>? plans,
    // List<ProposalPlanItem>? filteredPlans,
    String? errorMessage,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
  }) {
    return ProposalPlanListState(
      status: status ?? this.status,
      searchKey: searchKey ?? this.searchKey,
      plans: plans ?? this.plans,
      // filteredPlans: filteredPlans ?? this.filteredPlans,
      errorMessage: errorMessage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        searchKey,
        plans,
        // filteredPlans,
        errorMessage,
        isLoadingMore,
        page,
        hasMore,
      ];
}

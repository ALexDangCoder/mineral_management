part of 'proposal_plan_list_cubit.dart';

class ProposalPlanListState extends Equatable {
  const ProposalPlanListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.plans = const <ProposalPlanItem>[],
    this.filteredPlans = const <ProposalPlanItem>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<ProposalPlanItem> plans;
  final List<ProposalPlanItem> filteredPlans;
  final String? errorMessage;

  ProposalPlanListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<ProposalPlanItem>? plans,
    List<ProposalPlanItem>? filteredPlans,
    String? errorMessage,
  }) {
    return ProposalPlanListState(
      status: status ?? this.status,
      query: query ?? this.query,
      plans: plans ?? this.plans,
      filteredPlans: filteredPlans ?? this.filteredPlans,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, plans, filteredPlans, errorMessage];
}

part of 'closure_plan_list_cubit.dart';

class ClosurePlanListState extends Equatable {
  const ClosurePlanListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.plans = const <ClosurePlan>[],
    this.filteredPlans = const <ClosurePlan>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<ClosurePlan> plans;
  final List<ClosurePlan> filteredPlans;
  final String? errorMessage;

  ClosurePlanListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<ClosurePlan>? plans,
    List<ClosurePlan>? filteredPlans,
    String? errorMessage,
  }) {
    return ClosurePlanListState(
      status: status ?? this.status,
      query: query ?? this.query,
      plans: plans ?? this.plans,
      filteredPlans: filteredPlans ?? this.filteredPlans,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, query, plans, filteredPlans, errorMessage];
}

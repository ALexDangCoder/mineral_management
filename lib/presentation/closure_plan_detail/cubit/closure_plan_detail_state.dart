part of 'closure_plan_detail_cubit.dart';

class ClosurePlanDetailState extends Equatable {
  const ClosurePlanDetailState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.plan,
    this.site,
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final ClosurePlan? plan;
  final MineSite? site;
  final String? errorMessage;

  ClosurePlanDetailState copyWith({
    MineScreenStatus? status,
    String? query,
    ClosurePlan? plan,
    MineSite? site,
    String? errorMessage,
  }) {
    return ClosurePlanDetailState(
      status: status ?? this.status,
      query: query ?? this.query,
      plan: plan ?? this.plan,
      site: site ?? this.site,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, plan, site, errorMessage];
}

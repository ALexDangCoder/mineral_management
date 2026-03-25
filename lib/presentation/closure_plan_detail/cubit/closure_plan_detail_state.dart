part of 'closure_plan_detail_cubit.dart';

class ClosurePlanDetailState extends Equatable {
  const ClosurePlanDetailState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.plan,
    this.area,
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final MineClosurePlanModel? plan;
  final MineAreaModel? area;
  final String? errorMessage;

  ClosurePlanDetailState copyWith({
    MineScreenStatus? status,
    String? query,
    MineClosurePlanModel? plan,
    MineAreaModel? area,
    String? errorMessage,
  }) {
    return ClosurePlanDetailState(
      status: status ?? this.status,
      query: query ?? this.query,
      plan: plan ?? this.plan,
      area: area ?? this.area,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, query, plan, area, errorMessage];
}

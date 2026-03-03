part of 'closure_plan_detail_cubit.dart';

class ClosurePlanDetailState extends BaseState {
  final BaseState? eventState;
  final ClosurePlanDetailModel? data;

  const ClosurePlanDetailState({
    this.eventState,
    this.data,
  });

  ClosurePlanDetailState copyWith({
    BaseState? eventState,
    ClosurePlanDetailModel? data,
  }) {
    return ClosurePlanDetailState(
      eventState: eventState ?? this.eventState,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
    eventState,
    data,
  ];
}

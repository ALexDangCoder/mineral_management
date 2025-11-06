part of 'drill_hole_list_cubit.dart';

class DrillHoleListState extends BaseState {
  final BaseState? eventState;
  final List<DrillHoleModel>? data;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;

  const DrillHoleListState({
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
    this.eventState,
    this.data,
  });

  DrillHoleListState copyWith({
    BaseState? eventState,
    List<DrillHoleModel>? data,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
  }) {
    return DrillHoleListState(
      eventState: eventState ?? this.eventState,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
    eventState,
    data,
    isLoadingMore,
    page,
    hasMore,
  ];
}

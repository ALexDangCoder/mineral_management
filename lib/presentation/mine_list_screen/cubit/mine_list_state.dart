part of 'mine_list_cubit.dart';

class MineListState extends BaseState {
  final BaseState? eventState;
  final List<MineModel>? data;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;

  const MineListState({
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
    this.eventState,
    this.data,
  });

  MineListState copyWith({
    BaseState? eventState,
    List<MineModel>? data,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
  }) {
    return MineListState(
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

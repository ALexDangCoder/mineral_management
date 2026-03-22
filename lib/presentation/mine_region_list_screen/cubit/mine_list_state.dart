part of 'mine_list_cubit.dart';

class MineListState extends Equatable {
  const MineListState({
    this.listMineRegionsResponse,
    this.mineRegions,
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
    this.searchKey,
    this.status = MineScreenStatus.initial,
    this.errorMessage,
  });

  final ListMineRegionsResponse? listMineRegionsResponse;
  final List<MineRegionModel>? mineRegions;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;
  final String? searchKey;

  final MineScreenStatus status;
  final String? errorMessage;

  MineListState copyWith({
    ListMineRegionsResponse? listMineRegionsResponse,
    List<MineRegionModel>? mineRegions,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
    String? searchKey,
    MineScreenStatus? status,
    String? errorMessage,
  }) {
    return MineListState(
      listMineRegionsResponse:
          listMineRegionsResponse ?? this.listMineRegionsResponse,
      mineRegions: mineRegions ?? this.mineRegions,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      searchKey: searchKey ?? this.searchKey,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        listMineRegionsResponse,
        mineRegions,
        isLoadingMore,
        page,
        hasMore,
        searchKey,
        status,
        errorMessage,
      ];
}

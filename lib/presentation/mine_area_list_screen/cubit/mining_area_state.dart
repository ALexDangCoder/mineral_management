part of 'mining_area_cubit.dart';

class MiningAreaState extends BaseState {
  final List<MineAreaModel>? mineAreaList;
  final bool? isLoadingMore;
  final int page;
  final bool? hasMore;
  final MineScreenStatus screenStatus;
  final List<String>? regionIdList;
  final String? errorMessage;
  final String? searchKey;
  final MineRegionModel? regionModel;

  const MiningAreaState({
    this.mineAreaList,
    this.isLoadingMore,
    this.page = 1,
    this.hasMore,
    this.screenStatus = MineScreenStatus.initial,
    this.regionIdList,
    this.errorMessage,
    this.searchKey,
    this.regionModel,
  });

  MiningAreaState copyWith({
    List<MineAreaModel>? mineAreaList,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
    MineScreenStatus? screenStatus,
    List<String>? regionIdList,
    String? errorMessage,
    String? searchKey,
    MineRegionModel? regionModel,
  }) {
    return MiningAreaState(
      mineAreaList: mineAreaList ?? this.mineAreaList,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      screenStatus: screenStatus ?? this.screenStatus,
      regionIdList: regionIdList ?? this.regionIdList,
      errorMessage: errorMessage ?? this.errorMessage,
      searchKey: searchKey ?? this.searchKey,
      regionModel: regionModel ?? this.regionModel,
    );
  }

  @override
  List<Object?> get props => [
        mineAreaList,
        isLoadingMore,
        page,
        hasMore,
        screenStatus,
        regionIdList,
        errorMessage,
        searchKey,
        regionModel,
      ];
}

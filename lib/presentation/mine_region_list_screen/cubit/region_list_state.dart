part of 'region_list_cubit.dart';

class RegionListState extends BaseListState<MineRegionModel> {
  const RegionListState({
    super.status,
    super.items = const [],
    super.isLoadingMore = false,
    super.hasMore,
    super.errorMessage,
    super.searchKey,
    super.page = 1,
  });

  @override
  RegionListState copyWith({
    MineScreenStatus? status,
    List<MineRegionModel>? items,
    bool? isLoadingMore,
    bool? hasMore,
    String? errorMessage,
    String? searchKey,
    int? page,
  }) {
    return RegionListState(
      status: status ?? this.status,
      items: items ?? this.items,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
      searchKey: searchKey ?? this.searchKey,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => super.props;
}

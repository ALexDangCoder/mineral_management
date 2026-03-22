part of 'mine_area_list_cubit.dart';


class MineAreaListState extends BaseListState<MineAreaModel> {
  const MineAreaListState({
    super.status,
    super.items = const [],
    super.isLoadingMore = false,
    super.hasMore,
    super.errorMessage,
    super.searchKey,
    super.page = 1,
  });

  @override
  MineAreaListState copyWith({
    MineScreenStatus? status,
    List<MineAreaModel>? items,
    bool? isLoadingMore,
    bool? hasMore,
    String? errorMessage,
    String? searchKey,
    int? page,
  }) {
    return MineAreaListState(
      status: status ?? this.status,
      items: items ?? this.items,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
      searchKey: searchKey ?? this.searchKey,
      page: page ?? this.page,
    );
  }
}

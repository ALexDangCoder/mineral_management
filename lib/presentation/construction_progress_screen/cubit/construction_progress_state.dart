part of 'construction_progress_cubit.dart';

class ConstructionProgressState extends BaseListState<ProposalPlanModel> {
  const ConstructionProgressState({
    super.status,
    super.items = const [],
    super.isLoadingMore = false,
    super.hasMore,
    super.errorMessage,
    super.searchKey,
    super.page = 1,
  });

  @override
  ConstructionProgressState copyWith({
    MineScreenStatus? status,
    List<ProposalPlanModel>? items,
    bool? isLoadingMore,
    bool? hasMore,
    String? errorMessage,
    String? searchKey,
    int? page,
  }) {
    return ConstructionProgressState(
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

part of 'base_list_cubit.dart';

class BaseListState<T> extends Equatable {
  final MineScreenStatus status;
  final List<T>? items;
  final bool isLoadingMore;
  final bool? hasMore;
  final String? errorMessage;
  final String? searchKey;
  final int page;

  const BaseListState({
    this.status = MineScreenStatus.initial,
    this.items,
    this.isLoadingMore = false,
    this.errorMessage,
    this.hasMore,
    this.searchKey,
    this.page = 1,
  });

  BaseListState<T> copyWith({
    MineScreenStatus? status,
    List<T>? items,
    bool? isLoadingMore,
    String? errorMessage,
    bool? hasMore,
    String? searchKey,
    int? page,
  }) {
    return BaseListState(
      status: status ?? this.status,
      items: items ?? this.items,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMore: hasMore ?? this.hasMore,
      searchKey: searchKey ?? this.searchKey,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        items,
        status,
        errorMessage,
        isLoadingMore,
        page,
        hasMore,
        searchKey,
      ];
}

import 'package:bloc/bloc.dart';
import 'package:bnv_opendata/data/models/response/result_page.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'base_list_state.dart';

abstract class BaseListCubit<T> extends Cubit<BaseListState<T>> {
  BaseListCubit() : super(BaseListState());

  Future<ResultPage<T>> fetchData({int? page, String? searchKey});

  Future<void> init() async => getList();

  Future<void> getList({int page = 1}) async {
    if (page == 1) {
      emit(state.copyWith(status: MineScreenStatus.loading));
    }
    try {
      final result = await fetchData(page: page, searchKey: state.searchKey);
      final newList =
          page == 1 ? result.items : [...?state.items, ...?result.items];
      emit(
        state.copyWith(
          status: (newList ?? []).isEmpty
              ? MineScreenStatus.empty
              : MineScreenStatus.success,
          items: newList,
          hasMore: (result.pageNow ?? 0) < (result.pageTotal ?? 0),
          // tuỳ
          // chỉnh theo API
          page: page + 1,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: MineScreenStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() async => getList();

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.hasMore == false) return;
    emit(state.copyWith(isLoadingMore: true));
    await getList(page: state.page);
  }

  Future<void> searchWithKey(String searchKey) async {
    emit(state.copyWith(searchKey: searchKey));
    if (searchKey.isEmpty || state.status == MineScreenStatus.loading) {
      return;
    }
    await getList();
  }
}

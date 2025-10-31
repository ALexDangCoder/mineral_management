import 'package:bnv_opendata/config/base/rx.dart';
import 'package:bnv_opendata/widgets/views/state_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseCubit<BaseState> extends BlocBase<BaseState> {
  BaseCubit(super.initialState);

  final List<dynamic> loadMoreList = [];
  int loadMorePage = 1;
  bool canLoadMore = true;
  bool loadMoreRefresh = true;
  bool loadMoreLoading = false;

  int get loadMoreItemCount =>
      canLoadMore ? loadMoreList.length + 1 : loadMoreList.length;

  final BehaviorSubject<StateLayout> _state =
      BehaviorSubject<StateLayout>.seeded(StateLayout.showLoading);

  Stream<StateLayout> get stateStream => _state.stream;

  void updateStateError() {
    _state.sink.add(StateLayout.showError);
  }

  void showLoading() {
    _state.wellAdd(StateLayout.showLoading);
  }

  void showError() {
    _state.wellAdd(StateLayout.showError);
  }

  void showEmpty() {
    _state.wellAdd(StateLayout.showEmpty);
  }

  void showContent() {
    _state.wellAdd(StateLayout.showContent);
  }
}

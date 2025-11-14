part of 'main_screen_cubit.dart';

final class MainScreenState extends BaseState {
  final int indexPage;

  const MainScreenState({this.indexPage = 0});

  MainScreenState copyWith({
    int? indexPage,
  }) {
    return MainScreenState(
      indexPage: indexPage ?? this.indexPage,
    );
  }

  @override
  List<Object?> get props => [
        indexPage,
      ];
}

part of 'mine_menu_cubit.dart';

class MineMenuState extends Equatable {
  const MineMenuState({
    this.status = MineScreenStatus.initial,
    this.items = const <MineMenuItem>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final List<MineMenuItem> items;
  final String? errorMessage;

  MineMenuState copyWith({
    MineScreenStatus? status,
    List<MineMenuItem>? items,
    String? errorMessage,
  }) {
    return MineMenuState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, items, errorMessage];
}

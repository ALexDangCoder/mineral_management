part of 'drill_hole_list_cubit.dart';

class DrillHoleListState extends Equatable {
  const DrillHoleListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.holes = const <DrillHole>[],
    this.filteredHoles = const <DrillHole>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<DrillHole> holes;
  final List<DrillHole> filteredHoles;
  final String? errorMessage;

  DrillHoleListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<DrillHole>? holes,
    List<DrillHole>? filteredHoles,
    String? errorMessage,
  }) {
    return DrillHoleListState(
      status: status ?? this.status,
      query: query ?? this.query,
      holes: holes ?? this.holes,
      filteredHoles: filteredHoles ?? this.filteredHoles,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, query, holes, filteredHoles, errorMessage];
}

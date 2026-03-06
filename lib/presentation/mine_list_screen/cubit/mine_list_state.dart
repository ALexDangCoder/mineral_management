part of 'mine_list_cubit.dart';

class MineListState extends Equatable {
  const MineListState({
    this.status = MineScreenStatus.initial,
    this.query = '',
    this.regions = const <MineRegion>[],
    this.filteredRegions = const <MineRegion>[],
    this.errorMessage,
  });

  final MineScreenStatus status;
  final String query;
  final List<MineRegion> regions;
  final List<MineRegion> filteredRegions;
  final String? errorMessage;

  MineListState copyWith({
    MineScreenStatus? status,
    String? query,
    List<MineRegion>? regions,
    List<MineRegion>? filteredRegions,
    String? errorMessage,
  }) {
    return MineListState(
      status: status ?? this.status,
      query: query ?? this.query,
      regions: regions ?? this.regions,
      filteredRegions: filteredRegions ?? this.filteredRegions,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, query, regions, filteredRegions, errorMessage];
}

part of 'mine_list_cubit.dart';

class MineListState extends Equatable {
  const MineListState({
    this.status = MineScreenStatus.initial,
    this.regions = const <MineRegion>[],
    this.expandedRegionId,
    this.sitesByRegion = const <String, List<MineSite>>{},
    this.loadingRegionIds = const <String>{},
    this.regionSiteErrors = const <String, String?>{},
    this.errorMessage,
  });

  final MineScreenStatus status;
  final List<MineRegion> regions;
  final String? expandedRegionId;
  final Map<String, List<MineSite>> sitesByRegion;
  final Set<String> loadingRegionIds;
  final Map<String, String?> regionSiteErrors;
  final String? errorMessage;

  MineListState copyWith({
    MineScreenStatus? status,
    List<MineRegion>? regions,
    String? expandedRegionId,
    bool clearExpandedRegion = false,
    Map<String, List<MineSite>>? sitesByRegion,
    Set<String>? loadingRegionIds,
    Map<String, String?>? regionSiteErrors,
    String? errorMessage,
  }) {
    return MineListState(
      status: status ?? this.status,
      regions: regions ?? this.regions,
      expandedRegionId:
          clearExpandedRegion ? null : (expandedRegionId ?? this.expandedRegionId),
      sitesByRegion: sitesByRegion ?? this.sitesByRegion,
      loadingRegionIds: loadingRegionIds ?? this.loadingRegionIds,
      regionSiteErrors: regionSiteErrors ?? this.regionSiteErrors,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        regions,
        expandedRegionId,
        sitesByRegion,
        loadingRegionIds,
        regionSiteErrors,
        errorMessage,
      ];
}

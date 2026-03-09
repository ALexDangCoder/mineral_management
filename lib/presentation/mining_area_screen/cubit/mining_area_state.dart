part of 'mining_area_cubit.dart';

class MiningAreaState extends BaseState {
  final BaseState? eventState;
  final List<MiningAreaModel>? miningAreas;
  final List<MiningAreaModel>? filteredMiningAreas;
  final MiningAreaModel? selectedMiningArea;
  final SubMiningAreaModel? selectedSubArea;
  final ProjectModel? selectedProject;
  final String? searchQuery;
  final List<int>? expandedMiningAreas;
  final List<int>? expandedSubAreas;
  final List<int>? expandedProjects;
  final int selectedTabIndex;

  const MiningAreaState({
    this.eventState,
    this.miningAreas,
    this.filteredMiningAreas,
    this.selectedMiningArea,
    this.selectedSubArea,
    this.selectedProject,
    this.searchQuery,
    this.expandedMiningAreas,
    this.expandedSubAreas,
    this.expandedProjects,
    this.selectedTabIndex = 0,
  });

  MiningAreaState copyWith({
    BaseState? eventState,
    List<MiningAreaModel>? miningAreas,
    List<MiningAreaModel>? filteredMiningAreas,
    MiningAreaModel? selectedMiningArea,
    SubMiningAreaModel? selectedSubArea,
    ProjectModel? selectedProject,
    String? searchQuery,
    List<int>? expandedMiningAreas,
    List<int>? expandedSubAreas,
    List<int>? expandedProjects,
    int? selectedTabIndex,
  }) {
    return MiningAreaState(
      eventState: eventState ?? this.eventState,
      miningAreas: miningAreas ?? this.miningAreas,
      filteredMiningAreas: filteredMiningAreas ?? this.filteredMiningAreas,
      selectedMiningArea: selectedMiningArea ?? this.selectedMiningArea,
      selectedSubArea: selectedSubArea ?? this.selectedSubArea,
      selectedProject: selectedProject ?? this.selectedProject,
      searchQuery: searchQuery ?? this.searchQuery,
      expandedMiningAreas: expandedMiningAreas ?? this.expandedMiningAreas,
      expandedSubAreas: expandedSubAreas ?? this.expandedSubAreas,
      expandedProjects: expandedProjects ?? this.expandedProjects,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [
        eventState,
        miningAreas,
        filteredMiningAreas,
        selectedMiningArea,
        selectedSubArea,
        selectedProject,
        searchQuery,
        expandedMiningAreas,
        expandedSubAreas,
        expandedProjects,
        selectedTabIndex,
      ];
}

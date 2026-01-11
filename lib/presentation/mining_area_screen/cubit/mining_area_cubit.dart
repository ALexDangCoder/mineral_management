import 'package:bnv_opendata/data/models/mining_area_model.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_cubit.dart';
import 'package:bnv_opendata/presentation/main_cubit/base_cubit/base_state.dart';

part 'mining_area_state.dart';

class MiningAreaCubit extends BaseCubit<MiningAreaState> {
  MiningAreaCubit() : super(const MiningAreaState());

  Future<void> fetchMiningAreas({
    bool isRefresh = false,
  }) async {
    emit(
      state.copyWith(
        eventState: isRefresh ? state.eventState : const LoadingState(),
      ),
    );

    // Dữ liệu mẫu - trong thực tế sẽ lấy từ API
    final miningAreas = [
      const MiningAreaModel(
        id: 1,
        name: 'Vùng Mạo Khê - Uông Bí',
        description: 'Vùng mỏ Mạo Khê - Uông Bí',
        icon: 'pin',
        subAreas: [
          SubMiningAreaModel(
            id: 1,
            name: 'Mạo Khê',
            description: 'Khu mỏ Mạo Khê',
            miningAreaId: 1,
            projects: [
              ProjectModel(
                id: 1,
                name: 'Đề án khai thác đá xây dựng khu mô A',
                description: 'Đề án khai thác đá xây dựng',
                subMiningAreaId: 1,
                items: [
                  ProjectItemModel(
                    id: 1,
                    name: 'Quản lý tiến độ thanh toán',
                    type: 'payment',
                    projectId: 1,
                  ),
                  ProjectItemModel(
                    id: 2,
                    name: 'Dữ liệu ảnh',
                    type: 'image',
                    projectId: 1,
                  ),
                  ProjectItemModel(
                    id: 3,
                    name: 'Dữ liệu số',
                    type: 'data',
                    projectId: 1,
                  ),
                  ProjectItemModel(
                    id: 4,
                    name: 'Quản lý tiến độ thi công',
                    type: 'construction',
                    projectId: 1,
                  ),
                ],
              ),
              ProjectModel(
                id: 2,
                name: 'Đề án cải tạo phục hồi môi trường mỏ B',
                description: 'Đề án cải tạo môi trường',
                subMiningAreaId: 1,
              ),
            ],
          ),
        ],
      ),
      const MiningAreaModel(
        id: 2,
        name: 'Vùng Hòn Gai',
        description: 'Vùng mỏ Hòn Gai',
        icon: 'pin',
        subAreas: [
          SubMiningAreaModel(
            id: 2,
            name: 'Hòn Gai',
            description: 'Khu mỏ Hòn Gai',
            miningAreaId: 2,
          ),
        ],
      ),
    ];

    emit(
      state.copyWith(
        eventState: const LoadedState(),
        miningAreas: miningAreas,
        filteredMiningAreas: miningAreas,
      ),
    );
  }

  void searchMiningAreas(String query) {
    if (query.isEmpty) {
      emit(
        state.copyWith(
          filteredMiningAreas: state.miningAreas,
          searchQuery: '',
        ),
      );
      return;
    }

    final queryLower = query.toLowerCase();
    final filtered = state.miningAreas?.map((area) {
      final matchesArea = area.name?.toLowerCase().contains(queryLower) ?? false;
      
      final filteredSubAreas = area.subAreas?.where((subArea) {
        final matchesSubArea = subArea.name?.toLowerCase().contains(queryLower) ?? false;
        return matchesSubArea;
      }).toList();

      if (matchesArea || (filteredSubAreas?.isNotEmpty ?? false)) {
        return area.copyWith(
          subAreas: matchesArea ? area.subAreas : filteredSubAreas,
        );
      }
      return null;
    }).where((area) => area != null).cast<MiningAreaModel>().toList();

    emit(
      state.copyWith(
        filteredMiningAreas: filtered,
        searchQuery: query,
      ),
    );
  }

  void selectMiningArea(MiningAreaModel? area) {
    emit(
      state.copyWith(
        selectedMiningArea: area,
        selectedSubArea: null,
        selectedProject: null,
      ),
    );
  }

  void selectSubArea(SubMiningAreaModel? subArea) {
    emit(
      state.copyWith(
        selectedSubArea: subArea,
        selectedProject: null,
      ),
    );
  }

  void selectProject(ProjectModel? project) {
    emit(
      state.copyWith(
        selectedProject: project,
      ),
    );
  }

  void toggleMiningAreaExpansion(int areaId) {
    final expandedAreas = Set<int>.from(state.expandedMiningAreas ?? []);
    if (expandedAreas.contains(areaId)) {
      expandedAreas.remove(areaId);
    } else {
      expandedAreas.add(areaId);
    }

    emit(
      state.copyWith(
        expandedMiningAreas: expandedAreas.toList(),
      ),
    );
  }

  void toggleSubAreaExpansion(int subAreaId) {
    final expandedSubAreas = Set<int>.from(state.expandedSubAreas ?? []);
    if (expandedSubAreas.contains(subAreaId)) {
      expandedSubAreas.remove(subAreaId);
    } else {
      expandedSubAreas.add(subAreaId);
    }

    emit(
      state.copyWith(
        expandedSubAreas: expandedSubAreas.toList(),
      ),
    );
  }

  void toggleProjectExpansion(int projectId) {
    final expandedProjects = Set<int>.from(state.expandedProjects ?? []);
    if (expandedProjects.contains(projectId)) {
      expandedProjects.remove(projectId);
    } else {
      expandedProjects.add(projectId);
    }

    emit(
      state.copyWith(
        expandedProjects: expandedProjects.toList(),
      ),
    );
  }

  void selectTab(int index) {
    emit(
      state.copyWith(
        selectedTabIndex: index,
      ),
    );
  }
}

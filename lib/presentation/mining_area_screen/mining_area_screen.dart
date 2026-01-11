import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/models/mining_area_model.dart';
import 'package:bnv_opendata/data/models/drill_hole_model.dart';
import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:bnv_opendata/presentation/mining_area_screen/cubit/mining_area_cubit.dart';
import 'package:bnv_opendata/presentation/show_construction_map/show_construction_Map_screen.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiningAreaScreen extends StatelessWidget {
  const MiningAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MiningAreaCubit()..fetchMiningAreas(),
      child: const _MiningAreaScreenBody(),
    );
  }
}

class _MiningAreaScreenBody extends StatelessWidget {
  const _MiningAreaScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XelaColor.Gray12,
      drawer: const _MiningAreaDrawer(),
      appBar: AppBar(
        title: Text(
          'Vùng mỏ',
          style: XelaTextStyle.xelaButtonLarge.apply(color: XelaColor.Gray2),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: XelaColor.Gray2),
      ),
      body: BlocBuilder<MiningAreaCubit, MiningAreaState>(
        builder: (context, state) {
          return Column(
            children: [
              // Top Tab Bar
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: XelaTabs(
                  items: [
                    XelaTabItem(
                      id: 0,
                      label: 'Danh mục và tài liệu',
                    ),
                    XelaTabItem(
                      id: 1,
                      label: 'Bản đồ',
                    ),
                  ],
                  tabsValue: state.selectedTabIndex,
                  onChange: (item) {
                    context.read<MiningAreaCubit>().selectTab(item.id);
                  },
                  primaryColor: AppTheme.getInstance().primaryColor(),
                ),
              ),
              // Content
              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: [
                    _ReportsTabContent(selectedSubArea: state.selectedSubArea),
                    _MapTabContent(selectedSubArea: state.selectedSubArea),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MiningAreaDrawer extends StatefulWidget {
  const _MiningAreaDrawer();

  @override
  State<_MiningAreaDrawer> createState() => _MiningAreaDrawerState();
}

class _MiningAreaDrawerState extends State<_MiningAreaDrawer> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiningAreaCubit, MiningAreaState>(
      builder: (context, state) {
        return Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: XelaColor.Gray10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vùng mỏ',
                      style: XelaTextStyle.xelaButtonMedium.apply(
                        color: XelaColor.Gray2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Search field
                    XelaTextField(
                      textEditingController: _searchController,
                      placeholder: 'Tìm kiếm vùng mỏ, khu mỏ...',
                      leftIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: XelaColor.Gray6,
                      ),
                      background: XelaColor.Gray11,
                      onChange: (value) {
                        context
                            .read<MiningAreaCubit>()
                            .searchMiningAreas(value);
                      },
                    ),
                  ],
                ),
              ),
              // List of mining areas
              Expanded(
                child: state.filteredMiningAreas == null ||
                        state.filteredMiningAreas!.isEmpty
                    ? Center(
                        child: Text(
                          'Không có dữ liệu',
                          style: XelaTextStyle.xelaBody.apply(
                            color: XelaColor.Gray6,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.filteredMiningAreas!.length,
                        itemBuilder: (context, index) {
                          final area = state.filteredMiningAreas![index];
                          final isExpanded =
                              state.expandedMiningAreas?.contains(area.id) ??
                                  false;
                          final isSelected =
                              state.selectedMiningArea?.id == area.id;

                          return _MiningAreaItem(
                            area: area,
                            isExpanded: isExpanded,
                            isSelected: isSelected,
                            state: state,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MiningAreaItem extends StatelessWidget {
  final MiningAreaModel area;
  final bool isExpanded;
  final bool isSelected;
  final MiningAreaState state;

  const _MiningAreaItem({
    required this.area,
    required this.isExpanded,
    required this.isSelected,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<MiningAreaCubit>().selectMiningArea(area);
            context.read<MiningAreaCubit>().toggleMiningAreaExpansion(area.id!);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isSelected ? XelaColor.Blue11 : Colors.transparent,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 20,
                  color: XelaColor.Gray2,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    area.name ?? '',
                    style: XelaTextStyle.xelaBody.apply(
                      color: isSelected
                          ? AppTheme.getInstance().primaryColor()
                          : XelaColor.Gray2,
                    ),
                  ),
                ),
                if (area.subAreas != null && area.subAreas!.isNotEmpty)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: XelaColor.Gray6,
                  ),
              ],
            ),
          ),
        ),
        if (isExpanded && area.subAreas != null)
          ...area.subAreas!.map((subArea) {
            final isSubExpanded =
                state.expandedSubAreas?.contains(subArea.id) ?? false;
            final isSubSelected = state.selectedSubArea?.id == subArea.id;

            return _SubMiningAreaItem(
              subArea: subArea,
              isExpanded: isSubExpanded,
              isSelected: isSubSelected,
              state: state,
              indent: 48,
            );
          }),
      ],
    );
  }
}

class _SubMiningAreaItem extends StatelessWidget {
  final SubMiningAreaModel subArea;
  final bool isExpanded;
  final bool isSelected;
  final MiningAreaState state;
  final double indent;

  const _SubMiningAreaItem({
    required this.subArea,
    required this.isExpanded,
    required this.isSelected,
    required this.state,
    required this.indent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<MiningAreaCubit>().selectSubArea(subArea);
            if (subArea.projects != null && subArea.projects!.isNotEmpty) {
              context
                  .read<MiningAreaCubit>()
                  .toggleSubAreaExpansion(subArea.id!);
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: indent,
              right: 16,
              top: 12,
              bottom: 12,
            ),
            color: isSelected ? XelaColor.Blue11 : Colors.transparent,
            child: Row(
              children: [
                const Icon(
                  Icons.folder,
                  size: 18,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    subArea.name ?? '',
                    style: XelaTextStyle.xelaBody.apply(
                      color: isSelected
                          ? AppTheme.getInstance().primaryColor()
                          : XelaColor.Gray2,
                    ),
                  ),
                ),
                if (subArea.projects != null && subArea.projects!.isNotEmpty)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: XelaColor.Gray6,
                  ),
              ],
            ),
          ),
        ),
        if (isExpanded && subArea.projects != null)
          ...subArea.projects!.map((project) {
            final isProjectExpanded =
                state.expandedProjects?.contains(project.id) ?? false;
            final isProjectSelected = state.selectedProject?.id == project.id;

            return _ProjectItem(
              project: project,
              isExpanded: isProjectExpanded,
              isSelected: isProjectSelected,
              state: state,
              indent: indent + 48,
            );
          }),
      ],
    );
  }
}

class _ProjectItem extends StatelessWidget {
  final ProjectModel project;
  final bool isExpanded;
  final bool isSelected;
  final MiningAreaState state;
  final double indent;

  const _ProjectItem({
    required this.project,
    required this.isExpanded,
    required this.isSelected,
    required this.state,
    required this.indent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<MiningAreaCubit>().selectProject(project);
            if (project.items != null && project.items!.isNotEmpty) {
              context
                  .read<MiningAreaCubit>()
                  .toggleProjectExpansion(project.id!);
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: indent,
              right: 16,
              top: 12,
              bottom: 12,
            ),
            color: isSelected ? XelaColor.Blue11 : Colors.transparent,
            child: Row(
              children: [
                const Icon(
                  Icons.description,
                  size: 18,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    project.name ?? '',
                    style: XelaTextStyle.xelaBody.apply(
                      color: isSelected
                          ? AppTheme.getInstance().primaryColor()
                          : XelaColor.Gray2,
                    ),
                  ),
                ),
                if (project.items != null && project.items!.isNotEmpty)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: XelaColor.Gray6,
                  ),
              ],
            ),
          ),
        ),
        if (isExpanded && project.items != null)
          ...project.items!.map((item) {
            return Container(
              padding: EdgeInsets.only(
                left: indent + 48,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Icon(
                    _getItemIcon(item.type),
                    size: 16,
                    color: XelaColor.Gray6,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.name ?? '',
                      style: XelaTextStyle.xelaSmallBody.apply(
                        color: XelaColor.Gray6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }

  IconData _getItemIcon(String? type) {
    switch (type) {
      case 'payment':
        return Icons.payment;
      case 'image':
        return Icons.image;
      case 'data':
        return Icons.data_object;
      case 'construction':
        return Icons.construction;
      default:
        return Icons.folder;
    }
  }
}

class _ReportsTabContent extends StatelessWidget {
  final SubMiningAreaModel? selectedSubArea;

  const _ReportsTabContent({this.selectedSubArea});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu lỗ khoan
    final drillHoles = selectedSubArea == null
        ? <Map<String, dynamic>>[]
        : [
            {
              'id': 1,
              'holeName': 'LK-01',
              'mineralType': 'Đá vôi',
              'coordinateX': 105.8542,
              'coordinateY': 21.0285,
              'coordinateZ': 150.5,
              'depth': 180.5,
              'status': 'Hoàn thành',
            },
            {
              'id': 2,
              'holeName': 'LK-02',
              'mineralType': 'Than đá',
              'coordinateX': 105.8560,
              'coordinateY': 21.0300,
              'coordinateZ': 148.2,
              'depth': 200.0,
              'status': 'Đang thi công',
            },
            {
              'id': 3,
              'holeName': 'LK-03',
              'mineralType': 'Đá granit',
              'coordinateX': 105.8580,
              'coordinateY': 21.0320,
              'coordinateZ': 145.8,
              'depth': 165.3,
              'status': 'Chờ thi công',
            },
            {
              'id': 4,
              'holeName': 'LK-04',
              'mineralType': 'Đá vôi',
              'coordinateX': 105.8520,
              'coordinateY': 21.0260,
              'coordinateZ': 152.0,
              'depth': 175.8,
              'status': 'Tạm dừng',
            },
            {
              'id': 5,
              'holeName': 'LK-05',
              'mineralType': 'Than đá',
              'coordinateX': 105.8600,
              'coordinateY': 21.0340,
              'coordinateZ': 143.5,
              'depth': 190.2,
              'status': 'Hoàn thành',
            },
          ];

    return Container(
      color: XelaColor.Gray12,
      padding: const EdgeInsets.all(16),
      child: selectedSubArea == null
          ? Center(
              child: Text(
                'Vui lòng chọn khu mỏ để xem danh sách lỗ khoan',
                style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray6),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách lỗ khoan - ${selectedSubArea?.name}',
                  style: XelaTextStyle.xelaButtonMedium.apply(
                    color: XelaColor.Gray2,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: drillHoles.isEmpty
                      ? Center(
                          child: Text(
                            'Không có lỗ khoan nào',
                            style: XelaTextStyle.xelaBody.apply(
                              color: XelaColor.Gray6,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: drillHoles.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemBuilder: (context, index) {
                            final drillHole = drillHoles[index];
                            return _DrillHoleItem(
                              drillHole: drillHole,
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}

class _DrillHoleItem extends StatelessWidget {
  final Map<String, dynamic> drillHole;

  const _DrillHoleItem({
    required this.drillHole,
  });

  @override
  Widget build(BuildContext context) {
    final status = drillHole['status'] as String?;
    final statusColor = _getStatusColor(status);

    return InkWell(
      onTap: () {
        // TODO: Navigate to drill hole detail
        Navigator.pushNamed(
          context,
          Routers.drillHoleDetail,
          arguments: {
            'drillHole': DrillHoleModel(
              holeId: drillHole['id'],
              holeName: drillHole['holeName'],
              mine: MineModel(
                mineralType: drillHole['mineralType'],
              ),
            ),
            'depth': '${drillHole['depth']} m',
            'coordinates': '${drillHole['coordinateY']}, ${drillHole['coordinateX']}',
          },
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Tên lỗ khoan và trạng thái
            Row(
              children: [
                Expanded(
                  child: Text(
                    drillHole['holeName'] ?? 'N/A',
                    style: XelaTextStyle.xelaBodyBold.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: statusColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    status ?? 'N/A',
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Loại khoáng sản
            Row(
              children: [
                Icon(
                  Icons.category,
                  size: 16,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 8),
                Text(
                  'Loại khoáng sản: ',
                  style: XelaTextStyle.xelaCaption.apply(
                    color: XelaColor.Gray6,
                  ),
                ),
                Text(
                  drillHole['mineralType'] ?? 'N/A',
                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                    color: XelaColor.Gray2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Tọa độ X, Y, Z
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 8),
                Text(
                  'Tọa độ: ',
                  style: XelaTextStyle.xelaCaption.apply(
                    color: XelaColor.Gray6,
                  ),
                ),
                Text(
                  'X: ${drillHole['coordinateX'] ?? 'N/A'}, Y: ${drillHole['coordinateY'] ?? 'N/A'}, Z: ${drillHole['coordinateZ'] ?? 'N/A'}',
                  style: XelaTextStyle.xelaSmallBody.apply(
                    color: XelaColor.Gray2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Chiều sâu
            Row(
              children: [
                Icon(
                  Icons.straighten,
                  size: 16,
                  color: XelaColor.Gray6,
                ),
                const SizedBox(width: 8),
                Text(
                  'Chiều sâu: ',
                  style: XelaTextStyle.xelaCaption.apply(
                    color: XelaColor.Gray6,
                  ),
                ),
                Text(
                  '${drillHole['depth'] ?? 'N/A'} m',
                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                    color: XelaColor.Gray2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Hoàn thành':
        return XelaColor.Green6;
      case 'Đang thi công':
        return AppTheme.getInstance().primaryColor();
      case 'Chờ thi công':
        return XelaColor.Orange6;
      case 'Tạm dừng':
        return XelaColor.Gray7;
      default:
        return XelaColor.Gray7;
    }
  }
}

class _MapTabContent extends StatelessWidget {
  final SubMiningAreaModel? selectedSubArea;

  const _MapTabContent({this.selectedSubArea});

  @override
  Widget build(BuildContext context) {
    if (selectedSubArea == null) {
      return Container(
        color: XelaColor.Gray12,
        child: Center(
          child: Text(
            'Vui lòng chọn khu mỏ để xem bản đồ',
            style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray6),
          ),
        ),
      );
    }

    // Sử dụng ShowConstructionMapScreen với context của khu mỏ được chọn
    return const ShowConstructionMapScreen();
  }
}

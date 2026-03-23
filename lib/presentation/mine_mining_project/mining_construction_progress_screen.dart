import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/mine_mining_project/cubit/mining_construction_progress_cubit.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class MiningConstructionProgressScreen
    extends MineBaseListScreen<PlannedBoreholeModel, MiningConstructionProgressCubit> {
  final String projectId;

  MiningConstructionProgressScreen({
    super.key,
    required this.projectId,
  }) : super(
          title: 'Tiến độ thi công',
          searchPlaceholder: 'Tìm kiếm lỗ khoan',
          buildItem: _buildItem,
          createCubit: (context) =>
              MiningConstructionProgressCubit(injector.get(), projectId),
        );

  static Widget _buildItem(BuildContext context, PlannedBoreholeModel item) {
    // Status text mapping
    String statusText = 'N/A';
    Color statusColor = XelaColor.Gray6;
    if (item.completedStatus == 1) {
      statusText = 'Hoàn thành';
      statusColor = XelaColor.Green1;
    } else if (item.inProgressStatus == 1) {
      statusText = 'Đang thực hiện';
      statusColor = XelaColor.Orange6;
    } else {
      statusText = 'Chưa thực hiện';
      statusColor = XelaColor.Gray6;
    }

    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 20, color: XelaColor.Gray6),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.boreholeId ?? 'Không có mã',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              XkStatusChip(
                text: statusText,
                color: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRow('Tên lỗ khoan:', item.boreholeName ?? 'N/A'),
          const SizedBox(height: 8),
          _buildRow('Độ sâu thực hiện:', '${item.constructedDepth ?? 0}m / ${item.plannedDepth ?? 0}m'),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          XkActionButton(
            text: 'Mẫu vật',
            onTap: () {
              // TODO: View samples
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6)),
        Text(value,
            style: XelaTextStyle.xelaSmallBodyBold.apply(color: XelaColor.Gray2)),
      ],
    );
  }
}

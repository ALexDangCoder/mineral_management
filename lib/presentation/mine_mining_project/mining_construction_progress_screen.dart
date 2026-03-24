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

    double progress = (item.plannedDepth ?? 0) > 0
        ? (item.constructedDepth ?? 0) / (item.plannedDepth ?? 0)
        : 0.0;
    if (progress > 1.0) progress = 1.0;

    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: XelaColor.Blue11,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.architecture_rounded,
                    size: 20, color: XelaColor.Blue5),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.boreholeName ?? 'N/A',
                      style: XelaTextStyle.xelaBodyBold
                          .apply(color: XelaColor.Gray2),
                    ),
                    Text(
                      'Mã: ${item.boreholeId ?? 'N/A'}',
                      style: XelaTextStyle.xelaCaption
                          .apply(color: XelaColor.Gray6),
                    ),
                  ],
                ),
              ),
              XkStatusChip(
                text: statusText,
                color: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tiến độ thi công',
                    style: XelaTextStyle.xelaSmallBody
                        .apply(color: XelaColor.Gray5),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: XelaTextStyle.xelaSmallBodyBold
                        .apply(color: XelaColor.Blue5),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: XelaColor.Gray11,
                  color: XelaColor.Blue5,
                  minHeight: 6,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: XkLabelValueRow(
                  label: 'Kế hoạch',
                  value: '${item.plannedDepth ?? 0}m',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: XkLabelValueRow(
                  label: 'Thực hiện',
                  value: '${item.constructedDepth ?? 0}m',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          XkActionButton(
            text: 'Mẫu vật địa chất',
            onTap: () {
              // TODO: View samples
            },
          ),
        ],
      ),
    );
  }
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/mine_mining_project/mine_mining_project_list_cubit.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';

class MineMiningProjectListScreen
    extends MineBaseListScreen<MiningProjectModel, MineMiningProjectListCubit> {
  MineMiningProjectListScreen({
    super.key,
  }) : super(
          title: 'Danh sách dự án khai thác',
          searchPlaceholder: 'Tìm kiếm theo mã hoặc tên dự án',
          buildItem: _buildItem,
          createCubit: (context) => MineMiningProjectListCubit(injector.get()),
        );

  static Widget _buildItem(BuildContext context, MiningProjectModel project) {
    return XkCard(
      onTap: () {
        MineFlowRoutes.pushMiningProjectDetail(context, project.objectId?.toString() ?? '');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.description_outlined,
                size: 20,
                color: XelaColor.Gray6,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  project.miningId ?? 'N/A',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              Text(
                project.status == 1 ? "Đang thực hiện" : "Khác",
                style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray4),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project.miningName ?? 'N/A',
            style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          XkLabelValueRow(
            label: 'Loại khoáng sản:',
            value: project.mineralName ?? 'N/A',
          ),
          const SizedBox(height: 4),
          XkLabelValueRow(
            label: 'Công suất thiết kế:',
            value: project.designedCapacity?.toString() ?? '0',
          ),
          const SizedBox(height: 4),
          XkLabelValueRow(
            label: 'Trữ lượng dự kiến:',
            value: project.expectedReserve?.toString() ?? '0',
          ),
          const SizedBox(height: 4),
          XkLabelValueRow(
            label: 'Tổng mức đầu tư:',
            value: project.totalInvestment?.toString() ?? '0',
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tỷ lệ hoàn thành',
                    style:
                        XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6),
                  ),
                  Text(
                    '${project.completionRate?.toString() ?? '0'}%',
                    style: XelaTextStyle.xelaSmallBodyBold
                        .apply(color: XelaColor.Blue5),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (project.completionRate ?? 0) / 100,
                  backgroundColor: XelaColor.Gray11,
                  color: XelaColor.Blue5,
                  minHeight: 6,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.constructionProgress,
                        arguments: {'projectId': project.miningId});
                  },
                  child: Text(
                    'Tiến độ thi công',
                    textAlign: TextAlign.left,
                    style: XelaTextStyle.xelaBodyBold
                        .apply(color: XelaColor.Blue6),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.paymentProgress,
                        arguments: {'projectId': project.miningId});
                  },
                  child: Text(
                    'Tiến độ thanh toán',
                    textAlign: TextAlign.right,
                    style: XelaTextStyle.xelaBodyBold
                        .apply(color: XelaColor.Blue6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/mine_closure_plan/mine_closure_plan_list_cubit.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:bnv_opendata/config/routes/router.dart';

class MineClosurePlanListScreen
    extends MineBaseListScreen<ProposalPlanModel, MineClosurePlanListCubit> {
  MineClosurePlanListScreen({
    super.key,
  }) : super(
          title: 'Đề án đóng cửa mỏ',
          searchPlaceholder: 'Tìm kiếm theo mã hoặc tên đề án',
          buildItem: _buildItem,
          createCubit: (context) => MineClosurePlanListCubit(injector.get()),
        );

  static Widget _buildItem(
      BuildContext context, ProposalPlanModel proposalPlan) {
    return XkCard(
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
                  proposalPlan.projectId ?? 'N/A',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              Text(
                proposalPlan.status.toString(),
                style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray4),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            proposalPlan.projectName ?? 'N/A',
            style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          Text(
            proposalPlan.mineName ?? 'N/A',
            style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          Text(
            proposalPlan.areaName ?? 'N/A',
            style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routers.constructionProgress,
                  arguments: {'projectId': proposalPlan.projectId});
            },
            child: Text(
              'Tiến độ thi công',
              textAlign: TextAlign.left,
              style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Blue6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tiến độ thanh toán',
            style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Blue6),
          ),
        ],
      ),
    );
  }
}

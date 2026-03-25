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
    extends MineBaseListScreen<MineClosurePlanModel, MineClosurePlanListCubit> {
  MineClosurePlanListScreen({
    super.key,
  }) : super(
          title: 'Đề án đóng cửa mỏ',
          searchPlaceholder: 'Tìm kiếm theo mã hoặc tên đề án',
          buildItem: _buildItem,
          createCubit: (context) => MineClosurePlanListCubit(injector.get()),
        );

  static Widget _buildItem(
      BuildContext context, MineClosurePlanModel closurePlan) {
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
                  closurePlan.closurePlanId ?? 'N/A',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              Text(
                closurePlan.status == 1 ? 'Đang thực hiện' : 'Hoàn thành',
                style: XelaTextStyle.xelaBody.apply(
                  color: closurePlan.status == 1
                      ? XelaColor.Blue6
                      : XelaColor.Green6,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            closurePlan.closurePlanName ?? 'N/A',
            style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          XkLabelValueRow(
            label: 'Khoáng sản:',
            value: closurePlan.mineralName ?? 'N/A',
          ),
          XkLabelValueRow(
            label: 'Ngày phê duyệt:',
            value: closurePlan.approvalDateDCM != null
                ? closurePlan.approvalDateDCM!.toLocal().toString().split(' ')[0]
                : 'N/A',
          ),
          XkLabelValueRow(
            label: 'Ngày hết hạn:',
            value: closurePlan.expirationDate != null
                ? closurePlan.expirationDate!.toLocal().toString().split(' ')[0]
                : 'N/A',
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.constructionProgress,
                        arguments: {'projectId': closurePlan.closurePlanId});
                  },
                  child: Text(
                    'Tiến độ thi công',
                    textAlign: TextAlign.left,
                    style:
                        XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Blue6),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Tiến độ thanh toán',
                  textAlign: TextAlign.right,
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Blue6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/construction_progress_screen/cubit/construction_progress_cubit.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ConstructionProgressScreen extends MineBaseListScreen<
    PlannedBoreholeModel, ConstructionProgressCubit> {
  ConstructionProgressScreen(
    this.projectId, {
    super.key,
  }) : super(
          title: 'Tiến độ thi công',
          isShowSearchTField: false,
          buildItem: _buildItem,
          createCubit: (context) => ConstructionProgressCubit(injector.get()),
        );

  final String? projectId;

  static Widget _buildItem(
      BuildContext context, PlannedBoreholeModel borehole) {
    return XkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  borehole.boreholeName ?? 'N/A',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              Text(
                borehole.completedStatus.toString(),
                style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray4),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tuyến: ',
                  style: XelaTextStyle.xelaButtonLarge
                      .apply(color: XelaColor.Gray2),
                ),
                TextSpan(
                  text: borehole.routeName ?? 'N/A',
                  style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Nhiệm vụ nghiên cứu: ',
                  style: XelaTextStyle.xelaButtonLarge
                      .apply(color: XelaColor.Gray2),
                ),
                TextSpan(
                  text: borehole.studyMission ?? 'N/A',
                  style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          if ((borehole.seamName ?? '').isNotEmpty) ...[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Các thân quặng đi qua: ',
                    style: XelaTextStyle.xelaButtonLarge
                        .apply(color: XelaColor.Gray2),
                  ),
                  TextSpan(
                    text: borehole.seamName ?? 'N/A',
                    style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          Align(
            alignment: Alignment.centerRight,
            child: XkActionButton(
              text: 'Xem hồ sơ',
              onTap: () {
                ///TODO:
              },
            ),
          ),
        ],
      ),
    );
  }
}

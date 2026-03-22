import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_area_list_screen/cubit/mine_area_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class MineAreaListScreen
    extends MineBaseListScreen<MineAreaModel, MineAreaListCubit> {
  MineAreaListScreen({super.key, this.region})
      : super(
          title: 'Danh sách khu mỏ\n${region?.regionName ?? ''}'.trim(),
          searchPlaceholder: 'Tìm kiếm khu mỏ...',
          buildItem: _buildItem,
          createCubit: (context) => MineAreaListCubit(injector.get()),
        );

  final MineRegionModel? region;

  static Widget _buildItem(BuildContext context, MineAreaModel mineArea) {
    return XkCard(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routers.mineDetail,
          arguments: {'areaId': mineArea.areaId},
        );
      },
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 22, color: XelaColor.Gray3),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              mineArea.areaName ?? '',
              style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 22,
            color: XelaColor.Gray5,
          ),
        ],
      ),
    );
  }
}

import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/data/models/model_exports.dart';
import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_base_list_screen/mine_base_list_screen.dart';
import 'package:bnv_opendata/presentation/mine_region_list_screen/update_region_list/cubit/region_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class UpdateMineRegionListScreen
    extends MineBaseListScreen<MineRegionModel, RegionListCubit> {
  UpdateMineRegionListScreen({super.key})
      : super(
          title: 'Danh sách vùng mỏ',
          searchPlaceholder: 'Tìm kiếm vùng mỏ...',
          buildItem: _buildItem,
          createCubit: (context) => RegionListCubit(injector.get()),
        );

  static Widget _buildItem(BuildContext context, MineRegionModel region) {
    return XkCard(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routers.mineAreaList,
          arguments: region,
        );
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            const Icon(Icons.map_outlined, size: 22, color: XelaColor.Gray3),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                region.regionName ?? '',
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
      ),
    );
  }
}

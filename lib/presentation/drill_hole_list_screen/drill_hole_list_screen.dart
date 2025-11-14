import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/models/drill_hole_model.dart';
import 'package:bnv_opendata/presentation/drill_hole_list_screen/cubit/drill_hole_list_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrillHoleListScreen extends StatelessWidget {
  const DrillHoleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrillHoleListCubit()..fetchHoleList(),
      child: AppScaffold(
        title: AppS.of(context).query_drill_hole,
        body: const _HoleListBody(),
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
      ),
    );
  }
}

class _HoleListBody extends StatelessWidget {
  const _HoleListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrillHoleListCubit, DrillHoleListState>(
      builder: (context, state) {
        return Column(
          children: [
            XelaTextField(
              placeholder: 'Tìm kiếm theo mã, vị trí..',
              leftIcon:
                  const Icon(Icons.search, size: 20, color: XelaColor.Gray2),
              background: Colors.transparent,
              // borderFocusColor: AppTheme.getInstance().primaryColor(),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _DrillHoleItemWidget(
                    drillHole: state.data?[index],
                  );
                },
                separatorBuilder: (ctx, ind) {
                  return const SizedBox(
                    height: 24,
                  );
                },
                itemCount: state.data?.length ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DrillHoleItemWidget extends StatelessWidget {
  const _DrillHoleItemWidget({super.key, this.drillHole});

  final DrillHoleModel? drillHole;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            drillHole?.holeName ?? '',
            style: XelaTextStyle.XelaBodyBold.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          Text(
            '${drillHole?.mine?.mineName} - ${drillHole?.description}',
            style: XelaTextStyle.XelaCaption.apply(color: XelaColor.Gray6),
          ),
          const SizedBox(height: 8),
          // Text(
          //   '${AppS.of(context).status}: ${mineModel?.status?.title}',
          //   style: XelaTextStyle.XelaSmallBodyBold.apply(
          //     color: _getStatusColor(mineModel?.status),
          //   ),
        ],
      ),
    );
  }

// Color _getStatusColor(MineStatusEnum? status) {
//   switch (status) {
//     case MineStatusEnum.active:
//       return AppTheme.getInstance().primaryColor();
//     case MineStatusEnum.pause:
//       return XelaColor.Orange6;
//     case MineStatusEnum.inactive:
//       return XelaColor.Gray7;
//     default:
//       return XelaColor.Gray7;
//   }
// }
}

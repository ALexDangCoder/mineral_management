import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:bnv_opendata/presentation/mine_list_screen/cubit/mine_list_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/utils/constants/enums/mine_status_enum.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineListScreen extends StatelessWidget {
  const MineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MineListCubit()..fetchDataMineList(),
      child: AppScaffold(
        title: AppS.of(context).mine_list,
        body: const _MineListBody(),
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
      ),
    );
  }
}

class _MineListBody extends StatelessWidget {
  const _MineListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineListCubit, MineListState>(
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _MineItemWidget(
              mineModel: state.data?[index],
            );
          },
          separatorBuilder: (ctx, ind) {
            return const SizedBox(
              height: 24,
            );
          },
          itemCount: state.data?.length ?? 0,
        );
      },
    );
  }
}

class _MineItemWidget extends StatelessWidget {
  const _MineItemWidget({this.mineModel});

  final MineModel? mineModel;

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
            mineModel?.mineName ?? '',
            style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
          ),
          const SizedBox(height: 8),
          Text(
            '${AppS.of(context).mineral_type}: ${mineModel?.mineralType}',
            style: XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6),
          ),
          const SizedBox(height: 8),
          Text(
            '${AppS.of(context).status}: ${mineModel?.status?.title}',
            style: XelaTextStyle.xelaSmallBodyBold.apply(
              color: _getStatusColor(mineModel?.status),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(MineStatusEnum? status) {
    switch (status) {
      case MineStatusEnum.active:
        return AppTheme.getInstance().primaryColor();
      case MineStatusEnum.pause:
        return XelaColor.Orange6;
      case MineStatusEnum.inactive:
        return XelaColor.Gray7;
      default:
        return XelaColor.Gray7;
    }
  }
}

import 'package:bnv_opendata/presentation/drill_hole_list_screen/cubit/drill_hole_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrillHoleListScreen extends StatelessWidget {
  const DrillHoleListScreen({
    super.key,
    required this.siteId,
  });

  final String siteId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrillHoleListCubit(siteId: siteId)..init(),
      child: const AppScaffold(
        title: 'Danh sách lỗ khoan',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _DrillHoleListBody(),
      ),
    );
  }
}

class _DrillHoleListBody extends StatelessWidget {
  const _DrillHoleListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrillHoleListCubit, DrillHoleListState>(
      builder: (context, state) {
        return Column(
          children: [
            XkSearchField(
              placeholder: 'Tìm theo mã/tên lỗ khoan',
              onChanged: context.read<DrillHoleListCubit>().onSearchChanged,
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildContent(context, state)),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, DrillHoleListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không có lỗ khoan phù hợp.',
          onRetry: context.read<DrillHoleListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<DrillHoleListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<DrillHoleListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.filteredHoles.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              final hole = state.filteredHoles[index];
              return XkCard(
                onTap: () =>
                    MineFlowRoutes.pushDrillHoleDetail(context, hole.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${hole.code} - ${hole.name}',
                            style: XelaTextStyle.xelaBodyBold
                                .apply(color: XelaColor.Gray2),
                          ),
                        ),
                        XkStatusChip(
                            text: hole.status,
                            color: _statusColor(hole.status)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Khoáng sản: ${hole.mineral}',
                      style: XelaTextStyle.xelaSmallBody
                          .apply(color: XelaColor.Gray6),
                    ),
                    const SizedBox(height: 8),
                    XkActionButton(
                      text: 'Xem hồ sơ',
                      onTap: () =>
                          MineFlowRoutes.pushDrillHoleDetail(context, hole.id),
                    ),
                  ],
                ),
              );
            },
          ),
        );
    }
  }

  Color _statusColor(String value) {
    final normalized = value.toLowerCase();
    if (normalized.contains('hoàn thành')) {
      return XelaColor.Green1;
    }
    if (normalized.contains('tạm dừng')) {
      return XelaColor.Orange6;
    }
    if (normalized.contains('kế hoạch')) {
      return XelaColor.Gray7;
    }
    return XelaColor.Blue6;
  }
}

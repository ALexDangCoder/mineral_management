import 'package:bnv_opendata/presentation/drill_hole_detail/cubit/drill_hole_detail_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrillHoleDetailScreen extends StatelessWidget {
  const DrillHoleDetailScreen({
    super.key,
    required this.drillHoleId,
  });

  final String drillHoleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrillHoleDetailCubit(drillHoleId: drillHoleId)..init(),
      child: const AppScaffold(
        title: 'Chi tiet lo khoan',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _DrillHoleDetailBody(),
      ),
    );
  }
}

class _DrillHoleDetailBody extends StatelessWidget {
  const _DrillHoleDetailBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrillHoleDetailCubit, DrillHoleDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case MineScreenStatus.initial:
          case MineScreenStatus.loading:
            return const XkSkeletonList(itemCount: 2);
          case MineScreenStatus.empty:
            return XkEmptyState(
              message: state.errorMessage ?? 'Dữ liệu trống.',
              onRetry: context.read<DrillHoleDetailCubit>().retry,
            );
          case MineScreenStatus.failure:
            return XkErrorState(
              message: state.errorMessage ?? 'Đã xảy ra lỗi.',
              onRetry: context.read<DrillHoleDetailCubit>().retry,
            );
          case MineScreenStatus.success:
            final hole = state.drillHole!;
            final siteName = state.site?.name ?? '—';
            return RefreshIndicator(
              onRefresh: context.read<DrillHoleDetailCubit>().refresh,
              child: ListView(
                children: [
                  XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const XkSectionHeader(title: 'Thông tin lỗ khoan'),
                        const SizedBox(height: 10),
                        const XkSectionDivider(),
                        const SizedBox(height: 10),
                        XkLabelValueRow(
                            label: 'Tên lỗ khoan', value: hole.name),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Mã lỗ khoan', value: hole.code),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Khu mỏ', value: siteName),
                        const SizedBox(height: 8),
                        XkLabelValueRow(
                            label: 'Khoáng sản', value: hole.mineral),
                        const SizedBox(height: 8),
                        XkLabelValueRow(
                            label: 'Ngày khởi công', value: hole.startDate),
                        const SizedBox(height: 8),
                        XkLabelValueRow(
                            label: 'Ngày kết thúc', value: hole.endDate),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Giai đoạn', value: hole.stage),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'X', value: hole.coordinateX),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Y', value: hole.coordinateY),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Z', value: hole.coordinateZ),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Chiều sâu', value: hole.depth),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Độ cao', value: hole.elevation),
                        const SizedBox(height: 10),
                        XkActionButton(
                          text: 'Hồ sơ lỗ khoan',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Mở ${hole.profileDocument}')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}

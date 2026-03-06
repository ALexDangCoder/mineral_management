import 'package:bnv_opendata/presentation/closure_plan_detail/cubit/closure_plan_detail_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClosurePlanDetailScreen extends StatelessWidget {
  const ClosurePlanDetailScreen({
    super.key,
    required this.planId,
  });

  final String planId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClosurePlanDetailCubit(planId: planId)..init(),
      child: const AppScaffold(
        title: 'Chi tiết đề án đóng cửa',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _ClosurePlanDetailBody(),
      ),
    );
  }
}

class _ClosurePlanDetailBody extends StatelessWidget {
  const _ClosurePlanDetailBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClosurePlanDetailCubit, ClosurePlanDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case MineScreenStatus.initial:
          case MineScreenStatus.loading:
            return const XkSkeletonList(itemCount: 2);
          case MineScreenStatus.empty:
            return XkEmptyState(
              message: state.errorMessage ?? 'Dữ liệu trống.',
              onRetry: context.read<ClosurePlanDetailCubit>().retry,
            );
          case MineScreenStatus.failure:
            return XkErrorState(
              message: state.errorMessage ?? 'Đã xảy ra lỗi.',
              onRetry: context.read<ClosurePlanDetailCubit>().retry,
            );
          case MineScreenStatus.success:
            final plan = state.plan!;
            final siteName = state.site?.name ?? '—';
            final firstDocument =
                plan.documents.isEmpty ? '—' : plan.documents.first.name;
            return RefreshIndicator(
              onRefresh: context.read<ClosurePlanDetailCubit>().refresh,
              child: ListView(
                children: [
                  XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const XkSectionHeader(title: 'Thông tin đề án'),
                        const SizedBox(height: 10),
                        const XkSectionDivider(),
                        const SizedBox(height: 10),
                        XkLabelValueRow(
                            label: 'Tên công trình', value: plan.projectName),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Tên đề án', value: plan.name),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Khu mỏ', value: siteName),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Giai đoạn', value: plan.stage),
                        const SizedBox(height: 8),
                        XkLabelValueRow(
                            label: 'Trạng thái', value: plan.status),
                        const SizedBox(height: 8),
                        XkLabelValueRow(label: 'Ghi chú', value: plan.note),
                        const SizedBox(height: 8),
                        XkLabelValueRow(
                            label: 'Tài liệu', value: firstDocument),
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

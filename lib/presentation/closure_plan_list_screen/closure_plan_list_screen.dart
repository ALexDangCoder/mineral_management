import 'package:bnv_opendata/presentation/closure_plan_list_screen/cubit/closure_plan_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClosurePlanListScreen extends StatelessWidget {
  const ClosurePlanListScreen({
    super.key,
    required this.siteId,
  });

  final String siteId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClosurePlanListCubit(siteId: siteId)..init(),
      child: const AppScaffold(
        title: 'Kế hoạch đóng cửa',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _ClosurePlanListBody(),
      ),
    );
  }
}

class _ClosurePlanListBody extends StatelessWidget {
  const _ClosurePlanListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClosurePlanListCubit, ClosurePlanListState>(
      builder: (context, state) {
        return Column(
          children: [
            XkSearchField(
              placeholder: 'Tìm theo mã/tên đề án',
              onChanged: context.read<ClosurePlanListCubit>().onSearchChanged,
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildContent(context, state)),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ClosurePlanListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không có đề án đóng cửa phù hợp.',
          onRetry: context.read<ClosurePlanListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<ClosurePlanListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<ClosurePlanListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.filteredPlans.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              final plan = state.filteredPlans[index];
              return XkCard(
                onTap: () =>
                    MineFlowRoutes.pushClosurePlanDetail(context, plan.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${plan.code} - ${plan.name}',
                            style: XelaTextStyle.xelaBodyBold
                                .apply(color: XelaColor.Gray2),
                          ),
                        ),
                        XkStatusChip(
                          text: plan.status,
                          color: _statusColor(plan.status),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plan.stage,
                      style: XelaTextStyle.xelaSmallBody
                          .apply(color: XelaColor.Gray6),
                    ),
                    const SizedBox(height: 8),
                    XkActionButton(
                      text: 'Xem hồ sơ',
                      onTap: () => MineFlowRoutes.pushClosurePlanDetail(
                          context, plan.id),
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
    if (normalized.contains('thực hiện')) {
      return XelaColor.Green1;
    }
    if (normalized.contains('chờ')) {
      return XelaColor.Orange6;
    }
    return XelaColor.Blue6;
  }
}

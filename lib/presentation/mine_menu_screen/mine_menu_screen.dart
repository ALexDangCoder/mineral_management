import 'package:bnv_opendata/presentation/mine_menu_screen/cubit/mine_menu_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineMenuScreen extends StatelessWidget {
  const MineMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MineMenuCubit()..init(),
      child: AppScaffold(
        title: 'Vùng mỏ',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        showBackButton: false,
        body: BlocBuilder<MineMenuCubit, MineMenuState>(
          builder: (context, state) => _buildContent(context, state),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, MineMenuState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList(itemCount: 3);
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Chưa có danh mục vùng mỏ.',
          onRetry: context.read<MineMenuCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<MineMenuCubit>().retry,
        );
      case MineScreenStatus.success:
        return ListView.separated(
          itemCount: state.items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final item = state.items[index];
            VoidCallback? onTap;
            switch (item.id) {
              case MineMenuItemId.originalDocument:
                onTap = () => MineFlowRoutes.pushMineList(context);
                break;
              case MineMenuItemId.geologicalReport:
                onTap = () => MineFlowRoutes.pushGeologicalReportList(context);
                break;
              case MineMenuItemId.planOrProposal:
                onTap = () => MineFlowRoutes.pushProposalPlanList(context);
                break;
            }
            return _MenuItem(
              label: item.label,
              onTap: onTap,
            );
          },
        );
    }
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return XkCard(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.map_outlined, size: 22, color: XelaColor.Gray3),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
            ),
          ),
        ],
      ),
    );
  }
}

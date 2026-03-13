import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/proposal_plan_list_screen/cubit/proposal_plan_list_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProposalPlanListScreen extends StatelessWidget {
  const ProposalPlanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProposalPlanListCubit()..init(),
      child: const AppScaffold(
        title: 'Danh sách đề án',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _ProposalPlanListBody(),
      ),
    );
  }
}

class _ProposalPlanListBody extends StatelessWidget {
  const _ProposalPlanListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProposalPlanListCubit, ProposalPlanListState>(
      builder: (context, state) {
        return Column(
          children: [
            XkSearchField(
              placeholder: 'Tìm kiếm theo mã hoặc tên đề án',
              onChanged: context.read<ProposalPlanListCubit>().onSearchChanged,
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildContent(context, state)),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ProposalPlanListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không tìm thấy đề án phù hợp.',
          onRetry: context.read<ProposalPlanListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<ProposalPlanListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<ProposalPlanListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.filteredPlans.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              final plan = state.filteredPlans[index];
              return XkCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          size: 20,
                          color: XelaColor.Gray6,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            plan.code,
                            style: XelaTextStyle.xelaBodyBold
                                .apply(color: XelaColor.Gray2),
                          ),
                        ),
                        Text(
                          plan.status,
                          style: XelaTextStyle.xelaBody
                              .apply(color: XelaColor.Gray4),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plan.name,
                      style:
                          XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plan.mineSite,
                      style:
                          XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plan.mineral,
                      style:
                          XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tiến độ thi công',
                      style: XelaTextStyle.xelaBodyBold
                          .apply(color: XelaColor.Blue6),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tiến độ thanh toán',
                      style: XelaTextStyle.xelaBodyBold
                          .apply(color: XelaColor.Blue6),
                    ),
                  ],
                ),
              );
            },
          ),
        );
    }
  }
}

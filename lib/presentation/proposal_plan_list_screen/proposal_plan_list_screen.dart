import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/proposal_plan_list_screen/cubit/proposal_plan_list_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProposalPlanListScreen extends StatelessWidget {
  const ProposalPlanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProposalPlanListCubit(
        injector.get(),
      )..init(),
      child: const AppScaffold(
        title: 'Danh sách đề án',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _ProposalPlanListBody(),
      ),
    );
  }
}

class _ProposalPlanListBody extends StatefulWidget {
  const _ProposalPlanListBody();

  @override
  State<_ProposalPlanListBody> createState() => _ProposalPlanListBodyState();
}

class _ProposalPlanListBodyState extends State<_ProposalPlanListBody> {
  final _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final cubit = context.read<ProposalPlanListCubit>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProposalPlanListCubit, ProposalPlanListState>(
      builder: (context, state) {
        return Column(
          children: [
            XelaTextField(
              placeholder: 'Tìm kiếm theo mã hoặc tên đề án',
              leftIcon: const Icon(
                Icons.search,
                size: 20,
                color: XelaColor.Gray6,
              ),
              rightIcon: _searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        _searchController.clear();
                        context
                            .read<ProposalPlanListCubit>()
                            .onSearchChanged('');
                      },
                      child: const Icon(
                        Icons.clear,
                      ),
                    )
                  : null,
              onChange: (value) {
                context.read<ProposalPlanListCubit>().onSearchChanged(value);
              },
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<ProposalPlanListCubit>().onSearchChanged(
                      value,
                    );
              },
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
            itemCount: state.plans.length + 1,
            controller: _scrollController,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              if (index < state.plans.length) {
                final plan = state.plans[index];
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
                              plan.projectId ?? 'N/A',
                              style: XelaTextStyle.xelaBodyBold
                                  .apply(color: XelaColor.Gray2),
                            ),
                          ),
                          Text(
                            plan.status.toString(),
                            style: XelaTextStyle.xelaBody
                                .apply(color: XelaColor.Gray4),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        plan.projectName ?? 'N/A',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        plan.mineName ?? 'N/A',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        plan.areaName ?? 'N/A',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
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
              } else {
                if (state.isLoadingMore == true) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox();
                }
              }
            },
          ),
        );
    }
  }
}

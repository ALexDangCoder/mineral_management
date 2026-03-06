import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/mine_sub_list_screen/cubit/mine_sub_list_cubit.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineSubListScreen extends StatelessWidget {
  const MineSubListScreen({
    super.key,
    required this.regionId,
  });

  final String regionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MineSubListCubit(regionId: regionId)..init(),
      child: const AppScaffold(
        title: 'Danh sách khu mỏ',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _MineSubListBody(),
      ),
    );
  }
}

class _MineSubListBody extends StatelessWidget {
  const _MineSubListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineSubListCubit, MineSubListState>(
      builder: (context, state) {
        return Column(
          children: [
            XkSearchField(
              placeholder: 'Tìm theo tên/Khu mỏ',
              onChanged: context.read<MineSubListCubit>().onSearchChanged,
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildContent(context, state)),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, MineSubListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không có khu mỏ nào phù hợp.',
          onRetry: context.read<MineSubListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<MineSubListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<MineSubListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.filteredSites.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              final site = state.filteredSites[index];
              return XkCard(
                onTap: () =>
                    MineFlowRoutes.pushMineSiteDetail(context, site.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${site.code} - ${site.name}',
                      style: XelaTextStyle.xelaBodyBold
                          .apply(color: XelaColor.Gray2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Địa điểm: ${site.location}',
                      style: XelaTextStyle.xelaSmallBody
                          .apply(color: XelaColor.Gray6),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Đơn vị: ${site.organization}',
                      style: XelaTextStyle.xelaSmallBody
                          .apply(color: XelaColor.Gray6),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Khoáng sản: ${site.mineral}',
                      style: XelaTextStyle.xelaCaption
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

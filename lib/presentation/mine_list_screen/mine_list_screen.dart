import 'package:bnv_opendata/presentation/mine_list_screen/cubit/mine_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineListScreen extends StatelessWidget {
  const MineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MineListCubit()..init(),
      child: const AppScaffold(
        title: 'Vùng mỏ',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _MineListBody(),
      ),
    );
  }
}

class _MineListBody extends StatelessWidget {
  const _MineListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineListCubit, MineListState>(
      builder: (context, state) => _buildContent(context, state),
    );
  }

  Widget _buildContent(BuildContext context, MineListState state) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không tìm thấy vùng mỏ phù hợp.',
          onRetry: context.read<MineListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<MineListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<MineListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.regions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final region = state.regions[index];
              final isExpanded = state.expandedRegionId == region.id;

              return _RegionAccordionCard(
                regionName: region.name,
                isExpanded: isExpanded,
                onTapHeader: () => context.read<MineListCubit>().toggleRegion(
                      region.id,
                    ),
                child: _buildRegionContent(context, state, region.id),
              );
            },
          ),
        );
    }
  }

  Widget _buildRegionContent(
    BuildContext context,
    MineListState state,
    String regionId,
  ) {
    if (state.loadingRegionIds.contains(regionId)) {
      return const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    final siteError = state.regionSiteErrors[regionId];
    if (siteError != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text(
          siteError,
          style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Red4),
        ),
      );
    }

    final sites = state.sitesByRegion[regionId] ?? const [];
    if (sites.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text(
          'Không có khu mỏ.',
          style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          const XkSectionDivider(),
          const SizedBox(height: 10),
          ...sites.map(
            (site) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () => MineFlowRoutes.pushMineSiteDetail(context, site.id),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: XelaColor.Gray12,
                    border: Border.all(color: XelaColor.Gray11),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.map_outlined,
                        size: 18,
                        color: XelaColor.Gray5,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          site.name,
                          style: XelaTextStyle.xelaSmallBodyBold
                              .apply(color: XelaColor.Gray2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegionAccordionCard extends StatelessWidget {
  const _RegionAccordionCard({
    required this.regionName,
    required this.isExpanded,
    required this.onTapHeader,
    required this.child,
  });

  final String regionName;
  final bool isExpanded;
  final VoidCallback onTapHeader;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return XkCard(
      onTap: onTapHeader,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.map_outlined, size: 22, color: XelaColor.Gray3),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  regionName,
                  style: XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Gray2),
                ),
              ),
              Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 22,
                color: XelaColor.Gray5,
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: child,
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

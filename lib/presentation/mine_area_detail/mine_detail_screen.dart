import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/mine_area_detail/cubit'
    '/mine_site_detail_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/mine_flow_routes.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MineSiteDetailScreen extends StatelessWidget {
  const MineSiteDetailScreen({
    super.key,
    required this.areaId,
  });

  final String areaId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MineSiteDetailCubit(
        injector.get(),
      )..init(areaId),
      child: const AppScaffold(
        title: 'Chi tiết khu mỏ',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _MineSiteDetailBody(),
      ),
    );
  }
}

class _MineSiteDetailBody extends StatelessWidget {
  const _MineSiteDetailBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MineSiteDetailCubit, MineSiteDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case MineScreenStatus.initial:
          case MineScreenStatus.loading:
            return const XkSkeletonList(itemCount: 3);
          case MineScreenStatus.empty:
            return XkEmptyState(
              message: state.errorMessage ?? 'Dữ liệu trống.',
              onRetry: context.read<MineSiteDetailCubit>().retry,
            );
          case MineScreenStatus.failure:
            return XkErrorState(
              message: state.errorMessage ?? 'Đã xảy ra lỗi.',
              onRetry: context.read<MineSiteDetailCubit>().retry,
            );
          case MineScreenStatus.success:
            final mineArea = state.mineAreaModel!;
            return RefreshIndicator(
              onRefresh: context.read<MineSiteDetailCubit>().refresh,
              child: ListView(
                children: [
                  XkHeroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chi tiết mỏ',
                          style: XelaTextStyle.xelaSubheadline.apply(
                            color: Colors.white.withOpacity(0.9),
                            fontWeightDelta: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          mineArea.areaName ?? 'N/A',
                          style: XelaTextStyle.xelaHeadline.apply(
                            color: Colors.white,
                            fontWeightDelta: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Mã: ${mineArea.areaId ?? 'N/A'}',
                          style: XelaTextStyle.xelaSmallBody.apply(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _buildHeroStat('Trạng thái', mineArea.status.toString()),
                            const SizedBox(width: 24),
                            _buildHeroStat('Diện tích', 'N/A'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const XkSectionHeader(title: 'Dữ liệu chuyên đề'),
                        const SizedBox(height: 12),
                        XkPrimaryButton(
                          text: 'Xem lỗ khoan',
                          onTap: () => MineFlowRoutes.pushDrillHoleList(
                              context, mineArea.areaId ?? ''),
                        ),
                        const SizedBox(height: 10),
                        XkPrimaryButton(
                          text: 'Kế hoạch đóng cửa',
                          onTap: () => MineFlowRoutes.pushClosurePlanList(
                              context, mineArea.areaId ?? ''),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XkSectionHeader(title: 'Dữ liệu ảnh'),
                        SizedBox(height: 10),
                        // ...mineArea.imageCategoryCounts.entries.map((entry) {
                        //   final isDrill =
                        //       entry.key.toLowerCase().contains('lỗ khoan');
                        //   return Padding(
                        //     padding: const EdgeInsets.only(bottom: 8),
                        //     child: XkCard(
                        //       onTap: isDrill
                        //           ? () => MineFlowRoutes.pushDrillHoleList(
                        //               context, mineArea.id)
                        //           : null,
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 12, vertical: 10),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             child: Text(
                        //               entry.key,
                        //               style: XelaTextStyle.xelaBody
                        //                   .apply(color: XelaColor.Gray2),
                        //             ),
                        //           ),
                        //           Text(
                        //             '${entry.value}',
                        //             style: XelaTextStyle.xelaBodyBold
                        //                 .apply(color: XelaColor.Blue6),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   );
                        // }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XkSectionHeader(title: 'Dữ liệu số'),
                        SizedBox(height: 10),
                        // ...mineArea.digitalDocuments
                        //     .map((doc) => _DocumentItem(document: doc)),
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

  Widget _buildHeroStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: XelaTextStyle.xelaCaption.apply(
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: XelaTextStyle.xelaSmallBodyBold.apply(color: Colors.white),
        ),
      ],
    );
  }
}

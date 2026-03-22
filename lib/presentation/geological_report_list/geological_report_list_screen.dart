import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/presentation/geological_report_list/cubit/geological_report_list_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeologicalReportListScreen extends StatelessWidget {
  const GeologicalReportListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeologicalReportListCubit(
        injector.get(),
      )..init(),
      child: const AppScaffold(
        title: 'Danh sách báo cáo địa chất',
        bgColor: XelaColor.Gray12,
        appBarColor: XelaColor.Gray12,
        body: _GeologicalReportListBody(),
      ),
    );
  }
}

class _GeologicalReportListBody extends StatefulWidget {
  const _GeologicalReportListBody();

  @override
  State<_GeologicalReportListBody> createState() =>
      _GeologicalReportListBodyState();
}

class _GeologicalReportListBodyState extends State<_GeologicalReportListBody> {
  final _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final cubit = context.read<GeologicalReportListCubit>();

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
    return BlocBuilder<GeologicalReportListCubit, GeologicalReportListState>(
      builder: (context, state) {
        return Column(
          children: [
            XelaTextField(
              placeholder: 'Tìm kiếm báo cáo địa chất',
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
                            .read<GeologicalReportListCubit>()
                            .onSearchChanged('');
                      },
                      child: const Icon(
                        Icons.clear,
                      ),
                    )
                  : null,
              onChange: (value) {
                context
                    .read<GeologicalReportListCubit>()
                    .onSearchChanged(value);
              },
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<GeologicalReportListCubit>().onSearchChanged(
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

  Widget _buildContent(
    BuildContext context,
    GeologicalReportListState state,
  ) {
    switch (state.status) {
      case MineScreenStatus.initial:
      case MineScreenStatus.loading:
        return const XkSkeletonList();
      case MineScreenStatus.empty:
        return XkEmptyState(
          message: 'Không tìm thấy báo cáo địa chất phù hợp.',
          onRetry: context.read<GeologicalReportListCubit>().retry,
        );
      case MineScreenStatus.failure:
        return XkErrorState(
          message: state.errorMessage ?? 'Đã xảy ra lỗi.',
          onRetry: context.read<GeologicalReportListCubit>().retry,
        );
      case MineScreenStatus.success:
        return RefreshIndicator(
          onRefresh: context.read<GeologicalReportListCubit>().refresh,
          child: ListView.separated(
            itemCount: state.reports.length + 1,
            controller: _scrollController,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) {
              if (index < state.reports.length) {
                final report = state.reports[index];
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
                              report.reportId ?? '',
                              style: XelaTextStyle.xelaBodyBold
                                  .apply(color: XelaColor.Gray2),
                            ),
                          ),
                          Text(
                            report.reviewStatus.toString(),
                            style: XelaTextStyle.xelaBody
                                .apply(color: XelaColor.Gray4),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        report.reportName ?? '',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        report.reportingUnit ?? 'N/A',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        report.approvalUnit ?? 'N?A',
                        style: XelaTextStyle.xelaBody
                            .apply(color: XelaColor.Gray2),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Xem hồ sơ',
                          style: XelaTextStyle.xelaBodyBold
                              .apply(color: XelaColor.Blue6),
                        ),
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

import 'package:bnv_opendata/dependencies/app_dependenies.dart';
import 'package:bnv_opendata/domain/repositories/main_mine_repository.dart';
import 'package:bnv_opendata/presentation/closure_plan_detail/cubit/closure_plan_detail_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClosurePlanDetailScreen extends StatelessWidget {
  const ClosurePlanDetailScreen({
    super.key,
    required this.planId,
  });

  final String planId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClosurePlanDetailCubit(
        planId: planId,
        repository: injector<MainMineRepository>(),
      )..init(),
      child: const AppScaffold(
        title: 'Chi tiết đề án đóng cửa mỏ',
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
            final dateFormat = DateFormat('dd/MM/yyyy');

            String formatDate(DateTime? date) =>
                date != null ? dateFormat.format(date) : '—';

            return RefreshIndicator(
              onRefresh: context.read<ClosurePlanDetailCubit>().refresh,
              child: ListView(
                children: [
                  XkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XkLabelValueRow(
                          label: 'Mã đề án',
                          value: plan.closurePlanId ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Tên đề án',
                          value: plan.closurePlanName ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Giấy phép khai thác',
                          value: plan.exploitLicenseId ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày cấp',
                          value: formatDate(plan.approvalDateDA),
                        ),
                        XkLabelValueRow(
                          label: 'Ngày hết hạn',
                          value: formatDate(plan.expirationDate),
                        ),
                        XkLabelValueRow(
                          label: 'Quyết định phê duyệt đề án',
                          value: plan.approvalDecisionDA ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày phê duyệt',
                          value: formatDate(plan.approvalDateDA),
                        ),
                        XkLabelValueRow(
                          label: 'Đơn vị phê duyệt',
                          value: plan.approvalUnitDA ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Thời gian thực hiện (năm)',
                          value: plan.executionYear?.toString() ?? '0',
                        ),
                        const XkLabelValueRow(
                          label: 'Thời gian thực hiện (tháng)',
                          value: '0',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày hết hạn',
                          value: formatDate(plan.expirationDate),
                        ),
                        XkLabelValueRow(
                          label: 'Quyết định phê duyệt đóng cửa',
                          value: plan.approvalDecisionDCM ?? '—',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày phê duyệt',
                          value: formatDate(plan.approvalDateDCM),
                        ),
                        const XkLabelValueRow(
                          label: 'Đơn vị phê duyệt',
                          value: 'Hội đồng phê duyệt',
                        ),
                        XkLabelValueRow(
                          label: 'Trạng thái',
                          value: plan.status == 1
                              ? 'Đã đóng cửa mỏ'
                              : 'Chưa đóng cửa mỏ',
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            // TODO: Handle view document
                          },
                          child: Text(
                            'Xem hồ sơ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
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

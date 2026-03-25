import 'package:bnv_opendata/domain/repositories/repository_exports.dart';
import 'package:bnv_opendata/presentation/mine_mining_project/cubit/mine_mining_project_detail_cubit.dart';
import 'package:bnv_opendata/presentation/mine_shared/cubit_status.dart';
import 'package:bnv_opendata/presentation/mine_shared/widgets/xk_components.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MineMiningProjectDetailScreen extends StatelessWidget {
  const MineMiningProjectDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MineMiningProjectDetailCubit(
        GetIt.I<MainMineRepository>(),
      )..init(id),
      child: AppScaffold(
        title: 'Chi tiết dự án khai thác',
        body: BlocBuilder<MineMiningProjectDetailCubit, MineMiningProjectDetailState>(
          builder: (context, state) {
            if (state.status == MineScreenStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == MineScreenStatus.failure) {
              return XkErrorState(
                message: state.errorMessage ?? 'Có lỗi xảy ra',
                onRetry: () => context.read<MineMiningProjectDetailCubit>().fetch(),
              );
            }

            final data = state.miningProject;
            if (data == null) {
              return XkEmptyState(
                message: 'Không tìm thấy thông tin dự án',
                onRetry: () => context.read<MineMiningProjectDetailCubit>().fetch(),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  XkCard(
                    child: Column(
                      children: [
                        XkLabelValueRow(
                          label: 'Mã dự án',
                          value: data.miningId ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Tên dự án',
                          value: data.miningName ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Khu mỏ',
                          value: data.areaId ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Khoáng sản',
                          value: data.mineralName ?? data.mineralId ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Giấy phép khai thác',
                          value: data.permitId != null ? 'số: ${data.permitId}' : '',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày bắt đầu dự kiến',
                          value: data.expectedStartDate ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày kết thúc dự kiến',
                          value: data.expectedEndDate ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Ngày bắt đầu thực tế',
                          value: data.actualStartDate ?? '',
                        ),
                        XkLabelValueRow(
                          label: 'Công suất thiết kế',
                          value: '${data.designedCapacity ?? 0}',
                        ),
                        XkLabelValueRow(
                          label: 'Trữ lượng dự kiến',
                          value: '${data.expectedReserve ?? 0}',
                        ),
                        XkLabelValueRow(
                          label: 'Tổng mức đầu tư',
                          value: '${data.totalInvestment ?? 0}',
                        ),
                        XkLabelValueRow(
                          label: 'Trạng thái',
                          value: _getStatusText(data.status),
                        ),
                        XkLabelValueRow(
                          label: 'Tiến độ hoàn thành',
                          value: '${data.completionRate ?? 0}%',
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              // Xem hồ sơ action
                            },
                            child: const Text(
                              'Xem hồ sơ',
                              style: TextStyle(
                                color: XelaColor.Blue5,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getStatusText(int? status) {
    switch (status) {
      case 0:
        return 'Đang thi công';
      case 1:
        return 'Đang vận hành';
      case 2:
        return 'Đã hoàn thành';
      default:
        return 'Không xác định';
    }
  }
}

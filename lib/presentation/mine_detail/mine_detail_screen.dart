import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/models/mine_model.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/utils/constants/enums/mine_status_enum.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class MineDetailScreen extends StatelessWidget {
  const MineDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nhận arguments từ màn hình trước
    final args = ModalRoute.of(context)?.settings.arguments;
    MineModel? mineModel;
    Map<String, dynamic>? additionalData;

    if (args is MineModel) {
      mineModel = args;
    } else if (args is Map) {
      mineModel = args['mineModel'] as MineModel?;
      additionalData = Map<String, dynamic>.from(args);
    }

    // Dữ liệu mẫu (trong thực tế sẽ lấy từ API)
    final location = additionalData?['location'] ?? 'Xã A, Huyện B, Tỉnh C';
    final area = additionalData?['area'] ?? '500 ha';
    final reserves = additionalData?['reserves'] ?? '1,250,000 tấn';
    final initialReserves =
        additionalData?['initialReserves'] ?? '2,000,000 tấn';
    final exploitedReserves =
        additionalData?['exploitedReserves'] ?? '750,000 tấn';
    final remainingReserves =
        additionalData?['remainingReserves'] ?? '1,250,000 tấn';
    final coordinates =
        additionalData?['coordinates'] ?? '21.0285°N, 105.8542°E';
    final attachedFiles = additionalData?['attachedFiles'] as List<String>? ??
        [
          'Giấy phép khai thác số 123/2016.pdf',
          'Bản đồ địa chất.pdf',
          'Báo cáo đánh giá tác động môi trường.pdf',
        ];

    return AppScaffold(
      title: 'Chi tiết mỏ',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thông tin cơ bản
            _InfoSection(
              title: 'Thông tin cơ bản',
              children: [
                _InfoCard(
                  label: 'Tên mỏ',
                  value: mineModel?.mineName ?? 'N/A',
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Loại khoáng sản',
                  value: mineModel?.mineralType ?? 'N/A',
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Trạng thái',
                  value: mineModel?.status?.title ?? 'N/A',
                  valueColor: _getStatusColor(mineModel?.status),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Vị trí và diện tích
            _InfoSection(
              title: 'Vị trí và diện tích',
              children: [
                _InfoCard(
                  label: 'Vị trí',
                  value: location,
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Tọa độ',
                  value: coordinates,
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Diện tích',
                  value: area,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Trữ lượng
            _InfoSection(
              title: 'Trữ lượng',
              children: [
                _InfoCard(
                  label: 'Trữ lượng ban đầu',
                  value: initialReserves,
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Đã khai thác',
                  value: exploitedReserves,
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Còn lại',
                  value: remainingReserves,
                ),
                const SizedBox(height: 6),
                _InfoCard(
                  label: 'Tổng trữ lượng hiện tại',
                  value: reserves,
                  valueColor: AppTheme.getInstance().primaryColor(),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // File đính kèm
            _InfoSection(
              title: 'File đính kèm',
              children: [
                ...attachedFiles.map((fileName) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _FileItem(fileName: fileName),
                    )),
              ],
            ),

            const SizedBox(height: 16),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: XelaButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routers.mine3d,
                        arguments: mineModel,
                      );
                    },
                    text: 'Xem mô hình 3D',
                    background: AppTheme.getInstance().primaryColor(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: XelaButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routers.drillHoleList,
                        arguments: mineModel,
                      );
                    },
                    text: 'Xem lỗ khoan',
                    background: XelaColor.Gray11,
                    foregroundColor: XelaColor.Gray2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bgColor: XelaColor.Gray12,
      appBarColor: XelaColor.Gray12,
    );
  }

  Color _getStatusColor(MineStatusEnum? status) {
    switch (status) {
      case MineStatusEnum.active:
        return AppTheme.getInstance().primaryColor();
      case MineStatusEnum.pause:
        return XelaColor.Orange6;
      case MineStatusEnum.inactive:
        return XelaColor.Gray7;
      default:
        return XelaColor.Gray7;
    }
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: XelaTextStyle.xelaSubheadline.apply(
              color: XelaColor.Gray2,
            ),
          ),
          const SizedBox(height: 16),
          XelaDivider(),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoCard({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: XelaColor.Gray11,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: XelaTextStyle.xelaBodyBold.apply(
              color: XelaColor.Gray2,
            ),
          ),
          Text(
            value,
            style: XelaTextStyle.xelaSmallBody.apply(
              color: valueColor ?? XelaColor.Gray1,
            ),
          ),
        ],
      ),
    );
  }
}

class _FileItem extends StatelessWidget {
  final String fileName;

  const _FileItem({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement download/view file
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mở file: $fileName'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: XelaColor.Gray11,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: XelaColor.Gray10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: XelaColor.Blue11,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.description,
                color: XelaColor.Blue6,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                fileName,
                style: XelaTextStyle.xelaBody.apply(
                  color: XelaColor.Gray2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.download,
                color: XelaColor.Blue6,
                size: 20,
              ),
              onPressed: () {
                // TODO: Implement download
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tải file: $fileName'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

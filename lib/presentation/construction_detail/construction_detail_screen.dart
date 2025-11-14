import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ConstructionDetailScreen extends StatelessWidget {
  const ConstructionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nhận arguments từ màn hình trước
    final args = ModalRoute.of(context)?.settings.arguments;
    Map<String, dynamic>? data;

    if (args is Map) {
      data = Map<String, dynamic>.from(args);
    }

    // Dữ liệu mẫu (trong thực tế sẽ lấy từ API)
    final constructionName = data?['constructionName'] ?? 'Công trình đào CT-001';
    final mineName = data?['mineName'] ?? 'Mỏ A';
    final constructionType = data?['constructionType'] ?? 'Hầm lò';
    final status = data?['status'] ?? 'Đang thi công';
    final startDate = data?['startDate'] ?? '01/01/2024';
    final expectedEndDate = data?['expectedEndDate'] ?? '31/12/2024';
    final progress = data?['progress'] ?? '65%';
    final coordinates = data?['coordinates'] ?? '21.0285°N, 105.8542°E';
    final length = data?['length'] ?? '500 m';
    final width = data?['width'] ?? '5 m';
    final height = data?['height'] ?? '3 m';
    final designFiles = data?['designFiles'] as List<String>? ?? [
      'Bản vẽ thiết kế công trình CT-001.pdf',
      'Mặt cắt công trình.pdf',
      'Sơ đồ bố trí thiết bị.pdf',
    ];
    final attachedFiles = data?['attachedFiles'] as List<String>? ?? [
      'Báo cáo tiến độ thi công.pdf',
      'Hình ảnh hiện trạng.jpg',
      'Biên bản nghiệm thu.pdf',
    ];

    return AppScaffold(
      title: constructionName,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thông tin cơ bản
            _InfoSection(
              title: 'Thông tin cơ bản',
              children: [
                _InfoCard(
                  label: 'Tên công trình',
                  value: constructionName,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Mỏ',
                  value: mineName,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Loại công trình',
                  value: constructionType,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Trạng thái',
                  value: status,
                  valueColor: _getStatusColor(status),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Thông số kỹ thuật
            _InfoSection(
              title: 'Thông số kỹ thuật',
              children: [
                _InfoCard(
                  label: 'Chiều dài',
                  value: length,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Chiều rộng',
                  value: width,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Chiều cao',
                  value: height,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Vị trí và thời gian
            _InfoSection(
              title: 'Vị trí và thời gian',
              children: [
                _InfoCard(
                  label: 'Tọa độ',
                  value: coordinates,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Ngày bắt đầu',
                  value: startDate,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Dự kiến hoàn thành',
                  value: expectedEndDate,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Tiến độ',
                  value: progress,
                  valueColor: AppTheme.getInstance().primaryColor(),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Bản vẽ thiết kế
            _InfoSection(
              title: 'Bản vẽ thiết kế',
              children: [
                ...designFiles.map((fileName) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _FileItem(
                        fileName: fileName,
                        icon: Icons.architecture,
                        iconColor: XelaColor.Orange6,
                      ),
                    )),
              ],
            ),

            const SizedBox(height: 24),

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

            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: XelaButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routers.showConstructionMap,
                      );
                    },
                    text: 'Xem trên bản đồ',
                    background: AppTheme.getInstance().primaryColor(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: XelaButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Quay lại',
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'đã hoàn thành':
      case 'hoàn thành':
        return XelaColor.Green6;
      case 'đang thi công':
      case 'thi công':
        return AppTheme.getInstance().primaryColor();
      case 'chưa thực hiện':
      case 'chưa bắt đầu':
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
              fontWeightDelta: 1,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: XelaColor.Gray11,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: XelaTextStyle.xelaSubheadline.apply(
              color: XelaColor.Gray6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: XelaTextStyle.xelaBodyBold.apply(
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
  final IconData icon;
  final Color iconColor;

  const _FileItem({
    required this.fileName,
    this.icon = Icons.description,
    this.iconColor = XelaColor.Blue6,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement view file
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
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: iconColor,
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


import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/data/models/drill_hole_model.dart';
import 'package:bnv_opendata/presentation/widgets/app_scaffold.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class DrillHoleDetailScreen extends StatelessWidget {
  const DrillHoleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nhận arguments từ màn hình trước
    final args = ModalRoute.of(context)?.settings.arguments;
    DrillHoleModel? drillHole;
    Map<String, dynamic>? additionalData;

    if (args is DrillHoleModel) {
      drillHole = args;
    } else if (args is Map) {
      drillHole = args['drillHole'] as DrillHoleModel?;
      additionalData = Map<String, dynamic>.from(args);
    }

    // Dữ liệu mẫu (trong thực tế sẽ lấy từ API)
    final depth = additionalData?['depth'] ?? '150.5 m';
    final diameter = additionalData?['diameter'] ?? '76 mm';
    final coordinates = additionalData?['coordinates'] ?? '21.0285°N, 105.8542°E';
    final drillingDate = additionalData?['drillingDate'] ?? '15/03/2024';
    final completionDate = additionalData?['completionDate'] ?? '20/03/2024';
    final rockType = additionalData?['rockType'] ?? 'Đá vôi';
    final designFiles = additionalData?['designFiles'] as List<String>? ?? [
      'Bản vẽ thiết kế lỗ khoan DH-001.pdf',
      'Mặt cắt địa chất.pdf',
    ];
    final attachedFiles = additionalData?['attachedFiles'] as List<String>? ?? [
      'Báo cáo kết quả khoan.pdf',
      'Hình ảnh mẫu đá.jpg',
      'Dữ liệu đo địa vật lý.xlsx',
    ];

    return AppScaffold(
      title: drillHole?.holeName ?? 'Chi tiết lỗ khoan',
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
                  label: 'Mã lỗ khoan',
                  value: drillHole?.holeName ?? 'N/A',
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Mỏ',
                  value: drillHole?.mine?.mineName ?? 'N/A',
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Mô tả',
                  value: drillHole?.description ?? 'N/A',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Thông số kỹ thuật
            _InfoSection(
              title: 'Thông số kỹ thuật',
              children: [
                _InfoCard(
                  label: 'Độ sâu',
                  value: depth,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Đường kính',
                  value: diameter,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Loại đá',
                  value: rockType,
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
                  label: 'Ngày bắt đầu khoan',
                  value: drillingDate,
                ),
                const SizedBox(height: 14),
                _InfoCard(
                  label: 'Ngày hoàn thành',
                  value: completionDate,
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
                        Routers.mine3d,
                        arguments: {
                          'drillHoleId': drillHole?.holeId,
                          'drillHoleName': drillHole?.holeName,
                          'highlightHole': true,
                        },
                      );
                    },
                    text: 'Xem trên mô hình 3D',
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


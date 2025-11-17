import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/config/themes/app_theme.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String title;
  final String projectName;
  final DateTime startDate;
  final String budget;

  ProjectDetailScreen({
    super.key,
    String? title,
    String? projectName,
    DateTime? startDate,
    String? budget,
  })  : title = title ?? 'Chi tiết Dự án Khai thác',
        projectName = projectName ?? 'Dự án Mở rộng mỏ Thạch Khê GĐ 2',
        startDate = startDate ?? DateTime(2024, 1, 1),
        budget = budget ?? '500 tỷ VND';

  String _formatDate(DateTime d) => DateFormat('dd/MM/yyyy').format(d);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String finalProjectName = projectName;
    if (args is Map) {
      finalProjectName = args['projectName'] ?? projectName;
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          children: [
            Row(
              children: [
                RawMaterialButton(
                  elevation: 0,
                  focusElevation: 2,
                  highlightElevation: 0,
                  fillColor: Colors.transparent,
                  hoverElevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  constraints: const BoxConstraints(),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: XelaTextStyle.xelaHeadline.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: XelaDivider(),
            ),
            const SizedBox(height: 4),
            _InfoCard(label: 'Tên dự án', value: finalProjectName),
            const SizedBox(height: 14),
            _InfoCard(label: 'Ngày bắt đầu', value: _formatDate(startDate)),
            const SizedBox(height: 14),
            _InfoCard(label: 'Ngân sách', value: budget),
            const SizedBox(height: 24),
            // Button "Xem mô hình 3D"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: XelaButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routers.mine3d,
                    arguments: {
                      'projectName': finalProjectName,
                      'fromProjectDetail': true,
                    },
                  );
                },
                text: 'Xem mô hình 3D',
                background: AppTheme.getInstance().primaryColor(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCard({required this.label, required this.value});

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
            style: XelaTextStyle.xelaSubheadline,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: XelaTextStyle.xelaBodyBold,
          ),
        ],
      ),
    );
  }
}

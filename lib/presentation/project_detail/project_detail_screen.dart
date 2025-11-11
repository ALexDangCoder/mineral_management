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

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new),),
                Text(
                  title,
                  style: XelaTextStyle.XelaHeadline,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: XelaDivider(),
            ),
            const SizedBox(height: 4),
            _InfoCard(label: 'Tên dự án', value: projectName),
            const SizedBox(height: 14),
            _InfoCard(label: 'Ngày bắt đầu', value: _formatDate(startDate)),
            const SizedBox(height: 14),
            _InfoCard(label: 'Ngân sách', value: budget),
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
            style: XelaTextStyle.XelaSubheadline,
          ),
          const SizedBox(height: 8),
          Text(
            value,
              style: XelaTextStyle.XelaBodyBold,
          ),
        ],
      ),
    );
  }
}

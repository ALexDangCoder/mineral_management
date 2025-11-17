import 'dart:math';

import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tiến độ Dự án Mở rộng mỏ Thạch Khê',
          style: XelaTextStyle.xelaSubheadline.apply(
            color: XelaColor.Gray2,
          ),
        ),
        const SizedBox(height: 16),
        const _ProgressCard(
          title: 'Tiến độ thi công',
          percent: 0.65,
          barColor: Colors.green,
        ),
        const SizedBox(height: 16),
        const _ProgressCard(
          title: 'Tiến độ thanh toán',
          percent: 0.50,
          barColor: Colors.blue,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Card progress có label + thanh tiến độ + số %
class _ProgressCard extends StatelessWidget {
  final String title;
  final double percent;
  final Color barColor;

  const _ProgressCard({
    required this.title,
    required this.percent,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Click vào progress card -> điều hướng đến Project Detail
        Navigator.pushNamed(
          context,
          Routers.projectDetail,
          arguments: {
            'projectName': 'Dự án Mở rộng mỏ Thạch Khê',
            'progressTitle': title,
            'progressPercent': percent,
          },
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              title,
              style: XelaTextStyle.xelaBodyBold,
            ),
          ),
          const SizedBox(height: 12),
          _progressWidget(
            context,
            percent: percent,
            color: barColor,
          ),
        ],
      ),
    );
  }
}

/// Linear progress có số % nằm giữa thanh
Widget _progressWidget(
  BuildContext context, {
  required double percent,
  required Color color,
}) {
  final maxProgress = MediaQuery.of(context).size.width - 32 * 2;
  return Container(
    height: 8,
    width: double.infinity,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: XelaColor.Gray10,
      borderRadius: BorderRadius.circular(4),
    ),
    alignment: Alignment.centerLeft,
    child: Container(
      width: maxProgress * min(1, percent),

      /// * with percent of progress
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

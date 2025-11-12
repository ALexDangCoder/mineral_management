import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            // ✅ AppBar custom theo form Xela UI
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
                    "Tiến độ",
                    style: XelaTextStyle.XelaHeadline.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            XelaDivider(),
            const SizedBox(height: 16),

            const Text(
              'Dự án Mở rộng mỏ Thạch Khê',
              style: XelaTextStyle.XelaHeadline,
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
        ),
      ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: XelaColor.Gray11,
        borderRadius: BorderRadius.circular(16),
        boxShadow: kElevationToShadow[1],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              title,
              style: XelaTextStyle.XelaBodyBold,
            ),
          ),
          const SizedBox(height: 12),
          _LinearPercentBar(value: percent, color: barColor),
        ],
      ),
    );
  }
}

/// Linear progress có số % nằm giữa thanh
class _LinearPercentBar extends StatelessWidget {
  final double value; // 0..1
  final Color color;

  const _LinearPercentBar({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final percentText = '${(value * 100).toStringAsFixed(0)}%';

    return LayoutBuilder(
      builder: (context, constraints) {
        final double v = value.clamp(0.0, 1.0).toDouble();
        final fullWidth = constraints.maxWidth;
        final double barWidth =
        (fullWidth * v).clamp(0.0, fullWidth).toDouble();
        return Container(
          height: 22,
          decoration: BoxDecoration(
            color: XelaColor.Gray10,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // phần màu
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: barWidth,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Center(
                child: Text(
                  percentText,
                  style: XelaTextStyle.XelaBodyBold.apply(
                    color: XelaColor.Gray12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

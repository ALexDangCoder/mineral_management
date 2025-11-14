import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ShowConstructionMapScreen extends StatelessWidget {
  const ShowConstructionMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ====== Nội dung chính ======
        const Expanded(
          child: Center(
            child: Text(
              "Bản đồ khu vực",
              style: XelaTextStyle.xelaTitle3,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ShowConstructionMapScreen extends StatelessWidget {
  const ShowConstructionMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    "Bản đồ khu vực",
                    style: XelaTextStyle.XelaHeadline.apply(
                      color: XelaColor.Gray2,
                    ),
                  ),
                ),
              ],
            ),

            // ====== Nội dung chính ======
            const Expanded(
              child: Center(
                child: Text(
                  "Bản đồ khu vực",
                  style: XelaTextStyle.XelaTitle3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

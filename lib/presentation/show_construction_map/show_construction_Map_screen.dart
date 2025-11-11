import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ShowConstructionMapScreen extends StatelessWidget {
  const ShowConstructionMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          "Ban do khu vuc",
          style: XelaTextStyle.XelaTitle3,
        ),
      ),
    );
  }
}

import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ShowConstructionMapScreen extends StatelessWidget {
  const ShowConstructionMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ban do khu vuc", style: XelaTextStyle.XelaTitle3,),
      ),
    );
  }
}

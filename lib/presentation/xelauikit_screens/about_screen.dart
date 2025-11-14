import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 212,
                    height: 34,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      "DESIGN SYSTEM",
                      style: XelaTextStyle.xelaSmallBodyBold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                    child: Text(
                      "XelaUIKit library - UI toolkit for the Flutter Apps. Optimized for building data-dense interfaces for mobile applications. UI matches with Figma library",
                      textAlign: TextAlign.center,
                      style:
                          XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 16, right: 16),
                    child: XelaButton(
                        size: XelaButtonSize.MEDIUM,
                        autoResize: false,
                        horizontalAlignment: MainAxisAlignment.center,
                        type: XelaButtonType.SECONDARY,
                        background: Colors.white,
                        foregroundColor: XelaColor.Blue3,
                        defaultBorderColor: XelaColor.Gray11,
                        text: "Visit website for more info",
                        onPressed: () {
                          const url = "https://xelaui.com";
                          launchURL(url);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: XelaButton(
                        size: XelaButtonSize.MEDIUM,
                        autoResize: false,
                        horizontalAlignment: MainAxisAlignment.center,
                        type: XelaButtonType.SECONDARY,
                        background: Colors.white,
                        foregroundColor: XelaColor.Blue3,
                        defaultBorderColor: XelaColor.Gray11,
                        text: "Documentation",
                        onPressed: () {
                          const url = "https://xela.setproduct.com/android";
                          launchURL(url);
                        }),
                  )
                ],
              ),
            )));
  }
}

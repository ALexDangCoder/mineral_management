import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TypographyComponent extends StatefulWidget {
  const TypographyComponent({Key? key}) : super(key: key);

  @override
  _TypographyComponentState createState() => _TypographyComponentState();
}

class _TypographyComponentState extends State<TypographyComponent> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
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
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(Icons.arrow_back,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Typography",
                        style: XelaTextStyle.xelaSubheadline.apply(
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: XelaToggle(
                          onToggle: (val) {
                            setState(() {
                              _isDark = val;
                            });
                          },
                          status: _isDark,
                          size: XelaToggleSize.MEDIUM,
                          iconOn: Icon(Icons.nightlight_round,
                              size: 20, color: XelaColor.Gray3),
                          iconOff: Icon(Icons.nightlight_round,
                              size: 20, color: XelaColor.Gray7),
                          onBackground: XelaColor.Gray3,
                        ),
                      ),
                    ],
                  ),),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Title1",
                      style: XelaTextStyle.xelaTitle1.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Title2",
                      style: XelaTextStyle.xelaTitle2.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Title3",
                      style: XelaTextStyle.xelaTitle3.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Headline",
                      style: XelaTextStyle.xelaHeadline.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Subheadline",
                      style: XelaTextStyle.xelaSubheadline.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Body",
                      style: XelaTextStyle.xelaBody.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Body Bold",
                      style: XelaTextStyle.xelaBodyBold.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Small Body",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Small Body Bold",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Caption",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Button Large",
                      style: XelaTextStyle.xelaButtonLarge.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Button Medium",
                      style: XelaTextStyle.xelaButtonMedium.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Text(
                      "Button Small",
                      style: XelaTextStyle.xelaButtonSmall.apply(
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

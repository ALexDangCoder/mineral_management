import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class AlertComponent extends StatefulWidget {
  const AlertComponent({Key? key}) : super(key: key);

  @override
  _AlertComponentState createState() => _AlertComponentState();
}

class _AlertComponentState extends State<AlertComponent> {
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
                        hoverElevation: 0,
                        fillColor: Colors.transparent,
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
                        "Alert",
                        style: XelaTextStyle.XelaSubheadline.apply(
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
                  )),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Usage Example",
                        style: XelaTextStyle.XelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      title: "Congratulations!",
                      text:
                          "Your OS has been updated to the latest version. Current OS Version 4.3.17863.289",
                      leftIcon: Icon(Icons.gpp_maybe,
                          size: 20,
                          color:
                              _isDark ? XelaColor.Green10 : XelaColor.Green2),
                      primaryColor:
                          _isDark ? XelaColor.Green10 : XelaColor.Green2,
                      secondaryColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray7,
                      background:
                          _isDark ? XelaColor.Green1 : XelaColor.Green12, id: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      title: "Warning!",
                      text:
                          "Careful! please, never look behind... i said NEVER!",
                      primaryColor:
                          _isDark ? XelaColor.Orange6 : XelaColor.Orange3,
                      secondaryColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      background: _isDark ? XelaColor.Gray3 : XelaColor.Gray12, id: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants",
                        style: XelaTextStyle.XelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      title: "Alert title",
                      text: "Alert text",
                      leftIcon: Icon(Icons.grid_view,
                          size: 20,
                          color: _isDark ? XelaColor.Blue6 : XelaColor.Blue6),
                      primaryColor: _isDark ? XelaColor.Blue6 : XelaColor.Blue6,
                      secondaryColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray7,
                      background: _isDark ? XelaColor.Gray3 : XelaColor.Gray12,
                      rightWidget: InkWell(
                        onTap: () {},
                        child: Icon(Icons.grid_view,
                            size: 20,
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray6),
                      ), id: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      title: "Alert title",
                      text: "Alert text",
                      leftIcon: Icon(Icons.grid_view,
                          size: 20,
                          color:
                              _isDark ? XelaColor.Orange6 : XelaColor.Orange3),
                      primaryColor:
                          _isDark ? XelaColor.Orange6 : XelaColor.Orange3,
                      secondaryColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray7,
                      background: _isDark ? XelaColor.Gray3 : XelaColor.Gray12, id: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      title: "Alert title",
                      text: "Alert text",
                      primaryColor:
                          _isDark ? XelaColor.Green2 : XelaColor.Green2,
                      secondaryColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray7,
                      background: _isDark ? XelaColor.Gray3 : XelaColor.Gray12, id: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaAlert(
                      id: '',
                      title: "Alert title",
                      text: "Alert text",
                      primaryColor: _isDark ? XelaColor.Red6 : XelaColor.Red3,
                      secondaryColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray7,
                      background: _isDark ? XelaColor.Gray3 : XelaColor.Gray12,
                      rightWidget: InkWell(
                        onTap: () {},
                        child: Icon(Icons.grid_view,
                            size: 20,
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray6),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

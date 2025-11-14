import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ToggleComponent extends StatefulWidget {
  const ToggleComponent({Key? key}) : super(key: key);

  @override
  _ToggleComponentState createState() => _ToggleComponentState();
}

class _ToggleComponentState extends State<ToggleComponent> {
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
                        hoverElevation: 0,
                        highlightElevation: 0,
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
                        "Toggle",
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
                  )),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Large",
                        style: XelaTextStyle.xelaCaption.apply(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.LARGE,
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.LARGE,
                        iconOn: Icon(Icons.grid_view,
                            color: _isDark ? XelaColor.Blue5 : XelaColor.Blue3),
                        iconOff: Icon(Icons.grid_view, color: XelaColor.Gray11),
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Medium",
                        style: XelaTextStyle.xelaCaption.apply(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.MEDIUM,
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.MEDIUM,
                        iconOn: Icon(Icons.grid_view,
                            color: _isDark ? XelaColor.Blue5 : XelaColor.Blue3),
                        iconOff: Icon(Icons.grid_view, color: XelaColor.Gray11),
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Small",
                        style: XelaTextStyle.xelaCaption.apply(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.SMALL,
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaToggle(
                        size: XelaToggleSize.SMALL,
                        iconOn: Icon(Icons.grid_view,
                            color: _isDark ? XelaColor.Blue5 : XelaColor.Blue3),
                        iconOff: Icon(Icons.grid_view, color: XelaColor.Gray11),
                        onBackground:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        offBackground:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        circleOnColor:
                            _isDark ? XelaColor.Gray11 : Colors.white,
                        circleOffColor:
                            _isDark ? XelaColor.Gray8 : Colors.white,
                        onToggle: (isChecked) {},
                        content: Text(
                          "Label",
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      )),
                ],
              ))
            ],
          ),
        ));
  }
}

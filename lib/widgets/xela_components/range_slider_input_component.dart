import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_range_slider_input.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class RangeSliderInputComponent extends StatefulWidget {
  const RangeSliderInputComponent({Key? key}) : super(key: key);

  @override
  _RangeSliderInputComponentState createState() =>
      _RangeSliderInputComponentState();
}

class _RangeSliderInputComponentState extends State<RangeSliderInputComponent> {
  bool _isDark = false;

  int minPrice = 0;
  int maxPrice = 520;

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
                        "Range Slider Input",
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
                        "Usage Example",
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price Range",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: XelaDivider(
                              style: XelaDividerStyle.DOTTED,
                              color:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            ),
                          ),
                          Text(
                            "\$$minPrice - \$$maxPrice",
                            style: XelaTextStyle.xelaSubheadline.apply(
                                color: _isDark
                                    ? XelaColor.Blue5
                                    : XelaColor.Blue3),
                          ),
                          Text(
                            "Average price: \$430",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: _isDark
                                    ? XelaColor.Gray6
                                    : XelaColor.Gray3),
                          ),
                          XelaRangeSliderInput(
                            values: RangeValues(
                                minPrice.toDouble(), maxPrice.toDouble()),
                            min: 0,
                            max: 1000,
                            primaryColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            secondaryColor:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            divisions: 100,
                            controlColor:
                                _isDark ? XelaColor.Gray12 : Colors.white,
                            onChange: (values) {
                              setState(() {
                                minPrice = values.start.toInt();
                                maxPrice = values.end.toInt();
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$0",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: XelaColor.Gray6),
                                ),
                                Text(
                                  "\$1000",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: XelaColor.Gray6),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants",
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
                  XelaRangeSliderInput(
                    values: RangeValues(40, 60),
                    showLabel: true,
                    divisions: 10,
                    primaryColor: _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                    secondaryColor:
                        _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    controlColor: _isDark ? XelaColor.Gray12 : Colors.white,
                  ),
                  XelaRangeSliderInput(
                    values: RangeValues(20, 80),
                    primaryColor:
                        _isDark ? XelaColor.Purple2 : XelaColor.Purple3,
                    secondaryColor:
                        _isDark ? XelaColor.Purple9 : XelaColor.Purple11,
                    controlColor: _isDark ? XelaColor.Gray12 : Colors.white,
                  ),
                  XelaRangeSliderInput(
                    values: RangeValues(10, 90),
                    showLabel: true,
                    divisions: 10,
                    disabled: true,
                    primaryColor: _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                    secondaryColor:
                        _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    controlColor: _isDark ? XelaColor.Gray12 : Colors.white,
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tooltip.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TooltipsComponent extends StatefulWidget {
  const TooltipsComponent({Key? key}) : super(key: key);

  @override
  _TooltipsComponentState createState() => _TooltipsComponentState();
}

class _TooltipsComponentState extends State<TooltipsComponent> {
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
                        "Tooltips",
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
                  Center(
                    child: XelaTooltip(
                      child: Text(
                        "Earth is the third planet from the Sun and\n" +
                            "the only astronomical object known to harbor\n" +
                            "life. According to radiometric dating estimation\n" +
                            "and other evidence, Earth formed over\n" +
                            "4.5 billion years ago.",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: Colors.white),
                      ),
                      arrowDirection: XelaTooltipArrowDirection.BOTTOM,
                      background: XelaColor.Green2,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 12),
                      child: XelaButton(
                        leftIcon: Icon(Icons.grid_view,
                            size: 20, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Top",
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
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.BOTTOM_LEFT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.BOTTOM,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.BOTTOM_RIGHT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Bottom",
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
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.TOP_LEFT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.TOP,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.TOP_RIGHT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Right",
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
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.LEFT_TOP,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.LEFT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.LEFT_BOTTOM,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Left",
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
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.RIGHT_TOP,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.RIGHT,
                        background: XelaColor.Blue6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Center(
                      child: XelaTooltip(
                        child: Text(
                          "Earth is the third planet from the Sun and\n" +
                              "the only astronomical object known to harbor\n" +
                              "life. According to radiometric dating estimation\n" +
                              "and other evidence, Earth formed over\n" +
                              "4.5 billion years ago.",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: Colors.white),
                        ),
                        arrowDirection: XelaTooltipArrowDirection.RIGHT_BOTTOM,
                        background: XelaColor.Blue6,
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

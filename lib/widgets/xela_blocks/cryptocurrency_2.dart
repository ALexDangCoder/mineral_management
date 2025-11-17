import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_chart_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_chart.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cryptocurrency2 extends StatefulWidget {
  @override
  _Cryptocurrency2State createState() => _Cryptocurrency2State();
}

class _Cryptocurrency2State extends State<Cryptocurrency2> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 8 : 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
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
                        child: Text("My Wallet",
                            style: XelaTextStyle.xelaSubheadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2))),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
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
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: XelaDivider(
                                    style: XelaDividerStyle.DOTTED,
                                    color: _isDark
                                        ? XelaColor.Gray4
                                        : XelaColor.Gray11)),
                            const SizedBox(height: 24),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        Text("Current Balance",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray8
                                                        : XelaColor.Gray6)),
                                        Text("0.00004869 ETH",
                                            style: XelaTextStyle.xelaHeadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                        Row(
                                          children: [
                                            Text(
                                              "\$4,231.01",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6),
                                            ),
                                            const SizedBox(width: 24),
                                            const Icon(Icons.arrow_upward,
                                                size: 10,
                                                color: XelaColor.Green1),
                                            const SizedBox(width: 4),
                                            Text("4.52%",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Green1))
                                          ],
                                        )
                                      ])),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16, left: 24),
                                      child: SvgPicture.asset(
                                          "assets/icons/cr-2.svg",
                                          width: 24,
                                          height: 40))
                                ])),
                            const SizedBox(height: 24),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: XelaButton(
                                      onPressed: () {},
                                      text: "Buy",
                                      background: XelaColor.Blue6,
                                      foregroundColor: Colors.white,
                                      size: XelaButtonSize.SMALL,
                                      autoResize: false,
                                    )),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: XelaButton(
                                      onPressed: () {},
                                      text: "Sell",
                                      type: XelaButtonType.SECONDARY,
                                      background: Colors.transparent,
                                      foregroundColor: XelaColor.Orange3,
                                      defaultBorderColor: _isDark
                                          ? XelaColor.Gray3
                                          : XelaColor.Gray11,
                                      size: XelaButtonSize.SMALL,
                                      autoResize: false,
                                    )),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: XelaButton(
                                      onPressed: () {},
                                      text: "Trade",
                                      type: XelaButtonType.SECONDARY,
                                      background: Colors.transparent,
                                      foregroundColor: XelaColor.Blue6,
                                      defaultBorderColor: _isDark
                                          ? XelaColor.Gray3
                                          : XelaColor.Gray11,
                                      size: XelaButtonSize.SMALL,
                                      autoResize: false,
                                    )),
                                  ],
                                )),
                            const SizedBox(height: 24),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: XelaDivider(
                                    style: XelaDividerStyle.DOTTED,
                                    color: _isDark
                                        ? XelaColor.Gray4
                                        : XelaColor.Gray11)),
                            const SizedBox(height: 24),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text("Trending",
                                            style: XelaTextStyle.xelaBodyBold
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2))),
                                    XelaButton(
                                      onPressed: () {},
                                      text: "Price",
                                      type: XelaButtonType.SECONDARY,
                                      background: Colors.transparent,
                                      foregroundColor: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2,
                                      defaultBorderColor: _isDark
                                          ? XelaColor.Gray3
                                          : XelaColor.Gray11,
                                      size: XelaButtonSize.SMALL,
                                      autoResize: false,
                                    )
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 24),
                              child: XelaChart(
                                dataStep: 2,
                                beforeData: "\$",
                                afterData: "k",
                                height: 200,
                                type: XelaChartType.LINE,
                                labels: const [
                                  "Mon",
                                  "Tue",
                                  "Wed",
                                  "Thu",
                                  "Fri",
                                  "Sat",
                                  "Sun"
                                ],
                                datasetsLineChart: [
                                  XelaLineChartDataset(
                                    label: "Trending",
                                    data: [1, 3.5, 2, 2, 6, 7, 4],
                                    lineColor: XelaColor.Green1,
                                    fillColor: XelaColor.Green1,
                                    pointColor: Colors.transparent,
                                    tension: 0,
                                  )
                                ],
                                labelsColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray10,
                                chartBorderColor: _isDark
                                    ? XelaColor.Gray2
                                    : XelaColor.Gray12,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Transactions",
                              style: XelaTextStyle.xelaButtonMedium.apply(
                                  color:
                                      _isDark ? Colors.white : XelaColor.Gray2),
                            ),
                            const Icon(Icons.keyboard_arrow_down,
                                size: 15, color: XelaColor.Blue6)
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}

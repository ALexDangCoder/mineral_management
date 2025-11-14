import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cryptocurrency3 extends StatefulWidget {
  @override
  _Cryptocurrency3State createState() => _Cryptocurrency3State();
}

class _Cryptocurrency3State extends State<Cryptocurrency3> {
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
                        child: Text("My Account",
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
                            const SizedBox(height: 8),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        Text("Your active Deposit",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray8
                                                        : XelaColor.Gray6)),
                                        Text("\$525,834.12",
                                            style: XelaTextStyle.xelaHeadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                      ])),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 16),
                                      child: Row(
                                        children: [
                                          Text("View transactions",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6)),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.keyboard_arrow_right,
                                              size: 20, color: XelaColor.Blue6)
                                        ],
                                      ))
                                ])),
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
                                        child: Text("Balances",
                                            style: XelaTextStyle.xelaBodyBold
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2))),
                                    XelaButton(
                                      onPressed: () {},
                                      text: "Add New",
                                      rightIcon: Icon(Icons.add,
                                          size: 15,
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2),
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
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: _isDark
                                              ? XelaColor.Gray2
                                              : XelaColor.Gray12,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF627EEA)),
                                              child: FittedBox(
                                                child: SvgPicture.asset(
                                                    "assets/icons/cr-2.svg",
                                                    width: 15,
                                                    height: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text("83.874 ETH",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            Text("\$3,284.00 ",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray6
                                                            : XelaColor.Gray8)),
                                          ],
                                        ),
                                      )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: _isDark
                                              ? XelaColor.Gray2
                                              : XelaColor.Gray12,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFF7931A)),
                                              child: FittedBox(
                                                child: SvgPicture.asset(
                                                    "assets/icons/cr-1.svg",
                                                    width: 15,
                                                    height: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text("1 BTC",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            Text("\$8,006.00 ",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray6
                                                            : XelaColor.Gray8)),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: _isDark
                                              ? XelaColor.Gray2
                                              : XelaColor.Gray12,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF627EEA)),
                                              child: FittedBox(
                                                child: SvgPicture.asset(
                                                    "assets/icons/cr-6.svg",
                                                    width: 15,
                                                    height: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text("1000 DASH",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            Text("\$2,833.00",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray6
                                                            : XelaColor.Gray8)),
                                          ],
                                        ),
                                      )),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: _isDark
                                              ? XelaColor.Gray2
                                              : XelaColor.Gray12,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFFF4702)),
                                              child: FittedBox(
                                                child: SvgPicture.asset(
                                                    "assets/icons/cr-3.svg",
                                                    width: 15,
                                                    height: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text("10.048 XMR",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            Text("\$76,500",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray6
                                                            : XelaColor.Gray8)),
                                          ],
                                        ),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text("Exchange rate",
                                            style: XelaTextStyle.xelaBodyBold
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2))),
                                  ],
                                )),
                            const SizedBox(height: 24),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text("Name",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray6))),
                                    Text("Value",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_downward,
                                        size: 20, color: XelaColor.Blue6)
                                  ],
                                )),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFFF4702)
                                            .withOpacity(0.16)),
                                    child: SvgPicture.asset(
                                        "assets/icons/cr-3.svg",
                                        width: 24,
                                        height: 24),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Monero",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                      Text("XMR",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray8))
                                    ],
                                  )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("\$76,500",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_downward,
                                              size: 10, color: XelaColor.Red6),
                                          const SizedBox(width: 4),
                                          Text("7.91%",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(color: XelaColor.Red6))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFF0084FF)
                                            .withOpacity(0.16)),
                                    child: SvgPicture.asset(
                                        "assets/icons/cr-4.svg",
                                        width: 24,
                                        height: 18),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Litecoin",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                      Text("LTC",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray8))
                                    ],
                                  )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("\$84,311",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_upward,
                                              size: 10,
                                              color: XelaColor.Green1),
                                          const SizedBox(width: 4),
                                          Text("31.29%",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Green1))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
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

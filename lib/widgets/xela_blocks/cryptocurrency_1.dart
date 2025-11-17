import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cryptocurrency1 extends StatefulWidget {
  @override
  _Cryptocurrency1State createState() => _Cryptocurrency1State();
}

class _Cryptocurrency1State extends State<Cryptocurrency1> {
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
                        child: Text("Live prices",
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Market Cap",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray6
                                                        : XelaColor.Gray8)),
                                        Text("\$1.84B",
                                            style: XelaTextStyle.xelaSubheadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                        Row(
                                          children: [
                                            const Icon(Icons.arrow_upward,
                                                size: 10,
                                                color: XelaColor.Green1),
                                            SizedBox(width: 4),
                                            Text("3.19%",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Green1))
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("24h Volume",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray6
                                                        : XelaColor.Gray8)),
                                        Text("\$235B",
                                            style: XelaTextStyle.xelaSubheadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                        Row(
                                          children: [
                                            const Icon(Icons.arrow_upward,
                                                size: 10,
                                                color: XelaColor.Green1),
                                            SizedBox(width: 4),
                                            Text("9.55%",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Green1))
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("BTC Dominance",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray6
                                                        : XelaColor.Gray8)),
                                        Text("64.47%",
                                            style: XelaTextStyle.xelaSubheadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                        Row(
                                          children: [
                                            const Icon(Icons.arrow_upward,
                                                size: 10,
                                                color: XelaColor.Green1),
                                            SizedBox(width: 4),
                                            Text("4.52%",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Green1))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            const SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: XelaTextField(
                                placeholder: "Search",
                                leftIcon: Icon(Icons.search,
                                    size: 20,
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2),
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                background: Colors.transparent,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 0, bottom: 24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color(0xFFF7931A)
                                                .withOpacity(0.16)),
                                        child: SvgPicture.asset(
                                            "assets/icons/cr-1.svg",
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
                                              Text("Bitcoin",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("BTC",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$5,950",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          Row(
                                            children: [
                                              const Icon(Icons.arrow_downward,
                                                  size: 10,
                                                  color: XelaColor.Red6),
                                              const SizedBox(width: 4),
                                              Text("6.82%",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Red6))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color(0xFF627EEA)
                                                .withOpacity(0.16)),
                                        child: SvgPicture.asset(
                                            "assets/icons/cr-2.svg",
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
                                              Text("Etherium",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("ETH",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$3,698",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
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
                                              Text("3.19%",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Green1))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
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
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("XMR",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$76,500",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          Row(
                                            children: [
                                              const Icon(Icons.arrow_downward,
                                                  size: 10,
                                                  color: XelaColor.Red6),
                                              const SizedBox(width: 4),
                                              Text("7.91%",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Red6))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
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
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("LTC",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$84,311",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
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
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Green1))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color(0xFF8DC351)
                                                .withOpacity(0.16)),
                                        child: SvgPicture.asset(
                                            "assets/icons/cr-5.svg",
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
                                              Text("Bitcoin Cash",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("BTCC",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$744.07",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
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
                                              Text("26.3%",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Green1))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color(0xFF1877F2)
                                                .withOpacity(0.16)),
                                        child: SvgPicture.asset(
                                            "assets/icons/cr-6.svg",
                                            width: 24,
                                            height: 12),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Dash",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("DASH",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("\$694.11",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
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
                                              Text("18.1%",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Green1))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
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

import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class EcommerceProducts extends StatefulWidget {
  @override
  _EcommerceProductsState createState() => _EcommerceProductsState();
}

class _EcommerceProductsState extends State<EcommerceProducts> {
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
        backgroundColor: _isDark ? Colors.black : Colors.white,
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
                    const Spacer(),
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Popular Products",
                                style: XelaTextStyle.xelaHeadline.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Spacer(),
                                Text("View all",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Blue6
                                            : XelaColor.Blue3)),
                                const SizedBox(width: 8),
                                Icon(Icons.chevron_right,
                                    size: 16,
                                    color: _isDark
                                        ? XelaColor.Blue6
                                        : XelaColor.Blue3),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _isDark
                                      ? XelaColor.Gray1
                                      : XelaColor.Gray12),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _isDark
                                                ? XelaColor.Gray2
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 96,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/e-1.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Strawberries",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("16 oz pkg | \$0.31 / oz",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray6)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("\$4.99",
                                              style: XelaTextStyle
                                                      .xelaSubheadline
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          const Spacer(),
                                          XelaButton(
                                            onPressed: () {},
                                            size: XelaButtonSize.SMALL,
                                            background: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray2,
                                            leftIcon: Icon(Icons.shopping_bag,
                                                size: 20, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _isDark
                                      ? XelaColor.Gray1
                                      : XelaColor.Gray12),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _isDark
                                                ? XelaColor.Gray2
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 96,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/e-2.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Clementines (Mandarins)",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("3 lb bag | \$0.12 / oz",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray6)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("\$5.99",
                                              style: XelaTextStyle
                                                      .xelaSubheadline
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          const Spacer(),
                                          XelaButton(
                                            onPressed: () {},
                                            size: XelaButtonSize.SMALL,
                                            background: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray2,
                                            leftIcon: Icon(Icons.shopping_bag,
                                                size: 20, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _isDark
                                      ? XelaColor.Gray1
                                      : XelaColor.Gray12),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _isDark
                                                ? XelaColor.Gray2
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 96,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/e-3.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Sweet Corn",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("1 ear | \$0.41 / ea",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray6)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("\$0.41",
                                              style: XelaTextStyle
                                                      .xelaSubheadline
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          const Spacer(),
                                          XelaButton(
                                            onPressed: () {},
                                            size: XelaButtonSize.SMALL,
                                            background: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray2,
                                            leftIcon: Icon(Icons.shopping_bag,
                                                size: 20, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _isDark
                                      ? XelaColor.Gray1
                                      : XelaColor.Gray12),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _isDark
                                                ? XelaColor.Gray2
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 96,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/e-4.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Eggplant",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("1 ea | \$2.76 / ea",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray6)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("\$2.76",
                                              style: XelaTextStyle
                                                      .xelaSubheadline
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          const Spacer(),
                                          XelaButton(
                                            onPressed: () {},
                                            size: XelaButtonSize.SMALL,
                                            background: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray2,
                                            leftIcon: Icon(Icons.shopping_bag,
                                                size: 20, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _isDark
                                      ? XelaColor.Gray1
                                      : XelaColor.Gray12),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _isDark
                                                ? XelaColor.Gray2
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 96,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/e-5.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Broccoli Organic",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("1 head | \$3.49 / ea",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray6)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("\$3.49",
                                              style: XelaTextStyle
                                                      .xelaSubheadline
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          const Spacer(),
                                          XelaButton(
                                            onPressed: () {},
                                            size: XelaButtonSize.SMALL,
                                            background: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray2,
                                            leftIcon: Icon(Icons.shopping_bag,
                                                size: 20, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
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

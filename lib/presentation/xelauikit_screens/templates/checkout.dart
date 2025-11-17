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

import 'checkout_form.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: XelaColor.Gray2,
                  child: Row(
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
                              size: 20, color: Colors.white),
                        ),
                      ),
                      Text("Your cart",
                          style: XelaTextStyle.xelaButtonLarge.apply(
                              color: Colors.white)),
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
                            Row(
                              children: [
                                Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    child:
                                        Image.asset("assets/images/ch-1.png"),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Adidas Gazelle Black",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)),
                                    Text("Color: Black",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text("€283,11",
                                            style: XelaTextStyle.xelaSubheadline
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
                                              : XelaColor.Gray11,
                                          leftIcon: Icon(Icons.close,
                                              size: 20,
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    child:
                                        Image.asset("assets/images/ch-2.png"),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Adidas Yeezy Boost 350 V2",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)),
                                    Text("Size: 58",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text("€59,55",
                                            style: XelaTextStyle.xelaSubheadline
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
                                              : XelaColor.Gray11,
                                          leftIcon: Icon(Icons.close,
                                              size: 20,
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 60),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Subtotal",
                                        style:
                                            XelaTextStyle.xelaSmallBody.apply(
                                                color: XelaColor.Gray8))),
                                Text("€342,66",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Shipping",
                                        style:
                                            XelaTextStyle.xelaSmallBody.apply(
                                                color: XelaColor.Gray8))),
                                Text("Calculated on next step",
                                    style: XelaTextStyle.xelaSmallBody.apply(
                                        color: XelaColor.Gray8))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Taxes (estimated)",
                                        style:
                                            XelaTextStyle.xelaSmallBody.apply(
                                                color: XelaColor.Gray8))),
                                Text("€48",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Discount",
                                        style:
                                            XelaTextStyle.xelaSmallBody.apply(
                                                color: XelaColor.Gray8))),
                                Text("€30",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Total",
                                        style:
                                            XelaTextStyle.xelaSmallBody.apply(
                                                color: XelaColor.Gray8))),
                                Text("€360,66",
                                    style: XelaTextStyle.xelaHeadline.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2))
                              ],
                            ),
                            const SizedBox(height: 56),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11),
                            const SizedBox(height: 56),
                            Row(
                              children: [
                                Icon(Icons.local_shipping,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Delivery",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)),
                                    Text(
                                        "Track the progress of your order in real time",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Icon(Icons.history,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Returns",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)),
                                    Text(
                                        "14 day money-back returns if you change your mind.",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 56),
                            XelaButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutForm()),
                                );
                              },
                              text: "Proceed to checkout",
                              rightIcon: const Icon(Icons.navigate_next,
                                  size: 16, color: Colors.white),
                              autoResize: false,
                              background:
                                  _isDark ? XelaColor.Blue6 : XelaColor.Blue3,
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

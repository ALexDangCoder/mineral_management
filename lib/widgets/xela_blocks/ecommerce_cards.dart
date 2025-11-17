import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class EcommerceCards extends StatefulWidget {
  @override
  _EcommerceCardsState createState() => _EcommerceCardsState();
}

class _EcommerceCardsState extends State<EcommerceCards> {
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
        backgroundColor: _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              children: [
                Row(
                  children: [
                    RawMaterialButton(
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 2,
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
                        child: Text("Ecommerce cards",
                            style: XelaTextStyle.xelaSubheadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2))),
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
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 192,
                                height: 244,
                                child: Stack(
                                  children: [
                                    Container(
                                        width: 192,
                                        height: 244,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/ec-1.png"),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        XelaBadge(
                                          text: "Sale",
                                          background: _isDark
                                              ? XelaColor.Orange8
                                              : XelaColor.Orange11,
                                          textColor: _isDark
                                              ? XelaColor.Orange1
                                              : XelaColor.Orange3,
                                        ),
                                        Icon(Icons.favorite,
                                            size: 15,
                                            color: _isDark
                                                ? XelaColor.Gray5
                                                : XelaColor.Gray9),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text("Headsets",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: _isDark
                                          ? XelaColor.Gray8
                                          : XelaColor.Gray6)),
                              Text("Arctis 7P Wireless",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray12
                                          : XelaColor.Gray2)),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text("\$179.99",
                                          style:
                                              XelaTextStyle.xelaBodyBold.apply(
                                                  color: _isDark
                                                      ? XelaColor.Blue5
                                                      : XelaColor.Blue3))),
                                  Icon(Icons.star,
                                      size: 15,
                                      color: _isDark
                                          ? XelaColor.Yellow2
                                          : XelaColor.Yellow3),
                                  const SizedBox(width: 8),
                                  Text("4.9",
                                      style:
                                          XelaTextStyle.xelaButtonSmall.apply(
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray5))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 192,
                                height: 244,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    SizedBox(
                                        width: 192,
                                        height: 244,
                                        child: FittedBox(
                                          child: Image.asset(
                                              "assets/images/ec-2.png"),
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        XelaBadge(
                                          text: "-20%",
                                          background: _isDark
                                              ? XelaColor.Green2
                                              : XelaColor.Green11,
                                          textColor: _isDark
                                              ? Colors.white
                                              : XelaColor.Green1,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text("Samsung",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: _isDark
                                          ? XelaColor.Gray8
                                          : XelaColor.Gray6)),
                              Text("Galaxy Watch Active 3",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray12
                                          : XelaColor.Gray2)),
                              const SizedBox(height: 12),
                              Text("\$168.00",
                                  style: XelaTextStyle.xelaBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray12
                                          : XelaColor.Gray2)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              Container(
                                  width: 240,
                                  height: 252,
                                  child: FittedBox(
                                    child:
                                        Image.asset("assets/images/ec-3.png"),
                                  )),
                              Text("Xbox One X",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: _isDark
                                          ? XelaColor.Gray8
                                          : XelaColor.Gray6)),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Text("NEON ORANGE SHADOW XBOX GAMEPAD",
                                      style:
                                          XelaTextStyle.xelaSmallBodyBold.apply(
                                              color: _isDark
                                                  ? XelaColor.Gray12
                                                  : XelaColor.Gray2),
                                      textAlign: TextAlign.center)),
                              const SizedBox(height: 12),
                              Text("\$168.00",
                                  style: XelaTextStyle.xelaBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Orange5
                                          : XelaColor.Orange3)),
                              const SizedBox(height: 24),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 208,
                                height: 224,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 176,
                                      height: 183,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _isDark
                                              ? const Color(0xFFFFF4DF)
                                                  .withOpacity(0.14)
                                              : const Color(0xFFFFF8EC)),
                                    ),
                                    FittedBox(
                                      child:
                                          Image.asset("assets/images/ec-4.png"),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text("Facial Moisturiser",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray12
                                          : XelaColor.Gray2)),
                              Text("Size: 4.25fl.oz / 128ml",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: _isDark
                                          ? XelaColor.Gray8
                                          : XelaColor.Gray6)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text("\$12.99",
                                          style: XelaTextStyle.xelaSubheadline
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray12
                                                      : XelaColor.Gray2))),
                                  XelaButton(
                                    background: _isDark
                                        ? XelaColor.Gray4
                                        : XelaColor.Gray2,
                                    onPressed: () {},
                                    leftIcon: Icon(Icons.shopping_bag,
                                        size: 20,
                                        color: _isDark
                                            ? XelaColor.Gray11
                                            : Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 208,
                                height: 224,
                                child: FittedBox(
                                  child: Image.asset("assets/images/ec-5.png"),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text("€8.99",
                                          style: XelaTextStyle.xelaSubheadline
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray12
                                                      : XelaColor.Gray2))),
                                  Icon(Icons.star,
                                      size: 15,
                                      color: _isDark
                                          ? XelaColor.Yellow2
                                          : XelaColor.Yellow3),
                                  const SizedBox(width: 8),
                                  Text("4.9",
                                      style:
                                          XelaTextStyle.xelaButtonSmall.apply(
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray5))
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text("Facial Moisturiser",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray12
                                          : XelaColor.Gray2)),
                              Text("38ml / 1fl.oz",
                                  style: XelaTextStyle.xelaCaption.apply(
                                      color: _isDark
                                          ? XelaColor.Gray8
                                          : XelaColor.Gray6)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  SizedBox(
                                    width: 240,
                                    height: 260,
                                    child: FittedBox(
                                      child:
                                          Image.asset("assets/images/ec-6.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: XelaButton(
                                        onPressed: () {},
                                        leftIcon: const Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: XelaColor.Gray2),
                                        background: Colors.white,
                                        size: XelaButtonSize.SMALL),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Orange Big Leaf Beach Top",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray12
                                                    : XelaColor.Gray2)),
                                    Text("Brandname",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray8
                                                : XelaColor.Gray6)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text("£30.00",
                                            style: XelaTextStyle.xelaSubheadline
                                                .apply(
                                                    color: XelaColor.Green1)),
                                        const SizedBox(width: 8),
                                        Text("£30.00",
                                            style: XelaTextStyle.xelaButtonSmall
                                                .apply(
                                                    color: XelaColor.Gray8,
                                                    decoration: TextDecoration
                                                        .lineThrough))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  SizedBox(
                                    width: 240,
                                    height: 260,
                                    child: FittedBox(
                                      child:
                                          Image.asset("assets/images/ec-7.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: XelaButton(
                                        onPressed: () {},
                                        leftIcon: Icon(Icons.shopping_bag,
                                            size: 20, color: Colors.white),
                                        background: _isDark
                                            ? XelaColor.Blue5
                                            : XelaColor.Blue3,
                                        size: XelaButtonSize.MEDIUM),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Women’s clothing",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray8
                                                : XelaColor.Gray6)),
                                    Text("Ribbed Knitted Midi Cardigan",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray12
                                                    : XelaColor.Gray2)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("\$128.50",
                                                style: XelaTextStyle
                                                        .xelaBodyBold
                                                    .apply(
                                                        color:
                                                            XelaColor.Blue5))),
                                        Text("48 reviews",
                                            style: XelaTextStyle.xelaButtonSmall
                                                .apply(
                                                    color: _isDark
                                                        ? XelaColor.Orange5
                                                        : XelaColor.Orange3))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 240,
                                    height: 320,
                                    child: FittedBox(
                                      child:
                                          Image.asset("assets/images/ec-8.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: XelaButton(
                                        onPressed: () {},
                                        leftIcon: const Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: XelaColor.Gray2),
                                        background: Colors.white,
                                        size: XelaButtonSize.SMALL),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Sportswear",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray8
                                                            : XelaColor
                                                                .Gray6))),
                                        Text("4 colors",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray8
                                                        : XelaColor.Gray6))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text("Nike Sportswear Tech Fleece AW77",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray12
                                                    : XelaColor.Gray2)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("\$52.99",
                                                style: XelaTextStyle
                                                        .xelaBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray12
                                                            : XelaColor
                                                                .Gray2))),
                                        Icon(Icons.star,
                                            size: 15,
                                            color: _isDark
                                                ? XelaColor.Yellow2
                                                : XelaColor.Yellow3),
                                        const SizedBox(width: 8),
                                        Text("4.9",
                                            style: XelaTextStyle.xelaButtonSmall
                                                .apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray11
                                                        : XelaColor.Gray5))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 240,
                                    height: 264,
                                    child: FittedBox(
                                      child:
                                          Image.asset("assets/images/ec-9.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: XelaBadge(
                                      text: "Sale",
                                      background: _isDark
                                          ? XelaColor.Blue8
                                          : XelaColor.Blue8,
                                      textColor: _isDark
                                          ? XelaColor.Blue1
                                          : XelaColor.Blue1,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Running Shoes",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray8
                                                            : XelaColor
                                                                .Gray6))),
                                        Icon(Icons.star,
                                            size: 15,
                                            color: _isDark
                                                ? XelaColor.Yellow2
                                                : XelaColor.Yellow3),
                                        const SizedBox(width: 8),
                                        Text("4.9",
                                            style: XelaTextStyle.xelaButtonSmall
                                                .apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray11
                                                        : XelaColor.Gray5))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Lightweight Gymwear Sport Running Shoes",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray12
                                                    : XelaColor.Gray2)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("\$179.99",
                                                style: XelaTextStyle
                                                        .xelaBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Blue5
                                                            : XelaColor
                                                                .Blue3))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 240,
                                    height: 380,
                                    child: FittedBox(
                                      child: Image.asset(
                                          "assets/images/ec-10.png"),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Grey Oversized Elasticated Hem Cropped Sweater",
                                      style:
                                          XelaTextStyle.xelaSmallBodyBold.apply(
                                              color: _isDark
                                                  ? XelaColor.Gray12
                                                  : XelaColor.Gray2),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("\$52.99",
                                            style: XelaTextStyle.xelaBodyBold
                                                .apply(
                                                    color: _isDark
                                                        ? XelaColor.Orange5
                                                        : XelaColor.Orange3))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            )));
  }
}

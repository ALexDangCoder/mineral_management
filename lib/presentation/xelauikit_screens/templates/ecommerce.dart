import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/ecommerce_products.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Ecommerce extends StatefulWidget {
  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
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
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaButton(
                                onPressed: () {},
                                text: "Shop by Category",
                                leftIcon: Icon(Icons.grid_view,
                                    size: 15, color: Colors.white),
                                autoResize: false,
                                background: XelaColor.Blue6,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Spacer(),
                                Text("⚡ Deals today",
                                    style:
                                        XelaTextStyle.xelaSmallBodyBold.apply(
                                            color: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2)),
                                const SizedBox(width: 32),
                                Text("✨ Special prices",
                                    style:
                                        XelaTextStyle.xelaSmallBodyBold.apply(
                                            color: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2)),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 312,
                              color:
                                  _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 312,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Positioned(
                                            child: Image.asset(_isDark
                                                ? "assets/images/ec-1-dark.png"
                                                : "assets/images/ec-1-light.png"))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text("Fire Up more table time",
                                            style: XelaTextStyle.xelaHeadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2),
                                            textAlign: TextAlign.center),
                                        Text("Summer is sweet together",
                                            style: XelaTextStyle.xelaBodyBold
                                                .apply(color: XelaColor.Gray6),
                                            textAlign: TextAlign.center),
                                        const SizedBox(height: 24),
                                        XelaTextField(
                                          placeholder: "Search groceries...",
                                          leftIcon: Icon(Icons.search,
                                              size: 20,
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray2),
                                          borderDefaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          background: _isDark
                                              ? XelaColor.Gray1
                                              : Colors.white,
                                          textfieldColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text("Browse by Category",
                                  style: XelaTextStyle.xelaHeadline.apply(
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Spacer(),
                                Text("All Categories",
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EcommerceProducts()),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: _isDark
                                                    ? XelaColor.Gray1
                                                    : XelaColor.Gray12),
                                            child: Column(
                                              children: [
                                                const Text("🥕",
                                                    style: TextStyle(
                                                        fontSize: 34)),
                                                const SizedBox(height: 8),
                                                Text("Vegetables",
                                                    style: XelaTextStyle
                                                            .xelaBodyBold
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                              ],
                                            ),
                                          ))),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🍏",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Fruits",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🍓",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Berries",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🍖",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Meat",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: _isDark
                                                    ? XelaColor.Gray1
                                                    : XelaColor.Gray12),
                                            child: Column(
                                              children: [
                                                const Text("🍗",
                                                    style: TextStyle(
                                                        fontSize: 34)),
                                                const SizedBox(height: 8),
                                                Text("Chicken",
                                                    style: XelaTextStyle
                                                            .xelaBodyBold
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EcommerceProducts()),
                                            );
                                          })),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🐟",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Fish",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🍤",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Seafood",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🧀",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Cheese",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: _isDark
                                              ? XelaColor.Gray1
                                              : XelaColor.Gray12),
                                      child: Column(
                                        children: [
                                          const Text("🍞",
                                              style: TextStyle(fontSize: 34)),
                                          const SizedBox(height: 8),
                                          Text("Bread",
                                              style: XelaTextStyle.xelaBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EcommerceProducts()),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16)
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

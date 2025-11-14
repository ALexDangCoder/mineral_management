import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class SideBar1 extends StatefulWidget {
  @override
  _Sidebar1State createState() => _Sidebar1State();
}

class _Sidebar1State extends State<SideBar1>
    with SingleTickerProviderStateMixin {
  bool _isDark = false;
  late AnimationController controller;
  late Animation sizeAnimation;
  late Animation fadeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    sizeAnimation = Tween<double>(begin: 96, end: 320).animate(controller)
      ..addStatusListener((status) {
        //print(status);
        if (status == AnimationStatus.dismissed) {
          isOpen = !isOpen;
        }
      });
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
    controller.dispose();
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                          ),
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
                  const Spacer()
                ],
              ),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Padding(
                      padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 24, left: 16, right: 16, bottom: 16),
                        height: double.infinity,
                        width: sizeAnimation.value,
                        decoration: BoxDecoration(
                          color: _isDark ? XelaColor.Gray2 : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isOpen
                                      ? Expanded(
                                          child: Opacity(
                                              opacity: fadeAnimation.value,
                                              child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 16,
                                                  child: Image.asset(
                                                      "assets/images/logo.png",
                                                      height: 16,
                                                      color: _isDark
                                                          ? XelaColor.Gray11
                                                          : XelaColor.Gray2,
                                                      fit: BoxFit.fitHeight))))
                                      : const SizedBox.shrink(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (isOpen) {
                                          controller.reverse();
                                        } else {
                                          isOpen = !isOpen;
                                          controller.forward();
                                        }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: isOpen
                                          ? Icon(Icons.chevron_left,
                                              size: 16,
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray2)
                                          : Icon(Icons.chevron_right,
                                              size: 16,
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray2),
                                    ),
                                  )
                                ]),
                            Container(
                              //height: 76,
                              padding: const EdgeInsets.only(top: 16),
                              child: isOpen
                                  ? XelaTextField(
                                      background: _isDark
                                          ? Colors.transparent
                                          : Colors.white,
                                      borderDefaultColor: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      placeholderColor: _isDark
                                          ? XelaColor.Gray6
                                          : XelaColor.Gray8,
                                      textfieldColor: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2,
                                      borderFocusColor: _isDark
                                          ? XelaColor.Blue5
                                          : XelaColor.Blue3,
                                      placeholder: "Search",
                                      leftIcon: Icon(Icons.search,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2),
                                    )
                                  : InkWell(
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Container(
                                              padding: EdgeInsets.all(12),
                                              child: Icon(Icons.search,
                                                  size: 16,
                                                  color: _isDark
                                                      ? XelaColor.Gray11
                                                      : XelaColor.Gray2)))),
                            ),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 0),
                                    child: ListView(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(Icons.home,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Home",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.data_usage,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Dashboard",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: XelaDivider(
                                                color: _isDark
                                                    ? XelaColor.Gray4
                                                    : XelaColor.Gray11,
                                                style:
                                                    XelaDividerStyle.DOTTED)),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.local_offer,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Products",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(Icons.flag,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Events",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.account_circle,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Users",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: XelaDivider(
                                                color: _isDark
                                                    ? XelaColor.Gray4
                                                    : XelaColor.Gray11,
                                                style:
                                                    XelaDividerStyle.DOTTED)),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.shopping_bag,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Sales",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(Icons.receipt,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Discounts",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.credit_card,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Payments",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: XelaDivider(
                                                color: _isDark
                                                    ? XelaColor.Gray4
                                                    : XelaColor.Gray11,
                                                style:
                                                    XelaDividerStyle.DOTTED)),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(
                                                        Icons.speaker_notes,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Messages",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                        const SizedBox(height: 16),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Ink(
                                                    child: Icon(Icons.tune,
                                                        size: 16,
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                                  ),
                                                ),
                                                isOpen
                                                    ? Expanded(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16),
                                                        child: Text(
                                                          "Settings",
                                                          maxLines: 1,
                                                          style: XelaTextStyle
                                                                  .xelaSmallBodyBold
                                                              .apply(
                                                                  color: _isDark
                                                                      ? XelaColor
                                                                          .Gray11
                                                                      : XelaColor
                                                                          .Gray2),
                                                        ),
                                                      ))
                                                    : const SizedBox.shrink(),
                                              ],
                                            )),
                                      ],
                                    ))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                XelaUserAvatar(
                                    size: XelaUserAvatarSize.MEDIUM,
                                    image: Image.asset(
                                        "assets/images/user_avatar.png"),
                                    style: XelaUserAvatarStyle.RECTANGLE),
                                isOpen
                                    ? Expanded(
                                        child: Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Floyd Miles",
                                                        maxLines: 1,
                                                        style: XelaTextStyle
                                                                .xelaSmallBodyBold
                                                            .apply(
                                                                color: _isDark
                                                                    ? XelaColor
                                                                        .Gray11
                                                                    : XelaColor
                                                                        .Gray2),
                                                      ),
                                                      Text(
                                                        "debra.holt@example.com",
                                                        maxLines: 1,
                                                        style: XelaTextStyle
                                                                .xelaCaption
                                                            .apply(
                                                                color: XelaColor
                                                                    .Gray6),
                                                      ),
                                                    ],
                                                  ))),
                                          InkWell(
                                            child: Ink(
                                              child: Icon(Icons.more_horiz,
                                                  size: 16,
                                                  color: _isDark
                                                      ? XelaColor.Gray11
                                                      : XelaColor.Gray2),
                                            ),
                                          )
                                        ],
                                      ))
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
          ],
        ));
  }
}

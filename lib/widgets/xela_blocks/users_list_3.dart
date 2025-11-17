import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class UsersList3 extends StatefulWidget {
  @override
  _UsersList3State createState() => _UsersList3State();
}

class _UsersList3State extends State<UsersList3> {
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
                    Spacer(),
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
                                padding: const EdgeInsets.all(24),
                                child: Row(children: [
                                  Text("Notifications",
                                      style: XelaTextStyle.xelaHeadline.apply(
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2)),
                                  const SizedBox(width: 16),
                                  XelaBadge(
                                      text: "2",
                                      background: XelaColor.Red5,
                                      textColor: Colors.white),
                                  const Spacer(),
                                  Text("View all",
                                      style:
                                          XelaTextStyle.xelaButtonSmall.apply(
                                              color: _isDark
                                                  ? XelaColor.Blue5
                                                  : XelaColor.Blue3))
                                ])),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 0, bottom: 24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar10.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Charolette ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("started following you.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("2 minutes ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                            color: XelaColor.Red6,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar9.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                        decoration:
                                            XelaUserAvatarDecoration.INDICATOR,
                                        decorationPosition:
                                            XelaUserAvatarDecorationPosition
                                                .BOTTOMRIGHT,
                                        decorationBorderColor: _isDark
                                            ? XelaColor.Gray1
                                            : Colors.white,
                                        decorationBackground: _isDark
                                            ? XelaColor.Green1
                                            : XelaColor.Green3,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Darrell ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("liked your photo.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("15 minutes ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                            color: XelaColor.Red6,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        initials: "BL",
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                        background: XelaColor.Blue10,
                                        foreground: XelaColor.Blue3,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Courtney ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("started following you.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("5 months ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar8.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Arlene ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("liked your photo.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("1 month ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar7.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Darlene ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("joined your campaign.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("1 month ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar6.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Dianne ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("liked your photo.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("5 hours ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/avatar5.png"),
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                        decoration:
                                            XelaUserAvatarDecoration.INDICATOR,
                                        decorationPosition:
                                            XelaUserAvatarDecorationPosition
                                                .BOTTOMRIGHT,
                                        decorationBorderColor: _isDark
                                            ? XelaColor.Gray1
                                            : Colors.white,
                                        decorationBackground: _isDark
                                            ? XelaColor.Green1
                                            : XelaColor.Green3,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Kristin ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("started following you.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("15 days ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        initials: "GR",
                                        size: XelaUserAvatarSize.MEDIUM,
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                        background: XelaColor.Orange10,
                                        foreground: XelaColor.Orange3,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Greg ",
                                                  style: XelaTextStyle
                                                          .xelaSmallBodyBold
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                              Text("started following you.",
                                                  style: XelaTextStyle
                                                          .xelaSmallBody
                                                      .apply(
                                                          color: _isDark
                                                              ? Colors.white
                                                              : XelaColor
                                                                  .Gray2)),
                                            ],
                                          ),
                                          Text("2 week ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      )),
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

import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocialNotifications extends StatefulWidget {
  @override
  _SocialNotificationsState createState() => _SocialNotificationsState();
}

class _SocialNotificationsState extends State<SocialNotifications> {
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
                Container(
                  color: _isDark ? Colors.black : Colors.white,
                  child: Row(
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
                              color: _isDark ? Colors.white : Colors.black),
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
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Requests",
                                      style:
                                          XelaTextStyle.xelaSubheadline.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2)),
                                  const SizedBox(width: 8),
                                  XelaBadge(
                                    text: "2",
                                    background: _isDark
                                        ? XelaColor.Blue8
                                        : XelaColor.Blue11,
                                    textColor: _isDark
                                        ? XelaColor.Blue1
                                        : XelaColor.Blue3,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        style: XelaUserAvatarStyle.CIRCLE,
                                        image: Image.asset(
                                            "assets/images/avatar1.png"),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Lauralee Quintero",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          Text("wants to add you to friends",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? XelaColor.Gray8
                                                          : XelaColor.Gray6)),
                                        ],
                                      ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 64),
                                      Text("Accept",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Blue6)),
                                      const SizedBox(width: 16),
                                      Text("Decline",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      XelaUserAvatar(
                                        style: XelaUserAvatarStyle.CIRCLE,
                                        image: Image.asset(
                                            "assets/images/avatar2.png"),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Brittni Landoma",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                          Text("wants to add you to friends",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? XelaColor.Gray8
                                                          : XelaColor.Gray6)),
                                        ],
                                      ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 64),
                                      Text("Accept",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Blue6)),
                                      const SizedBox(width: 16),
                                      Text("Decline",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  style: XelaDividerStyle.DOTTED,
                                  color: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Suggestions for you",
                                      style:
                                          XelaTextStyle.xelaSubheadline.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  XelaUserAvatar(
                                    style: XelaUserAvatarStyle.CIRCLE,
                                    image: Image.asset(
                                        "assets/images/avatar3.png"),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Chantal Shelburne",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("Memphis, TN, US",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )),
                                  Icon(Icons.group_add,
                                      size: 20, color: XelaColor.Blue6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  XelaUserAvatar(
                                    style: XelaUserAvatarStyle.CIRCLE,
                                    image: Image.asset(
                                        "assets/images/avatar4.png"),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Marci Senter",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("Newark, NJ, US",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )),
                                  Icon(Icons.group_add,
                                      size: 20, color: XelaColor.Blue6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  XelaUserAvatar(
                                    style: XelaUserAvatarStyle.CIRCLE,
                                    image: Image.asset(
                                        "assets/images/avatar5.png"),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Janetta Rotolo",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("Fort Worth, TX, US",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )),
                                  Icon(Icons.group_add,
                                      size: 20, color: XelaColor.Blue6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  XelaUserAvatar(
                                    style: XelaUserAvatarStyle.CIRCLE,
                                    image: Image.asset(
                                        "assets/images/avatar6.png"),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tyra Dhillon",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("Springfield, MA, US",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )),
                                  Icon(Icons.group_add,
                                      size: 20, color: XelaColor.Blue6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  XelaUserAvatar(
                                    style: XelaUserAvatarStyle.CIRCLE,
                                    image: Image.asset(
                                        "assets/images/avatar7.png"),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Marielle Wigington",
                                          style: XelaTextStyle.xelaSmallBodyBold
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Text("Honolulu, HI, US",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray6)),
                                    ],
                                  )),
                                  Icon(Icons.group_add,
                                      size: 20, color: XelaColor.Blue6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text("View All",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: XelaColor.Blue6)),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  style: XelaDividerStyle.DOTTED,
                                  color: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : XelaColor.Gray12,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                left: 175,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar8.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 150,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar7.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 125,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar6.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar5.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 75,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar4.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar3.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                left: 25,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar1.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar2.png"),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text("184.3K",
                                            style: XelaTextStyle.xelaHeadline
                                                .apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                        const SizedBox(width: 8),
                                        Text("Followers",
                                            style: XelaTextStyle.xelaSmallBody
                                                .apply(
                                                    color: _isDark
                                                        ? XelaColor.Gray8
                                                        : XelaColor.Gray6)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Active now on your profile",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  style: XelaDividerStyle.DOTTED,
                                  color: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("About",
                                      style: XelaTextStyle.xelaSmallBody.apply(
                                          color: _isDark
                                              ? XelaColor.Gray8
                                              : XelaColor.Gray6)),
                                  const SizedBox(width: 24),
                                  Text("Accessibility",
                                      style: XelaTextStyle.xelaSmallBody.apply(
                                          color: _isDark
                                              ? XelaColor.Gray8
                                              : XelaColor.Gray6)),
                                  const SizedBox(width: 24),
                                  Text("Help Center",
                                      style: XelaTextStyle.xelaSmallBody.apply(
                                          color: _isDark
                                              ? XelaColor.Gray8
                                              : XelaColor.Gray6)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Privacy and Terms",
                                      style: XelaTextStyle.xelaSmallBody.apply(
                                          color: _isDark
                                              ? XelaColor.Gray8
                                              : XelaColor.Gray6)),
                                  const SizedBox(width: 24),
                                  Text("Advertising",
                                      style: XelaTextStyle.xelaSmallBody.apply(
                                          color: _isDark
                                              ? XelaColor.Gray8
                                              : XelaColor.Gray6)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
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

import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class SideBar2 extends StatefulWidget {
  @override
  _Sidebar2State createState() => _Sidebar2State();
}

class _Sidebar2State extends State<SideBar2> {
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
          padding: const EdgeInsets.only(top: kIsWeb ? 8 : 32),
          child: Column(
            children: [
              Row(
                children: [
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
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  Expanded(
                      child: Text("Mailboxes",
                          style: XelaTextStyle.xelaHeadline.apply(
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
              const SizedBox(height: 8),
              Expanded(
                  child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: XelaButton(
                      onPressed: () {},
                      background: XelaColor.Blue6,
                      text: "Gmail",
                      size: XelaButtonSize.LARGE,
                      leftIcon:
                          Icon(Icons.category, size: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox, size: 15, color: XelaColor.Gray7),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Inbox",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "1.258",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 15, color: XelaColor.Gray7),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Starred",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "49",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Icon(Icons.send, size: 15, color: XelaColor.Gray7),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Sent",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "41",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Icon(Icons.description,
                            size: 15, color: XelaColor.Gray7),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Drafts",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 15, color: XelaColor.Gray7),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Deleted",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "8",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: XelaDivider(
                          style: XelaDividerStyle.DOTTED,
                          color: _isDark ? XelaColor.Gray4 : XelaColor.Gray11)),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Tags",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Icon(Icons.more_horiz,
                            size: 15,
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(color: XelaColor.Blue5, width: 3)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Behance",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "753",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(color: XelaColor.Pink3, width: 3)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Dribble",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "156",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                  color: XelaColor.Green3, width: 3)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Text("Work",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Text(
                          "64",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: XelaDivider(
                          style: XelaDividerStyle.DOTTED,
                          color: _isDark ? XelaColor.Gray4 : XelaColor.Gray11)),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset("assets/images/user_avatar-1.png"),
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.LARGE,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cody Fisher",
                              style: XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                            Text(
                              "kenzi.lawson@example.com",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray6),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        XelaBadge(
                            text: "2",
                            background:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            textColor:
                                _isDark ? Colors.white : XelaColor.Gray3),
                        const SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 15,
                            color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Messages",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2))),
                        Icon(Icons.more_horiz,
                            size: 15,
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XelaUserAvatar(
                          image: Image.asset("assets/images/user_avatar-2.png"),
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dianne Russell",
                              style: XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                            Text(
                              "woohoooo",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray6),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "06:47",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XelaUserAvatar(
                          image: Image.asset("assets/images/user_avatar-3.png"),
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.BOTTOMRIGHT,
                          decorationBackground: XelaColor.Green3,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Theresa Webb",
                              style: XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                            Text(
                              "omg, this is amazing...",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray6),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "02:45",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XelaUserAvatar(
                          icon: Icon(Icons.plumbing,
                              size: 20, color: Colors.white),
                          background: XelaColor.Pink5,
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cody Fisher",
                              style: XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                            Text(
                              "Haha oh man",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray6),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "2 week ago",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ))
            ],
          ),
        ));
  }
}

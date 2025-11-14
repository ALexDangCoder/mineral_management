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
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBar3 extends StatefulWidget {
  @override
  _Sidebar3State createState() => _Sidebar3State();
}

class _Sidebar3State extends State<SideBar3> {
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
            child: Row(
              children: [
                Container(
                  width: 96,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: _isDark ? XelaColor.Gray1 : XelaColor.Gray12),
                  child: Column(
                    children: [
                      Icon(Icons.polymer,
                          size: 40,
                          color: _isDark ? XelaColor.Blue5 : XelaColor.Blue3),
                      Spacer(),
                      Column(
                        children: [
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.home,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.account_circle,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.grid_view,
                                  size: 16,
                                  color: _isDark
                                      ? XelaColor.Blue3
                                      : XelaColor.Blue5),
                              background:
                                  _isDark ? XelaColor.Gray2 : XelaColor.Blue12),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.question_answer,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.notifications,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.data_usage,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                          XelaButton(
                              onPressed: () {},
                              leftIcon: Icon(Icons.calendar_today,
                                  size: 16, color: XelaColor.Gray6),
                              background: Colors.transparent),
                        ],
                      ),
                      Spacer(),
                      XelaButton(
                        onPressed: () {},
                        leftIcon: Icon(Icons.settings,
                            size: 16, color: XelaColor.Gray6),
                        type: XelaButtonType.SECONDARY,
                        background: Colors.transparent,
                        defaultBorderColor:
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      XelaUserAvatar(
                          image: Image.asset("assets/images/user_avatar-1.png"),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE)
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  decoration: BoxDecoration(
                      color: _isDark ? XelaColor.Gray2 : Colors.white),
                  child: Column(
                    children: [
                      Row(
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
                          Expanded(
                              child: Text("Integrations",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2))),
                          XelaToggle(
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
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      XelaDivider(
                          color: _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          style: XelaDividerStyle.DOTTED),
                      const SizedBox(height: 16),
                      Expanded(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/instagram.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Instagram",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                                Text("167",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray6))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/facebook.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Facebook",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/slack.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Slack",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/twitch.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Twitch",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                                Text("3",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray6))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/snapchat.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Snapchat",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/discord.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Blue6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Discord",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Blue6
                                          : XelaColor.Blue6),
                                )),
                                const SizedBox(width: 16),
                                XelaBadge(
                                  text: "22",
                                  background: _isDark
                                      ? XelaColor.Blue6
                                      : XelaColor.Blue11,
                                  textColor:
                                      _isDark ? Colors.white : XelaColor.Blue6,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/twitter.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Twitter",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/github.svg",
                                    width: 16,
                                    height: 16,
                                    color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                  "Github",
                                  style: XelaTextStyle.xelaSmallBodyBold.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                )),
                                const SizedBox(width: 16),
                                Text("17",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray6))
                              ],
                            ),
                          ),
                        ],
                      )),
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 72,
                              height: 80,
                              child: FittedBox(
                                child: _isDark
                                    ? Image.asset(
                                        "assets/images/sidenav3image_dark.png")
                                    : Image.asset(
                                        "assets/images/sidenav3image_light.png"),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Upgrade to Premium for more features!",
                                  style: XelaTextStyle.xelaButtonSmall.apply(
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                XelaButton(
                                  onPressed: () {},
                                  text: "Get premium",
                                  background: XelaColor.Pink,
                                  size: XelaButtonSize.SMALL,
                                )
                              ],
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )));
  }
}

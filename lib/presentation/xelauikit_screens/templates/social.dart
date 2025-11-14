import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/social_notifications.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class SocialUsers {
  final String image;
  final String name;

  SocialUsers({required this.image, required this.name});
}

class _SocialState extends State<Social> {
  bool _isDark = false;

  List<SocialUsers> socialUsers = [
    SocialUsers(image: "assets/images/avatar1.png", name: "Gladys"),
    SocialUsers(image: "assets/images/avatar2.png", name: "Kristin"),
    SocialUsers(image: "assets/images/avatar3.png", name: "Priscilla"),
    SocialUsers(image: "assets/images/avatar4.png", name: "Connie"),
    SocialUsers(image: "assets/images/avatar5.png", name: "Jonny"),
    SocialUsers(image: "assets/images/avatar6.png", name: "James"),
    SocialUsers(image: "assets/images/avatar7.png", name: "Lolly"),
    SocialUsers(image: "assets/images/avatar8.png", name: "Brendy"),
  ];

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
                              color: _isDark ? Colors.white : Colors.black),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
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
                      Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: InkWell(
                            child: XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              image: Image.asset("assets/images/avatar10.png"),
                              decoration: XelaUserAvatarDecoration.INDICATOR,
                              decorationBorderColor:
                                  _isDark ? Colors.black : Colors.white,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SocialNotifications()),
                              );
                            },
                          )),
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
                              child: XelaTextField(
                                placeholder: "Search...",
                                leftIcon: Icon(Icons.search,
                                    size: 20,
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2),
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                background:
                                    _isDark ? XelaColor.Gray1 : Colors.white,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Stories",
                                      style: XelaTextStyle.xelaHeadline.apply(
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2)),
                                  const Spacer(),
                                  Text("Watch all",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Blue6)),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 112,
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: socialUsers.length + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == 0) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            left: index == 0 ? 16 : 0,
                                            right:
                                                index == socialUsers.length - 1
                                                    ? 16
                                                    : 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray4
                                                          : XelaColor.Gray11)),
                                              child: Icon(Icons.add,
                                                  size: 16,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray2),
                                            ),
                                            const SizedBox(height: 8),
                                            Text("Add story",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: XelaColor.Gray6))
                                          ],
                                        ),
                                      );
                                    }
                                    return Container(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 16 : 0,
                                          right: index == socialUsers.length - 1
                                              ? 16
                                              : 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          XelaUserAvatar(
                                            image: Image.asset(
                                                socialUsers[index - 1].image),
                                            style: XelaUserAvatarStyle.CIRCLE,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(socialUsers[index - 1].name,
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6))
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text("Feeds",
                                      style: XelaTextStyle.xelaHeadline.apply(
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 32,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      border: Border.all(
                                          color: _isDark
                                              ? Colors.transparent
                                              : XelaColor.Gray11)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          XelaUserAvatar(
                                              image: Image.asset(
                                                  "assets/images/ps.png"),
                                              style:
                                                  XelaUserAvatarStyle.RECTANGLE,
                                              size: XelaUserAvatarSize.MEDIUM),
                                          const SizedBox(width: 12),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("r/playstation",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  const SizedBox(width: 8),
                                                  XelaBadge(
                                                      text: "New",
                                                      background:
                                                          XelaColor.Orange3,
                                                      textColor: Colors.white)
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                  "u/shadknight20 • 19 hours ago",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )),
                                          const SizedBox(width: 12),
                                          Icon(Icons.more_vert,
                                              size: 15,
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2)
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                          "Playstation is partnering with Discord.",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      const SizedBox(height: 16),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                64,
                                            child: Image.asset(
                                                "assets/images/soc-1.png"),
                                          ),
                                          XelaButton(
                                            onPressed: () {},
                                            leftIcon: Icon(Icons.play_arrow,
                                                size: 20,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2),
                                            background: _isDark
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.white.withOpacity(0.8),
                                            size: XelaButtonSize.SMALL,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.textsms,
                                                  size: 15,
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2),
                                              const SizedBox(width: 8),
                                              Text("114",
                                                  style:
                                                      XelaTextStyle.xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))
                                            ],
                                          ),
                                          Icon(Icons.bookmark,
                                              size: 15,
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2),
                                          Icon(Icons.share,
                                              size: 15,
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: _isDark
                                                    ? XelaColor.Gray3
                                                    : XelaColor.Gray12,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Icon(Icons.arrow_drop_up,
                                                    size: 15,
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2),
                                                const SizedBox(width: 16),
                                                Text("1.4k",
                                                    style: XelaTextStyle
                                                            .xelaButtonMedium
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const SizedBox(width: 16),
                                                Icon(Icons.arrow_drop_down,
                                                    size: 15,
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2),
                                              ],
                                            ),
                                          )
                                        ],
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
                                  width: MediaQuery.of(context).size.width - 32,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      border: Border.all(
                                          color: _isDark
                                              ? Colors.transparent
                                              : XelaColor.Gray11)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Row(
                                          children: [
                                            XelaUserAvatar(
                                                image: Image.asset(
                                                    "assets/images/user_avatar.png"),
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size:
                                                    XelaUserAvatarSize.MEDIUM),
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Dianne Russell",
                                                    style: XelaTextStyle
                                                            .xelaButtonMedium
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                Text("Oslo, Norway",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8))
                                              ],
                                            )),
                                            const SizedBox(width: 12),
                                            Icon(Icons.more_horiz,
                                                size: 15,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                32,
                                            child: Image.asset(
                                              "assets/images/soc-2.png",
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.favorite,
                                                  size: 20,
                                                  color: XelaColor.Red3),
                                              const SizedBox(width: 24),
                                              Icon(Icons.question_answer,
                                                  size: 20,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray10),
                                              const SizedBox(width: 24),
                                              Icon(Icons.send,
                                                  size: 20,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray10),
                                              Expanded(
                                                  child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(Icons.bookmark,
                                                    size: 20,
                                                    color: _isDark
                                                        ? XelaColor.Gray6
                                                        : XelaColor.Gray10),
                                              ))
                                            ],
                                          )),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("5,486 views",
                                                  style:
                                                      XelaTextStyle.xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                              Row(
                                                children: [
                                                  Text("Liked by ",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8)),
                                                  Text(
                                                      "Jenny Wilson and 159 others",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))
                                                ],
                                              )
                                            ],
                                          )),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                              "The Parrot's Evolutionary Past... (More)",
                                              style: XelaTextStyle
                                                      .xelaButtonMedium
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2))),
                                      const SizedBox(height: 4),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text("Dec 4, 2021 21:42",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))),
                                      const SizedBox(height: 8),
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
                                  width: MediaQuery.of(context).size.width - 32,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      border: Border.all(
                                          color: _isDark
                                              ? Colors.transparent
                                              : XelaColor.Gray11)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Row(
                                          children: [
                                            XelaUserAvatar(
                                                image: Image.asset(
                                                    "assets/images/user_avatar-1.png"),
                                                style: XelaUserAvatarStyle
                                                    .RECTANGLE,
                                                size:
                                                    XelaUserAvatarSize.MEDIUM),
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Darlene Robertson",
                                                    style: XelaTextStyle
                                                            .xelaButtonMedium
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                Text("Naples, Italy",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8))
                                              ],
                                            )),
                                            const SizedBox(width: 12),
                                            Icon(Icons.more_vert,
                                                size: 15,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                64,
                                            child: Image.asset(
                                              "assets/images/soc-3.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(Icons.play_arrow,
                                                    size: 20,
                                                    color: Colors.white),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text("2:56",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: Colors
                                                                  .white)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.favorite,
                                                  size: 20,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray10),
                                              const SizedBox(width: 24),
                                              Icon(Icons.chat,
                                                  size: 20,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray10),
                                              const SizedBox(width: 24),
                                              Icon(Icons.send,
                                                  size: 20,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray10),
                                              Expanded(
                                                  child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(Icons.bookmark,
                                                    size: 20,
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2),
                                              ))
                                            ],
                                          )),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Liked by ",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8)),
                                                  Text(
                                                      "Jenny Wilson and 852 others",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))
                                                ],
                                              )
                                            ],
                                          )),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                              "The Parrot's Evolutionary Past... (More)",
                                              style: XelaTextStyle
                                                      .xelaButtonMedium
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2))),
                                      const SizedBox(height: 4),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text("Nov 22, 2021 15:36",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 24)
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

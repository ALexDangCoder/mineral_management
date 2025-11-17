import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class SocialMediaCards extends StatefulWidget {
  @override
  _SocialMediaCardsState createState() => _SocialMediaCardsState();
}

class _SocialMediaCardsState extends State<SocialMediaCards> {
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
                    Expanded(
                        child: Text("Social Media Cards",
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
                          width: 342,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  XelaUserAvatar(
                                      image:
                                          Image.asset("assets/images/ps.png"),
                                      style: XelaUserAvatarStyle.RECTANGLE,
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
                                                          : XelaColor.Gray2)),
                                          const SizedBox(width: 8),
                                          XelaBadge(
                                              text: "New",
                                              background: XelaColor.Orange3,
                                              textColor: Colors.white)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text("u/shadknight20 • 19 hours ago",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: XelaColor.Gray8))
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
                              Text("Playstation is partnering with Discord.",
                                  style: XelaTextStyle.xelaButtonMedium.apply(
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2)),
                              const SizedBox(height: 16),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 320,
                                    height: 174,
                                    child: FittedBox(
                                      child: Image.asset(
                                          "assets/images/soc-1.png"),
                                    ),
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
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2))
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
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_drop_up,
                                            size: 15,
                                            color: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2),
                                        const SizedBox(width: 16),
                                        Text("1.4k",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
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
                          width: 342,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  children: [
                                    XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/user_avatar.png"),
                                        style: XelaUserAvatarStyle.CIRCLE,
                                        size: XelaUserAvatarSize.MEDIUM),
                                    const SizedBox(width: 12),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Dianne Russell",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        Text("Oslo, Norway",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 326,
                                    height: 320,
                                    child: FittedBox(
                                      child: Image.asset(
                                          "assets/images/soc-2.png"),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite,
                                          size: 20, color: XelaColor.Red3),
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
                                        alignment: Alignment.centerRight,
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
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("5,486 views",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      Row(
                                        children: [
                                          Text("Liked by ",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8)),
                                          Text("Jenny Wilson and 159 others",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2))
                                        ],
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 12),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                      "The Parrot's Evolutionary Past... (More)",
                                      style:
                                          XelaTextStyle.xelaButtonMedium.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))),
                              const SizedBox(height: 4),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Dec 4, 2021 21:42",
                                      style: XelaTextStyle.xelaCaption.apply(
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
                          width: 342,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  children: [
                                    XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/user_avatar-1.png"),
                                        style: XelaUserAvatarStyle.RECTANGLE,
                                        size: XelaUserAvatarSize.MEDIUM),
                                    const SizedBox(width: 12),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Darlene Robertson",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        Text("Naples, Italy",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    width: 326,
                                    height: 200,
                                    child: FittedBox(
                                      child: Image.asset(
                                          "assets/images/soc-3.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.play_arrow,
                                            size: 20, color: Colors.white),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text("2:56",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                        alignment: Alignment.centerRight,
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
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Liked by ",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8)),
                                          Text("Jenny Wilson and 852 others",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2))
                                        ],
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 12),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                      "The Parrot's Evolutionary Past... (More)",
                                      style:
                                          XelaTextStyle.xelaButtonMedium.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))),
                              const SizedBox(height: 4),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Nov 22, 2021 15:36",
                                      style: XelaTextStyle.xelaCaption.apply(
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
                          width: 342,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Row(
                                  children: [
                                    XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/user_avatar-2.png"),
                                        style: XelaUserAvatarStyle.CIRCLE,
                                        size: XelaUserAvatarSize.MEDIUM),
                                    const SizedBox(width: 12),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Roberta Fox",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        Text("@userName",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
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
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: 342,
                                    height: 200,
                                    child: FittedBox(
                                      child:
                                          Image.asset("assets/images/sc-4.png"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                    "The RTX 3080 Ti now has a rumoured   June 3 release date.",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2)),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                    "Nvidia GeForce RTX 3080 Ti: When will it launch, how much will it cost, and how will it perform?",
                                    style: XelaTextStyle.xelaSmallBody.apply(
                                        color: _isDark
                                            ? XelaColor.Gray10
                                            : XelaColor.Gray4)),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text("#NVIDIA #RTX3080 #GraphicsCard",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Blue6
                                            : XelaColor.Blue3)),
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border,
                                              size: 20, color: XelaColor.Gray6),
                                          const SizedBox(width: 8),
                                          Text("1.6k",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6))
                                        ],
                                      ),
                                      const SizedBox(width: 24),
                                      Row(
                                        children: [
                                          Icon(Icons.question_answer,
                                              size: 20, color: XelaColor.Gray6),
                                          const SizedBox(width: 8),
                                          Text("2.3k",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6))
                                        ],
                                      ),
                                      const SizedBox(width: 24),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.bookmark,
                                            size: 20,
                                            color: _isDark
                                                ? XelaColor.Blue6
                                                : XelaColor.Blue3),
                                      ))
                                    ],
                                  )),
                              const SizedBox(height: 12),
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
                          width: 342,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _isDark ? XelaColor.Gray2 : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Row(
                                  children: [
                                    XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/user_avatar-3.png"),
                                        style: XelaUserAvatarStyle.CIRCLE,
                                        size: XelaUserAvatarSize.MEDIUM),
                                    const SizedBox(width: 12),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("r/technology",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
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
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                    "PlayStation is partnering with Discord. \"Popular communication service will integrate with your social experience on PlayStation beginning early next year\"",
                                    style: XelaTextStyle.xelaButtonMedium.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2)),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text("Posted by u/zzill6 • 12 hours ago",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray8)),
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border,
                                              size: 20,
                                              color: _isDark
                                                  ? XelaColor.Gray10
                                                  : XelaColor.Gray6),
                                          const SizedBox(width: 8),
                                          Text("1.6k",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? XelaColor.Gray10
                                                          : XelaColor.Gray6))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.question_answer,
                                              size: 20,
                                              color: _isDark
                                                  ? XelaColor.Gray10
                                                  : XelaColor.Gray6),
                                          const SizedBox(width: 8),
                                          Text("2.3k",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? XelaColor.Gray10
                                                          : XelaColor.Gray6))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.share,
                                              size: 20,
                                              color: _isDark
                                                  ? XelaColor.Gray10
                                                  : XelaColor.Gray6),
                                          const SizedBox(width: 8),
                                          Text("Share",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: _isDark
                                                          ? XelaColor.Gray10
                                                          : XelaColor.Gray6))
                                        ],
                                      ),
                                    ],
                                  )),
                              const SizedBox(height: 12),
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

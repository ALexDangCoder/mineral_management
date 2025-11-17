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

class UsersList1 extends StatefulWidget {
  @override
  _UsersList1State createState() => _UsersList1State();
}

class FavoriteUser {
  String name;
  XelaUserAvatar avatar;

  FavoriteUser({required this.name, required this.avatar});
}

class _UsersList1State extends State<UsersList1> {
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

  List<FavoriteUser> favorites = [];

  @override
  Widget build(BuildContext context) {
    favorites = [
      FavoriteUser(
          name: "Leslie",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar1.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Kristin",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar2.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
            decoration: XelaUserAvatarDecoration.INDICATOR,
            decorationPosition: XelaUserAvatarDecorationPosition.BOTTOMRIGHT,
            decorationBorderColor: _isDark ? XelaColor.Gray1 : Colors.white,
            decorationBackground: _isDark ? XelaColor.Green1 : XelaColor.Green3,
          )),
      FavoriteUser(
          name: "Gladys",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar3.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Darlene",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar4.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
            decoration: XelaUserAvatarDecoration.COUNTER,
            count: 21,
            decorationPosition: XelaUserAvatarDecorationPosition.BOTTOMRIGHT,
            decorationBackground: _isDark ? XelaColor.Red4 : XelaColor.Red3,
            decorationForeground: Colors.white,
          )),
      FavoriteUser(
          name: "Darrell",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar5.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Arthur",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar6.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "John",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar7.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Betts",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar8.png"),
            size: XelaUserAvatarSize.MEDIUM,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
    ];

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
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      ),
                    ),
                    Expanded(
                        child: Text("Chats",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2))),
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
                  alignment: Alignment.bottomRight,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("Favorites",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray10
                                                    : XelaColor.Gray2))
                                  ],
                                )),
                            SizedBox(
                                height: 104,
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: favorites.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 24 : 0,
                                          right: index == favorites.length - 1
                                              ? 24
                                              : 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          favorites[index].avatar,
                                          const SizedBox(height: 8),
                                          Text(favorites[index].name,
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray8))
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("Contacts",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray10
                                                    : XelaColor.Gray2))
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 16, bottom: 24),
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
                                              Expanded(
                                                  child: Text(
                                                      "Charolette Hanlin",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 1,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text("How are you?",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("08:00",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text("Phyllis Godley",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "I'll be there in 2 mins",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("5/27/15",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text("Brittni Lando",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "just ideas for next time",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("07:12",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text(
                                                      "Maryland Winkles",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text("perfect!",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("00:03",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text(
                                                      "Leatrice Handler",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "Haha that's terrifying 😂",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("12:34",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text(
                                                      "Charolette Hanlin",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 1,
                                                child: XelaBadge(
                                                    text: "6",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text("How are you?",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("08:00",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text("Phyllis Godley",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "I'll be there in 2 mins",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("5/27/15",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
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
                                              Expanded(
                                                  child: Text("Garry Rentty",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2))),
                                              Opacity(
                                                opacity: 0,
                                                child: XelaBadge(
                                                    text: "3",
                                                    background: _isDark
                                                        ? XelaColor.Red4
                                                        : XelaColor.Red3,
                                                    textColor: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      "just ideas for next time",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: XelaColor
                                                                  .Gray8))),
                                              Text("07:12",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray8))
                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 24, bottom: 48),
                        child: XelaButton(
                          onPressed: () {},
                          leftIcon: const Icon(Icons.add,
                              size: 20, color: Colors.white),
                          background:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        ))
                  ],
                ))
              ],
            )));
  }
}

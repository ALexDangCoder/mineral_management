import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class UsersList2 extends StatefulWidget {
  const UsersList2({super.key});

  @override
  _UsersList2State createState() => _UsersList2State();
}

class FavoriteUser {
  String name;
  XelaUserAvatar avatar;

  FavoriteUser({required this.name, required this.avatar});
}

class _UsersList2State extends State<UsersList2> {
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
                        child: Text("Calls",
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
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            XelaTextField(
                              placeholder: "Search for calls",
                              leftIcon: Icon(Icons.search,
                                  size: 20,
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background: Colors.transparent,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: XelaColor.Blue6,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Icon(Icons.notifications_off,
                                        size: 15, color: Colors.white),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaToggle(
                                    onToggle: (status) {},
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Don’t disturb me",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        Text("Snooze all incoming calls",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray6))
                                      ],
                                    ),
                                    onBackground: XelaColor.Blue5,
                                    offBackground: _isDark
                                        ? XelaColor.Gray3
                                        : XelaColor.Gray10,
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                const Icon(Icons.north_west,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar10.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Roselle Ehrman",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("2 mon ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_east,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar9.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Johnsie Jock",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("5 hours ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_west,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  initials: "BL",
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                  background: XelaColor.Blue10,
                                  foreground: XelaColor.Blue3,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Text("1 mon ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_west,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar8.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Lauralee Quintero",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("15 min ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_east,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar7.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Elanor Pera",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("2 week ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_east,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar6.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Kylee Danford",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("5 mon ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_west,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  image:
                                      Image.asset("assets/images/avatar5.png"),
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Roselle Ehrman",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("5 mon ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.north_east,
                                    size: 15, color: XelaColor.Gray6),
                                const SizedBox(width: 16),
                                XelaUserAvatar(
                                  initials: "GR",
                                  size: XelaUserAvatarSize.MEDIUM,
                                  style: XelaUserAvatarStyle.RECTANGLE,
                                  background: XelaColor.Orange10,
                                  foreground: XelaColor.Orange3,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Roselle Ehrman",
                                                style: XelaTextStyle
                                                        .xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("2 mon ago",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8))
                                      ],
                                    ),
                                  ],
                                ))
                              ],
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

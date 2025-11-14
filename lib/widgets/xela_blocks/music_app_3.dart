import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MusicApp3 extends StatefulWidget {
  @override
  _MusicApp3State createState() => _MusicApp3State();
}

class FavoriteUser {
  String name;
  XelaUserAvatar avatar;

  FavoriteUser({required this.name, required this.avatar});
}

class _MusicApp3State extends State<MusicApp3> {
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
          name: "Curren\$y",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar1.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Eza",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar3.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Ed Sheeran",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar5.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Cardi B",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar6.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Bad Bunny",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar7.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
      FavoriteUser(
          name: "Johhan",
          avatar: XelaUserAvatar(
            image: Image.asset("assets/images/avatar8.png"),
            size: XelaUserAvatarSize.LARGE,
            style: XelaUserAvatarStyle.RECTANGLE,
          )),
    ];

    List<String> newReleasesList = [
      "assets/images/m-1.png",
      "assets/images/m-2.png",
      "assets/images/m-3.png",
      "assets/images/m-4.png",
      "assets/images/m-6.png",
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
                        child: Text("Browse Music",
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
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("Popular artists",
                                        style: XelaTextStyle.xelaBodyBold.apply(
                                            color: _isDark
                                                ? XelaColor.Gray10
                                                : XelaColor.Gray2))
                                  ],
                                )),
                            SizedBox(
                                height: 120,
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
                                              : 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          favorites[index].avatar,
                                          const SizedBox(height: 8),
                                          Text(favorites[index].name,
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6))
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 8, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("New Releases",
                                        style: XelaTextStyle.xelaBodyBold.apply(
                                            color: _isDark
                                                ? XelaColor.Gray10
                                                : XelaColor.Gray2))
                                  ],
                                )),
                            SizedBox(
                                height: 176,
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: newReleasesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 24 : 0,
                                          right: index ==
                                                  newReleasesList.length - 1
                                              ? 24
                                              : 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 144,
                                            height: 144,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            child: FittedBox(
                                              child: Image.asset(
                                                  newReleasesList[index]),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("Top weekly",
                                        style: XelaTextStyle.xelaBodyBold.apply(
                                            color: _isDark
                                                ? XelaColor.Gray10
                                                : XelaColor.Gray2)),
                                    const Spacer(),
                                    Text("View all",
                                        style: XelaTextStyle.xelaBodyBold.apply(
                                            color: _isDark
                                                ? XelaColor.Blue6
                                                : XelaColor.Blue3)),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 16, bottom: 24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray4)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.trending_up,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray8),
                                      const SizedBox(width: 8),
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/m-1.png"),
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
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Baby One More Time",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  Text(
                                                      "Hedwig and the Angry Inch",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? XelaColor
                                                                      .Gray6
                                                                  : XelaColor
                                                                      .Gray8))
                                                ],
                                              )),
                                              Icon(Icons.more_horiz,
                                                  size: 15,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray4)
                                            ],
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text("2",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray4)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.trending_down,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray8),
                                      const SizedBox(width: 8),
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/m-2.png"),
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
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("It's My Life",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  Text("DJay",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? XelaColor
                                                                      .Gray6
                                                                  : XelaColor
                                                                      .Gray8))
                                                ],
                                              )),
                                              Icon(Icons.more_horiz,
                                                  size: 15,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray4)
                                            ],
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text("3",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray4)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.trending_up,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray8),
                                      const SizedBox(width: 8),
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/m-3.png"),
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
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Bad Ideas",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  Text("Dorothy Vallens",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? XelaColor
                                                                      .Gray6
                                                                  : XelaColor
                                                                      .Gray8))
                                                ],
                                              )),
                                              Icon(Icons.more_horiz,
                                                  size: 15,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray4)
                                            ],
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text("4",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray4)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.trending_up,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray8),
                                      const SizedBox(width: 8),
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/m-4.png"),
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
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Time",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  Text("Curren\$y",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? XelaColor
                                                                      .Gray6
                                                                  : XelaColor
                                                                      .Gray8))
                                                ],
                                              )),
                                              Icon(Icons.more_horiz,
                                                  size: 15,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray4)
                                            ],
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text("5",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray8
                                                      : XelaColor.Gray4)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.trending_down,
                                          size: 20,
                                          color: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray8),
                                      const SizedBox(width: 8),
                                      XelaUserAvatar(
                                        image: Image.asset(
                                            "assets/images/m-6.png"),
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
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Baby ",
                                                      style: XelaTextStyle
                                                              .xelaButtonMedium
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                                  Text("Angry Inch",
                                                      style: XelaTextStyle
                                                              .xelaCaption
                                                          .apply(
                                                              color: _isDark
                                                                  ? XelaColor
                                                                      .Gray6
                                                                  : XelaColor
                                                                      .Gray8))
                                                ],
                                              )),
                                              Icon(Icons.more_horiz,
                                                  size: 15,
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray4)
                                            ],
                                          ),
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
                  ],
                ))
              ],
            )));
  }
}

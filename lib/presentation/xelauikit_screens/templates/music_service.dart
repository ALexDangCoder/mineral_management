import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/music_service_menu.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MusicService extends StatefulWidget {
  @override
  _MusicServiceState createState() => _MusicServiceState();
}

class NewReleaseUser {
  String title;
  String image;
  String label;

  NewReleaseUser(
      {required this.title, required this.image, required this.label});
}

class _MusicServiceState extends State<MusicService> {
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
    List<NewReleaseUser> newReleasesList = [
      NewReleaseUser(
          title: "It's My Life",
          image: "assets/images/m-1.png",
          label: "Marlon Craft"),
      NewReleaseUser(
          title: "Wonderful Tonight",
          image: "assets/images/m-2.png",
          label: "Felly"),
      NewReleaseUser(
          title: "Out of My Mine",
          image: "assets/images/m-3.png",
          label: "TOBi"),
      NewReleaseUser(
          title: "Mine", image: "assets/images/m-4.png", label: "Curren\$y"),
      NewReleaseUser(
          title: "Baby One More Time",
          image: "assets/images/m-6.png",
          label: "Ty Dollar Sign"),
    ];

    return Scaffold(
        backgroundColor: _isDark ? Colors.black : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
                  child: Row(
                    children: [
                      const SizedBox(width: 4),
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
                      RawMaterialButton(
                        elevation: 0,
                        focusElevation: 2,
                        highlightElevation: 0,
                        fillColor: Colors.transparent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MusicServiceMenu()),
                          );
                        },
                        constraints: const BoxConstraints(),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(Icons.menu,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
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
                        padding: const EdgeInsets.only(right: 16),
                        child: XelaUserAvatar(
                          image: Image.asset("assets/images/user_avatar.png"),
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.BOTTOMRIGHT,
                          decorationBackground: XelaColor.Orange3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            Padding(
                                padding: const EdgeInsets.all(16),
                                child: XelaTextField(
                                  placeholder: "Search anythings...",
                                  rightIcon: Icon(Icons.search,
                                      size: 20,
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                  borderDefaultColor: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11,
                                  background: Colors.transparent,
                                  textfieldColor: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2,
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 8, left: 24, right: 24),
                                child: Row(
                                  children: [
                                    Text("New Releases",
                                        style: XelaTextStyle.xelaHeadline.apply(
                                            color: _isDark
                                                ? XelaColor.Gray10
                                                : XelaColor.Gray2))
                                  ],
                                )),
                            SizedBox(
                                height: 236,
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
                                                  newReleasesList[index].image),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            newReleasesList[index].title,
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2),
                                          ),
                                          Text(
                                            newReleasesList[index].label,
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8),
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
                                    Text("Top charts",
                                        style: XelaTextStyle.xelaHeadline.apply(
                                            color: _isDark
                                                ? XelaColor.Gray10
                                                : XelaColor.Gray2)),
                                    const Spacer(),
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
                            ),
                            const SizedBox(height: 72),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 72,
                      padding: const EdgeInsets.all(8),
                      color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                child: Image.asset("assets/images/mus-1-1.png"),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Find our way",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2)),
                                Text("Being As An Ocean",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray8)),
                              ],
                            )),
                            const SizedBox(width: 24),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      width: 2)),
                              child: Icon(Icons.play_arrow,
                                  size: 24,
                                  color:
                                      _isDark ? Colors.white : XelaColor.Gray2),
                            ),
                            const SizedBox(width: 24),
                            Icon(Icons.skip_next,
                                size: 30,
                                color:
                                    _isDark ? Colors.white : XelaColor.Gray2),
                            const SizedBox(width: 16),
                          ]),
                    )
                  ],
                ))
              ],
            )));
  }
}

import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MusicServiceMenu extends StatefulWidget {
  @override
  _MusicServiceMenuState createState() => _MusicServiceMenuState();
}

class _MusicServiceMenuState extends State<MusicServiceMenu> {
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
                            Row(
                              children: [
                                const Spacer(),
                                XelaUserAvatar(
                                    image: Image.asset(
                                        "assets/images/user_avatar.png"),
                                    size: XelaUserAvatarSize.LARGE),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text("Edwin Martins",
                                style: XelaTextStyle.xelaBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            Text("jessica.hanson@example.com",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: XelaColor.Gray8)),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: XelaDivider(
                                  style: XelaDividerStyle.DOTTED,
                                  color: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Home",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.grid_view,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Browse",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Albums",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.supervisor_account,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Artists",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("My Account",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(color: XelaColor.Gray6))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.notifications,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Recently Played",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.favorite,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Favorites",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Recommended",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.folder,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Local files",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Playlists",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(color: XelaColor.Gray6)),
                                    const Spacer(),
                                    Icon(Icons.add,
                                        size: 16,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("HYPEBEAST",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("West Coast Hip-Hop",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Beat MODE",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Ill Lyricsist",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Good Vibes",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Rap Caviar",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.library_music,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Text("Good Vibes",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)))
                                  ],
                                ),
                              ),
                            ),
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

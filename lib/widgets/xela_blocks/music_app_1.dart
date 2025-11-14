import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MusicApp1 extends StatefulWidget {
  @override
  _MusicApp1State createState() => _MusicApp1State();
}

class _MusicApp1State extends State<MusicApp1> {
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
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Now Playing",
                      style: XelaTextStyle.xelaBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2),
                      textAlign: TextAlign.center,
                    )),
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
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 52, vertical: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset("assets/images/mus-1.png"),
                        ),
                      ),
                    ),
                    Text("Let Me Be Your Superhero",
                        style: XelaTextStyle.xelaBodyBold.apply(
                            color: _isDark ? Colors.white : XelaColor.Gray2)),
                    Text("Smash Into Pieces",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray8)),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray10,
                                borderRadius: BorderRadius.circular(99)),
                          ),
                          Container(
                            height: 4,
                            width: 130,
                            decoration: BoxDecoration(
                                color: _isDark ? Colors.white : XelaColor.Gray2,
                                borderRadius: BorderRadius.circular(99)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 124),
                              child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2,
                                      shape: BoxShape.circle))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("16:44",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray8)),
                          Text("3:02:05",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray8)),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_border,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray5 : XelaColor.Gray8),
                          const SizedBox(width: 32),
                          Icon(Icons.skip_previous,
                              size: 30,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          const SizedBox(width: 32),
                          Container(
                            alignment: Alignment.center,
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: _isDark ? Colors.white : XelaColor.Gray2,
                                shape: BoxShape.circle),
                            child: Icon(Icons.play_arrow,
                                size: 30,
                                color:
                                    _isDark ? XelaColor.Gray2 : Colors.white),
                          ),
                          const SizedBox(width: 32),
                          Icon(Icons.skip_next,
                              size: 30,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          const SizedBox(width: 32),
                          Icon(Icons.loop,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray5 : XelaColor.Gray8),
                        ],
                      ),
                    ),
                    Center(
                      child: Text("Next",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray8)),
                    ),
                    Center(
                      child: Text("Just Close Your Eyes - Fivefold",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray8)),
                    ),
                    const SizedBox(height: 24),
                    Icon(Icons.expand_less,
                        size: 15,
                        color: _isDark ? Colors.white : XelaColor.Gray2),
                    Center(
                      child: Text("More",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: _isDark ? Colors.white : XelaColor.Gray2)),
                    ),
                    const SizedBox(height: 24),
                  ],
                ))
              ],
            )));
  }
}

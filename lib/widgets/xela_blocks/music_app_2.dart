import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_slider_input.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MusicApp2 extends StatefulWidget {
  @override
  _MusicApp2State createState() => _MusicApp2State();
}

class _MusicApp2State extends State<MusicApp2> {
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
                        child: Text(
                      "Equalizer",
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
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Preset",
                                    style: XelaTextStyle.xelaBodyBold.apply(
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2)),
                                XelaButton(
                                    onPressed: () {},
                                    text: "Rock",
                                    size: XelaButtonSize.SMALL,
                                    type: XelaButtonType.SECONDARY,
                                    background: Colors.transparent,
                                    defaultBorderColor: _isDark
                                        ? XelaColor.Gray3
                                        : XelaColor.Gray11,
                                    foregroundColor: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 24),
                                  height: 225,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("+12db",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray8)),
                                      Text("0db",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray8)),
                                      Text("-12db",
                                          style:
                                              XelaTextStyle.xelaCaption.apply(
                                                  color: _isDark
                                                      ? XelaColor.Gray6
                                                      : XelaColor.Gray8)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.only(bottom: 30),
                                  height: 218,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      for (var i = -12; i <= 12; i++)
                                        Container(
                                          width: i % 6 == 0 ? 8.0 : 4.0,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("50",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      width: 32,
                                      height: 250,
                                      child: XelaSliderInput(
                                        value: 0,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("100",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      height: 250,
                                      width: 32,
                                      child: XelaSliderInput(
                                        value: -10,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("200",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      height: 250,
                                      width: 32,
                                      child: XelaSliderInput(
                                        value: -6,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("250",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      height: 250,
                                      width: 32,
                                      child: XelaSliderInput(
                                        value: 0,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("500",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      height: 250,
                                      width: 32,
                                      child: XelaSliderInput(
                                        value: 6,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("1k",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: _isDark
                                                ? XelaColor.Gray6
                                                : XelaColor.Gray8)),
                                    Container(
                                      height: 250,
                                      width: 32,
                                      child: XelaSliderInput(
                                        value: 0,
                                        min: -12,
                                        max: 12,
                                        vertical: true,
                                        primaryColor: XelaColor.Green,
                                        secondaryColor: _isDark
                                            ? XelaColor.Gray3
                                            : XelaColor.Gray11,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray8
                                    : XelaColor.Gray11),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: XelaToggle(
                              onToggle: (status) {},
                              content: Text("Effects",
                                  style: XelaTextStyle.xelaBodyBold.apply(
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2)),
                              onBackground:
                                  _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                              offBackground:
                                  _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                              circleOnColor:
                                  _isDark ? XelaColor.Gray11 : Colors.white,
                              circleOffColor:
                                  _isDark ? XelaColor.Gray8 : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text("Bass Boost",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: _isDark
                                        ? XelaColor.Gray6
                                        : XelaColor.Gray8),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: XelaSliderInput(
                              value: 21,
                              primaryColor: XelaColor.Green,
                              secondaryColor:
                                  _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0%",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Gray6
                                            : XelaColor.Gray8)),
                                Text("100%",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Gray6
                                            : XelaColor.Gray8))
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text("3D Effect",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: _isDark
                                        ? XelaColor.Gray6
                                        : XelaColor.Gray8),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: XelaSliderInput(
                              value: 50,
                              primaryColor: XelaColor.Green,
                              secondaryColor:
                                  _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0%",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Gray6
                                            : XelaColor.Gray8)),
                                Text("100%",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: _isDark
                                            ? XelaColor.Gray6
                                            : XelaColor.Gray8))
                              ],
                            ),
                          ),
                          const SizedBox(height: 96),
                        ],
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

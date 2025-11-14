import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
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

import 'job_details.dart';

class JobSearch extends StatefulWidget {
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? Colors.black : XelaColor.Gray12,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: _isDark ? Colors.black : XelaColor.Gray2),
                  child: Row(
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
                              size: 20, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo.png",
                              width: 103, height: 16, color: Colors.white)
                        ],
                      )),
                      const SizedBox(width: 8),
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
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: _isDark ? XelaColor.Gray1 : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  XelaTextField(
                                    placeholder: "Search",
                                    leftIcon: Icon(Icons.search,
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
                                  ),
                                  const SizedBox(height: 16),
                                  XelaButton(
                                    onPressed: () {},
                                    autoResize: false,
                                    text: "Search Jobs",
                                    background: _isDark
                                        ? XelaColor.Blue5
                                        : XelaColor.Blue3,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Advanced search",
                                          style: XelaTextStyle.xelaButtonMedium
                                              .apply(
                                                  color: _isDark
                                                      ? Colors.white
                                                      : XelaColor.Gray2)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.keyboard_arrow_down,
                                          size: 15,
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text("Results",
                                      style:
                                          XelaTextStyle.xelaSubheadline.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2)),
                                  const Spacer(),
                                  XelaButton(
                                    onPressed: () {},
                                    text: "Filters",
                                    leftIcon: Icon(Icons.tune,
                                        size: 15,
                                        color: _isDark
                                            ? Colors.white
                                            : XelaColor.Gray2),
                                    type: XelaButtonType.SECONDARY,
                                    background: Colors.transparent,
                                    foregroundColor: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2,
                                    defaultBorderColor: _isDark
                                        ? XelaColor.Gray3
                                        : XelaColor.Gray11,
                                    size: XelaButtonSize.SMALL,
                                    autoResize: true,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          XelaUserAvatar(
                                              size: XelaUserAvatarSize.LARGE,
                                              icon: Icon(Icons.android,
                                                  size: 20,
                                                  color: Colors.white),
                                              background: XelaColor.Blue3),
                                          const SizedBox(width: 16),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Fixed Income Specialist",
                                                  style:
                                                      XelaTextStyle.xelaBodyBold
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                              Text(
                                                  "2715 Ash Dr. San Jose, South Dakota 83475",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray6)),
                                            ],
                                          )),
                                          const SizedBox(width: 16),
                                          XelaButton(
                                            onPressed: () {},
                                            leftIcon: Icon(Icons.favorite,
                                                size: 15,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2),
                                            type: XelaButtonType.SECONDARY,
                                            background: Colors.transparent,
                                            foregroundColor: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2,
                                            defaultBorderColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            size: XelaButtonSize.SMALL,
                                            autoResize: true,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          XelaBadge(
                                              text: "Contract",
                                              background: _isDark
                                                  ? XelaColor.Gray8
                                                  : XelaColor.Gray11,
                                              textColor: _isDark
                                                  ? XelaColor.Gray3
                                                  : XelaColor.Gray3),
                                          const SizedBox(width: 16),
                                          XelaBadge(
                                              text: "Middle Level",
                                              background: _isDark
                                                  ? XelaColor.Purple8
                                                  : XelaColor.Purple11,
                                              textColor: _isDark
                                                  ? XelaColor.Purple1
                                                  : XelaColor.Purple3),
                                          const Spacer(),
                                          Text("2 minutes ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDetails()),
                                );
                              },
                            ),
                            InkWell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          XelaUserAvatar(
                                              size: XelaUserAvatarSize.LARGE,
                                              icon: Icon(Icons.memory,
                                                  size: 20,
                                                  color: Colors.white),
                                              background: XelaColor.Orange3),
                                          const SizedBox(width: 16),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Group Sales Manager",
                                                  style:
                                                      XelaTextStyle.xelaBodyBold
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                              Text(
                                                  "8502 Preston Rd. Inglewood, Maine 98380",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray6)),
                                            ],
                                          )),
                                          const SizedBox(width: 16),
                                          XelaButton(
                                            onPressed: () {},
                                            leftIcon: Icon(Icons.favorite,
                                                size: 15,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2),
                                            type: XelaButtonType.SECONDARY,
                                            background: Colors.transparent,
                                            foregroundColor: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2,
                                            defaultBorderColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            size: XelaButtonSize.SMALL,
                                            autoResize: true,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          XelaBadge(
                                              text: "Full Time",
                                              background: _isDark
                                                  ? XelaColor.Gray8
                                                  : XelaColor.Gray11,
                                              textColor: _isDark
                                                  ? XelaColor.Gray3
                                                  : XelaColor.Gray3),
                                          const SizedBox(width: 16),
                                          XelaBadge(
                                              text: "Senior Level",
                                              background: _isDark
                                                  ? XelaColor.Blue8
                                                  : XelaColor.Blue11,
                                              textColor: _isDark
                                                  ? XelaColor.Blue1
                                                  : XelaColor.Blue3),
                                          const Spacer(),
                                          Text("10 minutes ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDetails()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            InkWell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: _isDark
                                          ? XelaColor.Gray1
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          XelaUserAvatar(
                                              size: XelaUserAvatarSize.LARGE,
                                              icon: Icon(Icons.cloud,
                                                  size: 20,
                                                  color: Colors.white),
                                              background: XelaColor.Pink3),
                                          const SizedBox(width: 16),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Account Representative",
                                                  style:
                                                      XelaTextStyle.xelaBodyBold
                                                          .apply(
                                                              color: _isDark
                                                                  ? Colors.white
                                                                  : XelaColor
                                                                      .Gray2)),
                                              Text(
                                                  "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                                                  style: XelaTextStyle
                                                          .xelaCaption
                                                      .apply(
                                                          color:
                                                              XelaColor.Gray6)),
                                            ],
                                          )),
                                          const SizedBox(width: 16),
                                          XelaButton(
                                            onPressed: () {},
                                            leftIcon: Icon(Icons.favorite,
                                                size: 15,
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2),
                                            type: XelaButtonType.SECONDARY,
                                            background: Colors.transparent,
                                            foregroundColor: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2,
                                            defaultBorderColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            size: XelaButtonSize.SMALL,
                                            autoResize: true,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          XelaBadge(
                                              text: "Part Time",
                                              background: _isDark
                                                  ? XelaColor.Gray8
                                                  : XelaColor.Gray11,
                                              textColor: _isDark
                                                  ? XelaColor.Gray3
                                                  : XelaColor.Gray3),
                                          const SizedBox(width: 16),
                                          XelaBadge(
                                              text: "Entry Level",
                                              background: _isDark
                                                  ? XelaColor.Green8
                                                  : XelaColor.Green11,
                                              textColor: _isDark
                                                  ? XelaColor.Green1
                                                  : XelaColor.Green3),
                                          const Spacer(),
                                          Text("2 hours ago",
                                              style: XelaTextStyle.xelaCaption
                                                  .apply(
                                                      color: XelaColor.Gray6)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDetails()),
                                );
                              },
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

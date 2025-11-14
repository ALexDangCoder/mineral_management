import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_blocks/side_bar_2.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Mailbox extends StatefulWidget {
  @override
  _MailboxState createState() => _MailboxState();
}

class _MailboxState extends State<Mailbox> {
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
        backgroundColor: _isDark ? Colors.black : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 8 : 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                              size: 20,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
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
                            MaterialPageRoute(builder: (context) => SideBar2()),
                          );
                        },
                        constraints: const BoxConstraints(),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(Icons.menu,
                              size: 20,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                        ),
                      ),
                      Expanded(
                          child: XelaTextField(
                        placeholder: "Search anythings...",
                        rightIcon: Icon(Icons.search,
                            size: 20,
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        borderDefaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        background: Colors.transparent,
                        textfieldColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      )),
                      const SizedBox(width: 16),
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
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text("Inbox",
                                      style: XelaTextStyle.xelaHeadline.apply(
                                          color: _isDark
                                              ? Colors.white
                                              : XelaColor.Gray2)),
                                  const Spacer(),
                                  Text("1573 messages, 2 unread",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray6)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            size: XelaUserAvatarSize.MEDIUM,
                                            icon: Icon(Icons.android,
                                                size: 20, color: Colors.white),
                                            background: XelaColor.Blue3),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Wonka Industries",
                                                    style: XelaTextStyle
                                                            .xelaSmallBody
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const Spacer(),
                                                Text("12:28 AM",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            ),
                                            Text(
                                                "10 bizarre money habits making...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "@channel We’ve updated the open enrollment policies that our...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray11),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            size: XelaUserAvatarSize.MEDIUM,
                                            icon: Icon(Icons.memory,
                                                size: 20, color: Colors.white),
                                            background: XelaColor.Orange5),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.star,
                                                    size: 16,
                                                    color: XelaColor.Yellow3),
                                                const SizedBox(width: 4),
                                                Text("Leif Floyd",
                                                    style: XelaTextStyle
                                                            .xelaSmallBody
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const SizedBox(width: 8),
                                                Text("2",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                                const Spacer(),
                                                const Icon(Icons.bookmark,
                                                    size: 20,
                                                    color: XelaColor.Pink3),
                                                Text("12:36 PM",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            ),
                                            Text("As worn in the World Tour...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "Bummer I had to miss your presentation! I just got a chance...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray11),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            size: XelaUserAvatarSize.MEDIUM,
                                            icon: Icon(Icons.cloud,
                                                size: 20, color: Colors.white),
                                            background: XelaColor.Pink5),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("SP-holding",
                                                    style: XelaTextStyle
                                                            .xelaSmallBody
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const SizedBox(width: 8),
                                                Text("5",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                                const Spacer(),
                                                Text("1:26 AM",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            ),
                                            Text(
                                                "[WEEKEND ONLY] Get this NOW b...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "@MarvinMcKinney is the best person to ask. Marvin, can you...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray11),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            size: XelaUserAvatarSize.MEDIUM,
                                            icon: Icon(Icons.cloud,
                                                size: 20, color: Colors.white),
                                            background: XelaColor.Purple5),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Krusty Krab",
                                                    style: XelaTextStyle
                                                            .xelaSmallBody
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const Spacer(),
                                                Text("10:34 AM",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            ),
                                            Text("Idea hash tags for emails",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "I danced with Chuck Norris sliding down a hill because I can't co...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray11),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            size: XelaUserAvatarSize.MEDIUM,
                                            icon: Icon(Icons.plumbing,
                                                size: 20, color: Colors.white),
                                            background: XelaColor.Red5),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("David Oshodi",
                                                    style: XelaTextStyle
                                                            .xelaSmallBody
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                const Spacer(),
                                                Text("10:00 AM",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            ),
                                            Text(
                                                "Pairs nicely with spreadsheets",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "I rolled around a fireman while listening to Gangnam Style bec...",
                                                style: XelaTextStyle
                                                        .xelaSmallBody
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: XelaDivider(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray11),
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

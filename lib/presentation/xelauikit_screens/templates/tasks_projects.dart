import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_chart_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_chart.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TasksProjects extends StatefulWidget {
  @override
  _TasksProjectsState createState() => _TasksProjectsState();
}

class _TasksProjectsState extends State<TasksProjects> {
  bool _isDark = false;

  bool isShowDetails = false;

  @override
  void initState() {
    super.initState();
    selectedTab = tabs[0];
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  List<XelaTabItem> tabs = [
    XelaTabItem(id: 1, label: "To do"),
    XelaTabItem(id: 2, label: "Active"),
    XelaTabItem(id: 3, label: "Review"),
    XelaTabItem(id: 4, label: "Completed"),
  ];

  bool isOpen = false;

  late XelaTabItem selectedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
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
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Projects",
                                style: XelaTextStyle.xelaButtonLarge.apply(
                                    color:
                                    _isDark ? Colors.white : XelaColor.Gray2),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                      XelaButton(
                        onPressed: () {},
                        leftIcon: Icon(Icons.search,
                            size: 15,
                            color: _isDark ? Colors.white : XelaColor.Gray2),
                        type: XelaButtonType.SECONDARY,
                        background: Colors.transparent,
                        foregroundColor:
                        _isDark ? Colors.white : XelaColor.Gray2,
                        defaultBorderColor:
                        _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        size: XelaButtonSize.SMALL,
                        autoResize: true,
                      ),
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
                isShowDetails
                    ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text("184",
                              style: XelaTextStyle.xelaHeadline.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                          const SizedBox(width: 8),
                          Text("Projects",
                              style:
                              XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Container(
                            width: 120,
                            height: 120,
                            child: XelaChart(
                              height: 120,
                              doughnutStrokeWidth: 20,
                              type: XelaChartType.DOUGHNUT,
                              datasetsDoughnutChart: [
                                XelaDoughnutDataset(
                                    label: "Projects",
                                    data: [
                                      40,
                                      30,
                                      15,
                                      15
                                    ],
                                    fillColors: [
                                      XelaColor.Blue5,
                                      XelaColor.Purple5,
                                      XelaColor.Green2,
                                      XelaColor.Orange5
                                    ])
                              ],
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: XelaColor.Green2,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text("Active",
                                          style: XelaTextStyle.xelaButtonSmall
                                              .apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: XelaColor.Purple5,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text("Completed",
                                          style: XelaTextStyle.xelaButtonSmall
                                              .apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: XelaColor.Orange5,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text("Review",
                                          style: XelaTextStyle.xelaButtonSmall
                                              .apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: XelaColor.Blue5,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text("To do",
                                          style: XelaTextStyle.xelaButtonSmall
                                              .apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2))
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Text("7",
                              style: XelaTextStyle.xelaHeadline.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                          const SizedBox(width: 8),
                          Text("Teams",
                              style:
                              XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Green1),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(Icons.android,
                                  size: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Blue6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/apple.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Orange5),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/database.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Pink6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/figma.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Gray3),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/framer.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Purple6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/vue.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: XelaColor.Red6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  "assets/icons/ab-testing.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray4
                                        : XelaColor.Gray11)),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                color: _isDark
                                    ? XelaColor.Gray6
                                    : XelaColor.Gray2,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Text("23",
                              style: XelaTextStyle.xelaHeadline.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                          const SizedBox(width: 8),
                          Text("Members",
                              style:
                              XelaTextStyle.xelaSmallBodyBold.apply(
                                  color: _isDark
                                      ? Colors.white
                                      : XelaColor.Gray2)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset(
                                  "assets/images/avatar1.png")),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            initials: "CF",
                            background: XelaColor.Purple9,
                            foreground: XelaColor.Purple3,
                          ),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset(
                                  "assets/images/avatar2.png")),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 17,
                            ),
                            background: XelaColor.Blue7,
                          ),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset(
                                  "assets/images/avatar3.png")),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            initials: "GH",
                            background: XelaColor.Green8,
                            foreground: XelaColor.Green1,
                          ),
                          const SizedBox(width: 8),
                          XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            initials: "+17",
                            background: XelaColor.Gray4,
                            foreground: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray4
                                        : XelaColor.Gray11)),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                color: _isDark
                                    ? XelaColor.Gray6
                                    : XelaColor.Gray2,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32)
                    ],
                  ),
                )
                    : Container(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isShowDetails = !isShowDetails;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                            !isShowDetails
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            size: 15,
                            color: _isDark ? XelaColor.Blue6 : XelaColor.Blue3),
                        const SizedBox(width: 8),
                        Text(
                          !isShowDetails ? "Show Details" : "Hide Details",
                          style: XelaTextStyle.xelaCaption.apply(
                              color:
                              _isDark ? XelaColor.Blue6 : XelaColor.Blue3),
                        )
                      ],
                    ),
                  ),
                ),
                XelaTabs(
                  items: tabs,
                  tabsValue: 0,
                  bottomLineColor: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                  defaultBadgeBackground:
                  _isDark ? XelaColor.Gray3 : XelaColor.Gray8,
                  onChange: (tab) {
                    setState(() {
                      selectedTab = tab;
                    });
                  },
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
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: selectedTab.id == 1
                                                ? XelaColor.Blue6
                                                : selectedTab.id == 2
                                                ? XelaColor.Orange5
                                                : selectedTab.id == 3
                                                ? XelaColor.Purple5
                                                : XelaColor.Red5),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(selectedTab.label!,
                                          style:
                                          XelaTextStyle.xelaSmallBodyBold.apply(
                                              color: _isDark
                                                  ? Colors.white
                                                  : XelaColor.Gray2)),
                                      const Spacer(),
                                      XelaButton(
                                        onPressed: () {},
                                        text: "Priority",
                                        rightIcon: Icon(Icons.keyboard_arrow_down,
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
                                selectedTab.id == 1
                                    ? Tab1DataWidget()
                                    : selectedTab.id == 2
                                    ? Tab2DataWidget()
                                    : Tab3DataWidget()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            )));
  }

  Widget Tab1DataWidget() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "1",
                        background:
                        _isDark ? XelaColor.Blue8 : XelaColor.Blue11,
                        textColor: _isDark ? XelaColor.Blue1 : XelaColor.Blue3),
                    const SizedBox(width: 8),
                    Text("High",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                            _isDark ? XelaColor.Blue6 : XelaColor.Blue3)),
                    const Spacer(),
                    Text("June 26-28, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Management Activities Completed",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Discharge Insulating Concrete Forms",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar1.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar2.png"),
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "2",
                        background:
                        _isDark ? XelaColor.Orange8 : XelaColor.Orange11,
                        textColor:
                        _isDark ? XelaColor.Orange1 : XelaColor.Orange3),
                    const SizedBox(width: 8),
                    Text("Medium",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark
                                ? XelaColor.Orange6
                                : XelaColor.Orange3)),
                    const Spacer(),
                    Text("July 11, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Security Planning",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Supplement Grading",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar3.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar4.png"),
                              ),
                            ))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.chat,
                            size: 15, color: XelaColor.Gray6),
                        const SizedBox(width: 8),
                        Text("3",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray6))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "3",
                        background:
                        _isDark ? XelaColor.Green8 : XelaColor.Green11,
                        textColor:
                        _isDark ? XelaColor.Green1 : XelaColor.Green3),
                    const SizedBox(width: 8),
                    Text("Low",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                            _isDark ? XelaColor.Green6 : XelaColor.Green3)),
                    const Spacer(),
                    Text("August 1-2, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Documentation",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Repair Grinding and Shredding Equipment",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar5.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar6.png"),
                              ),
                            )),
                        Positioned(
                            right: -40,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar7.png"),
                              ),
                            ))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.chat,
                            size: 15, color: XelaColor.Gray6),
                        const SizedBox(width: 8),
                        Text("23",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray6))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }

  Widget Tab2DataWidget() {
    return Column(children: [
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  XelaBadge(
                      text: "3",
                      background:
                      _isDark ? XelaColor.Green8 : XelaColor.Green11,
                      textColor: _isDark ? XelaColor.Green1 : XelaColor.Green3),
                  const SizedBox(width: 8),
                  Text("Low",
                      style: XelaTextStyle.xelaCaption.apply(
                          color:
                          _isDark ? XelaColor.Green6 : XelaColor.Green3)),
                  const Spacer(),
                  Text("August 1-2, 2020",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Gray6))
                ],
              ),
              const SizedBox(height: 16),
              Text("Documentation",
                  style: XelaTextStyle.xelaBodyBold.apply(
                      color: _isDark ? Colors.white : XelaColor.Gray2)),
              Text("Repair Grinding and Shredding Equipment",
                  style:
                  XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _isDark
                                    ? XelaColor.Gray2
                                    : XelaColor.Gray12,
                                width: 2)),
                        child: XelaUserAvatar(
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                          image: Image.asset("assets/images/avatar5.png"),
                        ),
                      ),
                      Positioned(
                          right: -20,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray2
                                        : XelaColor.Gray12,
                                    width: 2)),
                            child: XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset("assets/images/avatar6.png"),
                            ),
                          )),
                      Positioned(
                          right: -40,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray2
                                        : XelaColor.Gray12,
                                    width: 2)),
                            child: XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset("assets/images/avatar7.png"),
                            ),
                          ))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.chat, size: 15, color: XelaColor.Gray6),
                      const SizedBox(width: 8),
                      Text("23",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray6))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  XelaBadge(
                      text: "1",
                      background: _isDark ? XelaColor.Blue8 : XelaColor.Blue11,
                      textColor: _isDark ? XelaColor.Blue1 : XelaColor.Blue3),
                  const SizedBox(width: 8),
                  Text("High",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Blue6 : XelaColor.Blue3)),
                  const Spacer(),
                  Text("June 26-28, 2020",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Gray6))
                ],
              ),
              const SizedBox(height: 16),
              Text("Management Activities Completed",
                  style: XelaTextStyle.xelaBodyBold.apply(
                      color: _isDark ? Colors.white : XelaColor.Gray2)),
              Text("Discharge Insulating Concrete Forms",
                  style:
                  XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _isDark
                                    ? XelaColor.Gray2
                                    : XelaColor.Gray12,
                                width: 2)),
                        child: XelaUserAvatar(
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                          image: Image.asset("assets/images/avatar1.png"),
                        ),
                      ),
                      Positioned(
                          right: -20,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray2
                                        : XelaColor.Gray12,
                                    width: 2)),
                            child: XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset("assets/images/avatar2.png"),
                            ),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  XelaBadge(
                      text: "2",
                      background:
                      _isDark ? XelaColor.Orange8 : XelaColor.Orange11,
                      textColor:
                      _isDark ? XelaColor.Orange1 : XelaColor.Orange3),
                  const SizedBox(width: 8),
                  Text("Medium",
                      style: XelaTextStyle.xelaCaption.apply(
                          color:
                          _isDark ? XelaColor.Orange6 : XelaColor.Orange3)),
                  const Spacer(),
                  Text("July 11, 2020",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Gray6))
                ],
              ),
              const SizedBox(height: 16),
              Text("Security Planning",
                  style: XelaTextStyle.xelaBodyBold.apply(
                      color: _isDark ? Colors.white : XelaColor.Gray2)),
              Text("Supplement Grading",
                  style:
                  XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _isDark
                                    ? XelaColor.Gray2
                                    : XelaColor.Gray12,
                                width: 2)),
                        child: XelaUserAvatar(
                          style: XelaUserAvatarStyle.CIRCLE,
                          size: XelaUserAvatarSize.SMALL,
                          image: Image.asset("assets/images/avatar3.png"),
                        ),
                      ),
                      Positioned(
                          right: -20,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _isDark
                                        ? XelaColor.Gray2
                                        : XelaColor.Gray12,
                                    width: 2)),
                            child: XelaUserAvatar(
                              style: XelaUserAvatarStyle.CIRCLE,
                              size: XelaUserAvatarSize.SMALL,
                              image: Image.asset("assets/images/avatar4.png"),
                            ),
                          ))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.chat, size: 15, color: XelaColor.Gray6),
                      const SizedBox(width: 8),
                      Text("3",
                          style: XelaTextStyle.xelaCaption.apply(
                              color: XelaColor.Gray6))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
    ]);
  }

  Widget Tab3DataWidget() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "2",
                        background:
                        _isDark ? XelaColor.Orange8 : XelaColor.Orange11,
                        textColor:
                        _isDark ? XelaColor.Orange1 : XelaColor.Orange3),
                    const SizedBox(width: 8),
                    Text("Medium",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark
                                ? XelaColor.Orange6
                                : XelaColor.Orange3)),
                    const Spacer(),
                    Text("July 11, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Security Planning",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Supplement Grading",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar3.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar4.png"),
                              ),
                            ))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.chat,
                            size: 15, color: XelaColor.Gray6),
                        const SizedBox(width: 8),
                        Text("3",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray6))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "3",
                        background:
                        _isDark ? XelaColor.Green8 : XelaColor.Green11,
                        textColor:
                        _isDark ? XelaColor.Green1 : XelaColor.Green3),
                    const SizedBox(width: 8),
                    Text("Low",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                            _isDark ? XelaColor.Green6 : XelaColor.Green3)),
                    const Spacer(),
                    Text("August 1-2, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Documentation",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Repair Grinding and Shredding Equipment",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar5.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar6.png"),
                              ),
                            )),
                        Positioned(
                            right: -40,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar7.png"),
                              ),
                            ))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.chat,
                            size: 15, color: XelaColor.Gray6),
                        const SizedBox(width: 8),
                        Text("23",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray6))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XelaBadge(
                        text: "1",
                        background:
                        _isDark ? XelaColor.Blue8 : XelaColor.Blue11,
                        textColor: _isDark ? XelaColor.Blue1 : XelaColor.Blue3),
                    const SizedBox(width: 8),
                    Text("High",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                            _isDark ? XelaColor.Blue6 : XelaColor.Blue3)),
                    const Spacer(),
                    Text("June 26-28, 2020",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Gray6))
                  ],
                ),
                const SizedBox(height: 16),
                Text("Management Activities Completed",
                    style: XelaTextStyle.xelaBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
                Text("Discharge Insulating Concrete Forms",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Gray6)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _isDark
                                      ? XelaColor.Gray2
                                      : XelaColor.Gray12,
                                  width: 2)),
                          child: XelaUserAvatar(
                            style: XelaUserAvatarStyle.CIRCLE,
                            size: XelaUserAvatarSize.SMALL,
                            image: Image.asset("assets/images/avatar1.png"),
                          ),
                        ),
                        Positioned(
                            right: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: _isDark
                                          ? XelaColor.Gray2
                                          : XelaColor.Gray12,
                                      width: 2)),
                              child: XelaUserAvatar(
                                style: XelaUserAvatarStyle.CIRCLE,
                                size: XelaUserAvatarSize.SMALL,
                                image: Image.asset("assets/images/avatar2.png"),
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
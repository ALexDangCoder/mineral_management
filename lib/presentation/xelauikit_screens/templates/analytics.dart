import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_chart_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_chart.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
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
                  decoration: const BoxDecoration(color: XelaColor.Blue5),
                  child: Row(
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
                              size: 20, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Statistics",
                              style: XelaTextStyle.xelaButtonLarge.apply(
                                  color: Colors.white))
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Users by devices",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        const Icon(Icons.more_horiz,
                                            size: 20, color: XelaColor.Gray6),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 160,
                                              child: XelaChart(
                                                height: 120,
                                                doughnutStrokeWidth: 32,
                                                type: XelaChartType.DOUGHNUT,
                                                datasetsDoughnutChart: [
                                                  XelaDoughnutDataset(
                                                      label: "Projects",
                                                      data: [
                                                        35,
                                                        25,
                                                        20,
                                                        15
                                                      ],
                                                      fillColors: [
                                                        XelaColor.Blue5,
                                                        XelaColor.Red5,
                                                        XelaColor.Yellow5,
                                                        XelaColor.Purple5
                                                      ])
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text("2846",
                                                    style: XelaTextStyle
                                                            .xelaSubheadline
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2)),
                                                Text("Total",
                                                    style: XelaTextStyle
                                                            .xelaCaption
                                                        .apply(
                                                            color: XelaColor
                                                                .Gray8)),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 48),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: XelaColor.Yellow5,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(Icons.smartphone,
                                              size: 14, color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Text("Mobile",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: XelaColor.Blue5,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(Icons.tablet_mac,
                                              size: 14, color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Text("Tablet",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: XelaColor.Red5,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(Icons.laptop,
                                              size: 14, color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Text("Laptop",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: XelaColor.Purple5,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(Icons.desktop_mac,
                                              size: 14, color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Text("Desktop PC",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? Colors.white
                                                        : XelaColor.Gray2)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Visitors",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        const Icon(Icons.settings,
                                            size: 20, color: XelaColor.Gray6),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("254,852",
                                                style:
                                                    XelaTextStyle.xelaHeadline
                                                        .apply(
                                                            color: _isDark
                                                                ? Colors.white
                                                                : XelaColor
                                                                    .Gray2))),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text("New / Returning",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                            Text("45,762 / 2,491",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color:
                                                            XelaColor.Gray6)),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    XelaChart(
                                      height: 160,
                                      type: XelaChartType.BAR,
                                      datasetsBarChart: [
                                        XelaBarChartDataset(
                                            label: "New visitors",
                                            data: [12, 10, 10, 10, 27, 27],
                                            fillColor: XelaColor.Blue6),
                                        XelaBarChartDataset(
                                            label: "Returning visitors",
                                            data: [10, 18, 23, 32, 15, 12],
                                            fillColor: XelaColor.Purple5),
                                      ],
                                      labels: const [
                                        "Apr",
                                        "May",
                                        "Jun",
                                        "Jul",
                                        "Aug",
                                        "Sep"
                                      ],
                                      afterData: "k",
                                      labelsColor: XelaColor.Gray6,
                                      chartBorderColor: Colors.transparent,
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  color: XelaColor.Blue6,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            const SizedBox(width: 8),
                                            Text("New visitors",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  color: XelaColor.Purple5,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            const SizedBox(width: 8),
                                            Text("Returning visitors",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Comments",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        Text("view all",
                                            style: XelaTextStyle.xelaButtonSmall
                                                .apply(color: XelaColor.Blue6))
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            image: Image.asset(
                                                "assets/images/avatar1.png")),
                                        const SizedBox(width: 16),
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
                                                    Text("James Friday",
                                                        style: XelaTextStyle
                                                                .xelaSmallBodyBold
                                                            .apply(
                                                                color: XelaColor
                                                                    .Blue5)),
                                                    Text("just commented on",
                                                        style: XelaTextStyle
                                                                .xelaCaption
                                                            .apply(
                                                                color: XelaColor
                                                                    .Gray8)),
                                                    Text(
                                                        "Analysing Potential Pro...",
                                                        style: XelaTextStyle
                                                                .xelaSmallBodyBold
                                                            .apply(
                                                                color: _isDark
                                                                    ? Colors
                                                                        .white
                                                                    : XelaColor
                                                                        .Gray2)),
                                                  ],
                                                )),
                                                const SizedBox(width: 16),
                                                const Icon(Icons.more_horiz,
                                                    size: 16,
                                                    color: XelaColor.Gray8),
                                              ],
                                            ),
                                            Text("5 minutes ago",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: XelaColor.Gray8))
                                          ],
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaUserAvatar(
                                            image: Image.asset(
                                                "assets/images/avatar2.png")),
                                        const SizedBox(width: 16),
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
                                                    Text("Oludayo Ayomide",
                                                        style: XelaTextStyle
                                                                .xelaSmallBodyBold
                                                            .apply(
                                                                color: XelaColor
                                                                    .Blue5)),
                                                    Text("just commented on",
                                                        style: XelaTextStyle
                                                                .xelaCaption
                                                            .apply(
                                                                color: XelaColor
                                                                    .Gray8)),
                                                    Text(
                                                        "How Good Is Your Prob...",
                                                        style: XelaTextStyle
                                                                .xelaSmallBodyBold
                                                            .apply(
                                                                color: _isDark
                                                                    ? Colors
                                                                        .white
                                                                    : XelaColor
                                                                        .Gray2)),
                                                  ],
                                                )),
                                                const SizedBox(width: 16),
                                                const Icon(Icons.more_horiz,
                                                    size: 16,
                                                    color: XelaColor.Gray8),
                                              ],
                                            ),
                                            Text("2 days ago",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: XelaColor.Gray8))
                                          ],
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Page Views",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        XelaButton(
                                          onPressed: () {},
                                          text: "Day",
                                          rightIcon: Icon(
                                              Icons.keyboard_arrow_down,
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
                                    const SizedBox(height: 24),
                                    XelaChart(
                                      height: 160,
                                      type: XelaChartType.LINE,
                                      datasetsLineChart: [
                                        XelaLineChartDataset(
                                            label: "Unique page views",
                                            data: [70, 210, 30, 150, 190],
                                            lineColor: XelaColor.Green2,
                                            pointColor: Colors.transparent,
                                            tension: 0.5),
                                        XelaLineChartDataset(
                                            label: "Bounce rate",
                                            data: [40, 50, 160, 110, 210],
                                            lineColor: XelaColor.Purple3,
                                            pointColor: Colors.transparent,
                                            tension: 0.5),
                                      ],
                                      labels: const [
                                        "02:00",
                                        "04:00",
                                        "06:00",
                                        "08:00",
                                        "10:00"
                                      ],
                                      dataStep: 50,
                                      labelsColor: XelaColor.Gray6,
                                      chartBorderColor: _isDark
                                          ? XelaColor.Gray3
                                          : XelaColor.Gray11,
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  color: XelaColor.Green2,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            const SizedBox(width: 8),
                                            Text("Unique page views",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  color: XelaColor.Purple3,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            const SizedBox(width: 8),
                                            Text("Bounce rate",
                                                style: XelaTextStyle.xelaCaption
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Referrals",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        const Icon(Icons.more_horiz,
                                            size: 15, color: XelaColor.Gray8)
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Text("Source",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8)),
                                        const Spacer(),
                                        Text("Users",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8)),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: _isDark
                                                  ? XelaColor.Gray2
                                                  : XelaColor.Gray12,
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          child: FittedBox(
                                            child: Image.asset(
                                                "assets/images/google-1.png"),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("google.com",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ),
                                        Text("45904",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
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
                                          width: 48,
                                          height: 48,
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: _isDark
                                                  ? XelaColor.Gray2
                                                  : XelaColor.Gray12,
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          child: FittedBox(
                                            child: Image.asset(
                                                "assets/images/fb-1.png"),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("facebook.com",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ),
                                        Text("20796",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
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
                                          width: 48,
                                          height: 48,
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: _isDark
                                                  ? XelaColor.Gray2
                                                  : XelaColor.Gray12,
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          child: FittedBox(
                                            child: Image.asset(
                                                "assets/images/ins-1.png"),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("instagram.com",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ),
                                        Text("50963",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
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
                                          width: 48,
                                          height: 48,
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: _isDark
                                                  ? XelaColor.Gray2
                                                  : XelaColor.Gray12,
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          child: FittedBox(
                                            child: Image.asset(
                                                "assets/images/pin-1.png"),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("pinterest.com",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: _isDark
                                                          ? Colors.white
                                                          : XelaColor.Gray2)),
                                        ),
                                        Text("93046",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _isDark
                                        ? XelaColor.Gray1
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text("Most Popular Pages",
                                                style: XelaTextStyle
                                                        .xelaSubheadline
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor
                                                                .Gray2))),
                                        const Icon(Icons.more_horiz,
                                            size: 15, color: XelaColor.Gray8)
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Text("Page",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8)),
                                        const Spacer(),
                                        Text("Unique page views",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray8)),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text("1",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("/en-en/p/products",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6)),
                                        ),
                                        Text("5948",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text("2",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("/en-en/p/signup",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6)),
                                        ),
                                        Text("6025",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text("3",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("/en-en/p/home",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6)),
                                        ),
                                        Text("1439",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text("4",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2)),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text("/en-en/p/login",
                                              style: XelaTextStyle
                                                      .xelaSmallBodyBold
                                                  .apply(
                                                      color: XelaColor.Blue6)),
                                        ),
                                        Text("8861",
                                            style:
                                                XelaTextStyle.xelaSmallBodyBold
                                                    .apply(
                                                        color: _isDark
                                                            ? Colors.white
                                                            : XelaColor.Gray2))
                                      ],
                                    ),
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

import 'package:bnv_opendata/domain/models/xela_chart_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_chart.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ChartsComponent extends StatefulWidget {
  const ChartsComponent({Key? key}) : super(key: key);

  @override
  _ChartsComponentState createState() => _ChartsComponentState();
}

class _ChartsComponentState extends State<ChartsComponent> {
  bool _isDark = false;

  List<XelaLineChartDataset> lineChartData = [
    XelaLineChartDataset(
        label: "Today",
        data: [5, 18, 12, 9, 13],
        lineColor: XelaColor.Pink3,
        fillColor: Colors.transparent,
        pointColor: Colors.transparent,
        pointColorBackground: Colors.transparent,
        tension: 0.5),
    XelaLineChartDataset(
        label: "Yesterday",
        data: [10, 3, 10, 10, 13],
        lineColor: XelaColor.Blue3,
        fillColor: Colors.transparent,
        pointColor: Colors.transparent,
        pointColorBackground: Colors.transparent,
        tension: 0.5),
  ];

  List<XelaBarChartDataset> barChartData = [
    XelaBarChartDataset(
      label: "Today",
      data: [5, 10, 5, 12, 13],
      fillColor: XelaColor.Blue,
    ),
    XelaBarChartDataset(
      label: "Yesterday",
      data: [3, 18, 12, 9, 13],
      fillColor: XelaColor.Pink,
    ),
    XelaBarChartDataset(
      label: "Yesterday",
      data: [8, 10, 4, 9, 4],
      fillColor: XelaColor.Yellow,
    ),
    XelaBarChartDataset(
      label: "Yesterday",
      data: [3, 18, 12, 9, 13],
      fillColor: XelaColor.Red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
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
                          child: Text(
                        "Charts",
                        style: XelaTextStyle.xelaSubheadline.apply(
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
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
                  )),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Usage Example",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          borderRadius: BorderRadius.circular(32)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Top enquiries",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                child: XelaChart(
                                  height: 180,
                                  doughnutStrokeWidth: 8,
                                  type: XelaChartType.DOUGHNUT,
                                  datasetsDoughnutChart: [
                                    XelaDoughnutDataset(
                                        label: "UI/UX Design",
                                        data: [
                                          80,
                                          20
                                        ],
                                        fillColors: [
                                          XelaColor.Green2,
                                          _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11
                                        ]),
                                    XelaDoughnutDataset(
                                        label: "Graphic Design",
                                        data: [
                                          70,
                                          30
                                        ],
                                        fillColors: [
                                          XelaColor.Purple3,
                                          _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11
                                        ]),
                                    XelaDoughnutDataset(
                                        label: "Logotypes",
                                        data: [
                                          60,
                                          40
                                        ],
                                        fillColors: [
                                          XelaColor.Orange3,
                                          _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11
                                        ]),
                                    XelaDoughnutDataset(
                                        label: "Illustrations",
                                        data: [
                                          30,
                                          70
                                        ],
                                        fillColors: [
                                          XelaColor.Blue3,
                                          _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11
                                        ])
                                  ],
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "UI/UX Design",
                                        style:
                                            XelaTextStyle.xelaButtonSmall.apply(
                                                color: _isDark
                                                    ? XelaColor.Gray11
                                                    : XelaColor.Gray2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
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
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Graphic Design",
                                        style:
                                            XelaTextStyle.xelaButtonSmall.apply(
                                                color: _isDark
                                                    ? XelaColor.Gray11
                                                    : XelaColor.Gray2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: XelaColor.Orange3,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Logotypes",
                                        style:
                                            XelaTextStyle.xelaButtonSmall.apply(
                                                color: _isDark
                                                    ? XelaColor.Gray11
                                                    : XelaColor.Gray2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: XelaColor.Blue3,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Illustrations",
                                        style:
                                            XelaTextStyle.xelaButtonSmall.apply(
                                                color: _isDark
                                                    ? XelaColor.Gray11
                                                    : XelaColor.Gray2),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daily Visitors",
                              style: XelaTextStyle.xelaHeadline.apply(
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                            Text(
                              "Today & Yesterday",
                              style: XelaTextStyle.xelaCaption.apply(
                                  color: XelaColor.Gray6),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            XelaChart(
                              height: 300,
                              type: XelaChartType.LINE,
                              labels: const [
                                "08:00",
                                "10:00",
                                "12:00",
                                "14:00",
                                "16:00"
                              ],
                              datasetsLineChart: lineChartData,
                              dataStep: 5,
                              chartBorderColor:
                                  _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                              labelsColor: XelaColor.Gray6,
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Line Charts",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Pink3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Blue3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Green3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Purple3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: XelaColor.Pink3,
                            pointColor: XelaColor.Pink3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: XelaColor.Blue3,
                            pointColor: XelaColor.Blue3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: XelaColor.Green3,
                            pointColor: XelaColor.Green3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: XelaColor.Purple3,
                            pointColor: XelaColor.Purple3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: XelaColor.Pink3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: XelaColor.Blue3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: XelaColor.Green3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: XelaColor.Purple3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Pink3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Blue3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Green3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Purple3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Pink3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Blue3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Green3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Purple3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0.5),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: Colors.transparent,
                            pointColor: Colors.transparent,
                            tension: 0),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Pink3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Blue3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Green3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: Colors.transparent,
                            pointColor: XelaColor.Purple3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: XelaColor.Pink3,
                            pointColor: XelaColor.Pink3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: XelaColor.Blue3,
                            pointColor: XelaColor.Blue3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: XelaColor.Green3,
                            pointColor: XelaColor.Green3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: XelaColor.Purple3,
                            pointColor: XelaColor.Purple3,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: XelaColor.Pink3,
                            fillColor: XelaColor.Pink3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: XelaColor.Blue3,
                            fillColor: XelaColor.Blue3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: XelaColor.Green3,
                            fillColor: XelaColor.Green3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: XelaColor.Purple3,
                            fillColor: XelaColor.Purple3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      type: XelaChartType.LINE,
                      labels: const [
                        "Label",
                        "Label",
                        "Label",
                        "Label",
                        "Label"
                      ],
                      datasetsLineChart: [
                        XelaLineChartDataset(
                            label: "First",
                            data: [9, 15, 18, 5, 20],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Pink3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Second",
                            data: [6, 7, 2, 14, 1],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Blue3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Third",
                            data: [4, 9, 20, 12, 5],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Green3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                        XelaLineChartDataset(
                            label: "Fourth",
                            data: [12, 3, 22, 8, 18],
                            lineColor: Colors.transparent,
                            fillColor: XelaColor.Purple3,
                            pointColor: Colors.transparent,
                            pointColorBackground:
                                _isDark ? XelaColor.Gray1 : Colors.white,
                            tension: 0),
                      ],
                      dataStep: 5,
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Bar Charts",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      dataStep: 5,
                      type: XelaChartType.BAR,
                      datasetsBarChart: [
                        XelaBarChartDataset(
                            label: "First",
                            data: [20, 30, 40, 10, 20],
                            fillColor: XelaColor.Blue3),
                        XelaBarChartDataset(
                            label: "Second",
                            data: [10, 25, 37, 18, 28],
                            fillColor: XelaColor.Pink3),
                        XelaBarChartDataset(
                            label: "Third",
                            data: [8, 20, 32, 25, 38],
                            fillColor: XelaColor.Green3),
                        XelaBarChartDataset(
                            label: "Fourth",
                            data: [15, 40, 50, 38, 18],
                            fillColor: XelaColor.Orange3),
                      ],
                      labels: ["Label", "Label", "Label", "Label", "Label"],
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      dataStep: 5,
                      type: XelaChartType.BAR,
                      datasetsBarChart: [
                        XelaBarChartDataset(
                            label: "First",
                            data: [20, 30, 40, 10, 20],
                            fillColor: XelaColor.Blue3),
                        XelaBarChartDataset(
                            label: "Second",
                            data: [10, 25, 37, 18, 28],
                            fillColor: XelaColor.Pink3),
                        XelaBarChartDataset(
                            label: "Third",
                            data: [8, 20, 32, 25, 38],
                            fillColor: XelaColor.Green3),
                      ],
                      labels: ["Label", "Label", "Label", "Label", "Label"],
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      dataStep: 5,
                      type: XelaChartType.BAR,
                      datasetsBarChart: [
                        XelaBarChartDataset(
                            label: "First",
                            data: [20, 30, 40, 10, 20],
                            fillColor: XelaColor.Blue3),
                        XelaBarChartDataset(
                            label: "Second",
                            data: [10, 25, 37, 18, 28],
                            fillColor: XelaColor.Pink3),
                      ],
                      labels: ["Label", "Label", "Label", "Label", "Label"],
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 400,
                      dataStep: 5,
                      type: XelaChartType.BAR,
                      datasetsBarChart: [
                        XelaBarChartDataset(
                            label: "First",
                            data: [20, 30, 40, 10, 20],
                            fillColor: XelaColor.Blue3),
                      ],
                      labels: ["Label", "Label", "Label", "Label", "Label"],
                      labelsColor: XelaColor.Gray6,
                      chartBorderColor:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Pie Charts",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 300,
                      type: XelaChartType.PIE,
                      pieBackgroundColor: XelaColor.Gray12,
                      datasetPieChart: XelaPieChartDataset(
                          label: "Today",
                          data: [
                            20,
                            30,
                            30,
                            10
                          ],
                          fillColors: [
                            XelaColor.Blue3,
                            XelaColor.Pink3,
                            XelaColor.Green3,
                            XelaColor.Orange3
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaChart(
                      height: 300,
                      type: XelaChartType.PIE,
                      pieBackgroundColor: XelaColor.Gray12,
                      datasetPieChart: XelaPieChartDataset(
                          label: "Today",
                          data: [
                            40,
                            160
                          ],
                          fillColors: [
                            XelaColor.Blue3,
                            _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Doughnut Charts",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56, vertical: 12),
                    child: XelaChart(
                      height: 300,
                      doughnutStrokeWidth: 12,
                      type: XelaChartType.DOUGHNUT,
                      datasetsDoughnutChart: [
                        XelaDoughnutDataset(label: "First", data: [
                          80,
                          20
                        ], fillColors: [
                          XelaColor.Green2,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Second", data: [
                          70,
                          30
                        ], fillColors: [
                          XelaColor.Purple3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Third", data: [
                          60,
                          40
                        ], fillColors: [
                          XelaColor.Orange3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Fourth", data: [
                          30,
                          70
                        ], fillColors: [
                          XelaColor.Blue3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56, vertical: 12),
                    child: XelaChart(
                      height: 300,
                      doughnutStrokeWidth: 12,
                      type: XelaChartType.DOUGHNUT,
                      datasetsDoughnutChart: [
                        XelaDoughnutDataset(label: "First", data: [
                          20,
                          20,
                          30,
                          30
                        ], fillColors: [
                          XelaColor.Green2,
                          XelaColor.Purple3,
                          XelaColor.Orange3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Second", data: [
                          10,
                          20,
                          50,
                          20
                        ], fillColors: [
                          XelaColor.Green2,
                          XelaColor.Purple3,
                          XelaColor.Orange3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Third", data: [
                          55,
                          45,
                          5
                        ], fillColors: [
                          XelaColor.Green2,
                          XelaColor.Purple3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                        XelaDoughnutDataset(label: "Fourth", data: [
                          25,
                          24,
                          10,
                          31
                        ], fillColors: [
                          XelaColor.Green2,
                          XelaColor.Purple3,
                          XelaColor.Orange3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56, vertical: 12),
                    child: XelaChart(
                      height: 300,
                      doughnutStrokeWidth: 12,
                      type: XelaChartType.DOUGHNUT,
                      datasetsDoughnutChart: [
                        XelaDoughnutDataset(label: "First", data: [
                          20,
                          25,
                          30,
                          10
                        ], fillColors: [
                          XelaColor.Green2,
                          XelaColor.Purple3,
                          XelaColor.Orange3,
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11
                        ]),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

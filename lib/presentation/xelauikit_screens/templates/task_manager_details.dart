import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskManagerDetails extends StatefulWidget {
  final DateTime selectedDate;

  TaskManagerDetails({required this.selectedDate});

  @override
  _TaskManagerDetailsState createState() => _TaskManagerDetailsState();
}

class _TaskManagerDetailsState extends State<TaskManagerDetails> {
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

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? Colors.black : Colors.white,
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
                          Text(
                              DateFormat.yMMMMd('en')
                                  .format(widget.selectedDate),
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
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
                    child: Row(
                      children: [
                        XelaButton(
                          onPressed: () {},
                          rightIcon: Icon(Icons.keyboard_arrow_down,
                              size: 15,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          text: "Day",
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? Colors.white : XelaColor.Gray2,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          size: XelaButtonSize.SMALL,
                          autoResize: true,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: XelaButton(
                          onPressed: () {},
                          rightIcon: Icon(Icons.search,
                              size: 15,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          text: "Search",
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? Colors.white : XelaColor.Gray2,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          size: XelaButtonSize.SMALL,
                          autoResize: false,
                        )),
                        const SizedBox(width: 16),
                        Expanded(
                            child: XelaButton(
                          onPressed: () {},
                          text: "New Task",
                          leftIcon: const Icon(Icons.add,
                              size: 15, color: Colors.white),
                          type: XelaButtonType.PRIMARY,
                          background: XelaColor.Blue6,
                          foregroundColor: Colors.white,
                          size: XelaButtonSize.SMALL,
                          autoResize: false,
                        ))
                      ],
                    )),
                Expanded(
                    child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("01:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title: "Revive Decorative Metal",
                              text: "40 min",
                              primaryColor:
                                  _isDark ? XelaColor.Pink6 : XelaColor.Pink3,
                              background:
                                  _isDark ? XelaColor.Gray2 : XelaColor.Pink12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("02:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title: "Reduce Photovoltaic Collectors",
                              text: "1h 15 min",
                              primaryColor:
                                  _isDark ? XelaColor.Blue6 : XelaColor.Blue3,
                              background:
                                  _isDark ? XelaColor.Gray2 : XelaColor.Blue12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("03:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title: "Deploy Structural Steel Framing",
                              text: "30 min",
                              primaryColor:
                                  _isDark ? XelaColor.Green1 : XelaColor.Green1,
                              background:
                                  _isDark ? XelaColor.Gray2 : XelaColor.Green12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("04:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title:
                                  "Quash Custom Elevator Cabs and Hoistway Doors",
                              text: "1h 30 min",
                              primaryColor: _isDark
                                  ? XelaColor.Yellow6
                                  : XelaColor.Yellow2,
                              background: _isDark
                                  ? XelaColor.Gray2
                                  : XelaColor.Yellow12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("05:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("06:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title: "Meeting to discuss the new proposal",
                              text: "5 min",
                              primaryColor: _isDark
                                  ? XelaColor.Orange6
                                  : XelaColor.Orange3,
                              background: _isDark
                                  ? XelaColor.Gray2
                                  : XelaColor.Orange12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            const SizedBox(height: 8),
                            XelaAlert(
                              title: "Add Interior Lighting",
                              text: "1 hour",
                              primaryColor: _isDark
                                  ? XelaColor.Orange6
                                  : XelaColor.Orange3,
                              background: _isDark
                                  ? XelaColor.Gray2
                                  : XelaColor.Orange12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text("07:00 PM",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: XelaDivider(
                                          style: XelaDividerStyle.DOTTED,
                                          color: XelaColor.Gray8))
                                ],
                              ),
                            ),
                            XelaAlert(
                              title: "Deliver Fuses",
                              text: "1h 10 min",
                              primaryColor:
                                  _isDark ? XelaColor.Red6 : XelaColor.Red3,
                              background:
                                  _isDark ? XelaColor.Gray2 : XelaColor.Red12,
                              secondaryColor: XelaColor.Gray7, id: '',
                            ),
                            const SizedBox(height: 8),
                            XelaAlert(
                              title: "Correct Concrete Forming and Accessories",
                              text: "50 min",
                              primaryColor: _isDark
                                  ? XelaColor.Purple6
                                  : XelaColor.Purple3,
                              background: _isDark
                                  ? XelaColor.Gray2
                                  : XelaColor.Purple12,
                              secondaryColor: XelaColor.Gray7, id: '',
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

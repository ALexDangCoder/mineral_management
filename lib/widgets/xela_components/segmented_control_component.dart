import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_segmented_control.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class SegmentedControlComponent extends StatefulWidget {
  const SegmentedControlComponent({Key? key}) : super(key: key);

  @override
  _SegmentedControlComponentState createState() =>
      _SegmentedControlComponentState();
}

class _SegmentedControlComponentState extends State<SegmentedControlComponent> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    final List<XelaSegmentedControlItem> itemsLabel = [
      XelaSegmentedControlItem(id: "1", label: "label"),
      XelaSegmentedControlItem(id: "2", label: "label"),
      XelaSegmentedControlItem(id: "3", label: "label"),
    ];

    final List<XelaSegmentedControlItem> itemsLabelIcon = [
      XelaSegmentedControlItem(
          id: "1",
          label: "label",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "2",
          label: "label",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "3",
          label: "label",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
    ];

    final List<XelaSegmentedControlItem> itemsIcon = [
      XelaSegmentedControlItem(
          id: "1",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "2",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "3",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
    ];

    final List<XelaSegmentedControlItem> items = [
      XelaSegmentedControlItem(
          id: "1",
          label: "label",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
      XelaSegmentedControlItem(id: "2", label: "label"),
      XelaSegmentedControlItem(
          id: "3",
          iconActive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : Colors.white),
          iconInactive: Icon(Icons.grid_view,
              size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2)),
    ];

    final List<XelaSegmentedControlItem> items1 = [
      XelaSegmentedControlItem(
          id: "1",
          iconActive: Icon(Icons.align_horizontal_left,
              size: 20, color: _isDark ? Colors.white : Colors.white),
          iconInactive: Icon(Icons.align_horizontal_left,
              size: 20, color: _isDark ? Colors.white : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "2",
          iconActive: Icon(Icons.align_horizontal_center,
              size: 20, color: _isDark ? Colors.white : Colors.white),
          iconInactive: Icon(Icons.align_horizontal_center,
              size: 20, color: _isDark ? Colors.white : XelaColor.Gray2)),
      XelaSegmentedControlItem(
          id: "3",
          iconActive: Icon(Icons.align_horizontal_right,
              size: 20, color: _isDark ? Colors.white : Colors.white),
          iconInactive: Icon(Icons.align_horizontal_right,
              size: 20, color: _isDark ? Colors.white : XelaColor.Gray2)),
    ];

    final List<XelaSegmentedControlItem> items2 = [
      XelaSegmentedControlItem(id: "1", label: "Day"),
      XelaSegmentedControlItem(id: "2", label: "Week"),
      XelaSegmentedControlItem(id: "3", label: "Month"),
      XelaSegmentedControlItem(id: "4", label: "Year"),
    ];

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
                        "Segmented Control",
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
                        "Example Usage",
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
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                          color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          borderRadius: BorderRadius.circular(32)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Alignment",
                            style: XelaTextStyle.xelaBodyBold.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          )),
                          XelaSegmentedControl(
                            items: items1,
                            autoResize: true,
                            segmentedControlValue: 2,
                            primaryBackground:
                                _isDark ? XelaColor.Purple2 : XelaColor.Purple2,
                            secondaryBackground:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            primaryFontColor: Colors.white,
                            secondaryFontColor:
                                _isDark ? Colors.white : XelaColor.Gray2,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSegmentedControl(
                      items: items2,
                      autoResize: false,
                      primaryBackground:
                          _isDark ? XelaColor.Yellow3 : XelaColor.Yellow3,
                      secondaryBackground:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      primaryFontColor: XelaColor.Gray2,
                      secondaryFontColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "AutoResize Off",
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
                    child: XelaSegmentedControl(
                      items: itemsLabelIcon,
                      autoResize: false,
                      primaryBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryBackground:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      primaryFontColor:
                          _isDark ? XelaColor.Gray11 : Colors.white,
                      secondaryFontColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSegmentedControl(
                      items: itemsLabel,
                      autoResize: false,
                      primaryBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryBackground:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      primaryFontColor:
                          _isDark ? XelaColor.Gray11 : Colors.white,
                      secondaryFontColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSegmentedControl(
                      items: itemsIcon,
                      autoResize: false,
                      primaryBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryBackground:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      primaryFontColor:
                          _isDark ? XelaColor.Gray11 : Colors.white,
                      secondaryFontColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSegmentedControl(
                      items: items,
                      autoResize: false,
                      primaryBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryBackground:
                          _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      primaryFontColor:
                          _isDark ? XelaColor.Gray11 : Colors.white,
                      secondaryFontColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "AutoResize On",
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
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Center(
                        child: XelaSegmentedControl(
                          items: itemsLabelIcon,
                          autoResize: true,
                          primaryBackground:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          secondaryBackground:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          primaryFontColor:
                              _isDark ? XelaColor.Gray11 : Colors.white,
                          secondaryFontColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Center(
                        child: XelaSegmentedControl(
                          items: itemsLabel,
                          autoResize: true,
                          primaryBackground:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          secondaryBackground:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          primaryFontColor:
                              _isDark ? XelaColor.Gray11 : Colors.white,
                          secondaryFontColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Center(
                        child: XelaSegmentedControl(
                          items: itemsIcon,
                          autoResize: true,
                          primaryBackground:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          secondaryBackground:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          primaryFontColor:
                              _isDark ? XelaColor.Gray11 : Colors.white,
                          secondaryFontColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Center(
                        child: XelaSegmentedControl(
                          items: items,
                          autoResize: true,
                          primaryBackground:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          secondaryBackground:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          primaryFontColor:
                              _isDark ? XelaColor.Gray11 : Colors.white,
                          secondaryFontColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                      )),
                ],
              ))
            ],
          ),
        ));
  }
}

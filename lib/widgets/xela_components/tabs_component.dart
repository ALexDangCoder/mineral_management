import 'package:bnv_opendata/domain/models/xela_chip_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_badge.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_chip.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TabsComponent extends StatefulWidget {
  const TabsComponent({Key? key}) : super(key: key);

  @override
  _TabsComponentState createState() => _TabsComponentState();
}

class _TabsComponentState extends State<TabsComponent> {
  bool _isDark = false;

  List<XelaTabItem> tabsLabelIconBadge = [
    XelaTabItem(
        id: 1,
        label: "Label",
        badgeText: "1",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 2,
        label: "Label",
        badgeText: "2",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 3,
        label: "Label",
        badgeText: "3",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
  ];

  List<XelaTabItem> tabsLabel = [
    XelaTabItem(
      id: 1,
      label: "Label",
    ),
    XelaTabItem(
      id: 2,
      label: "Label",
    ),
    XelaTabItem(
      id: 3,
      label: "Label",
    ),
  ];

  List<XelaTabItem> tabsLabelIcon = [
    XelaTabItem(
        id: 1,
        label: "Label",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 2,
        label: "Label",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 3,
        label: "Label",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
  ];

  List<XelaTabItem> tabsLabelBadge = [
    XelaTabItem(
      id: 1,
      label: "Label",
      badgeText: "1",
    ),
    XelaTabItem(
      id: 2,
      label: "Label",
      badgeText: "2",
    ),
    XelaTabItem(
      id: 3,
      label: "Label",
      badgeText: "3",
    ),
  ];

  List<XelaTabItem> tabsIconBadge = [
    XelaTabItem(
        id: 1,
        badgeText: "1",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 2,
        badgeText: "2",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 3,
        badgeText: "3",
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
  ];

  List<XelaTabItem> tabsIcon = [
    XelaTabItem(
        id: 1,
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 2,
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
    XelaTabItem(
        id: 3,
        iconActive: Icon(Icons.grid_view, size: 20, color: XelaColor.Blue3),
        iconInactive: Icon(Icons.grid_view, size: 20, color: XelaColor.Gray3)),
  ];

  int selectedTabId = 1;

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
                        "Tabs",
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
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Components",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          XelaTabs(
                            items: [
                              XelaTabItem(
                                  id: 1,
                                  label: "Chips",
                                  iconActive: Icon(Icons.account_circle,
                                      size: 20,
                                      color: _isDark
                                          ? XelaColor.Blue5
                                          : XelaColor.Blue3),
                                  iconInactive: Icon(Icons.account_circle,
                                      size: 20,
                                      color: _isDark
                                          ? XelaColor.Gray6
                                          : XelaColor.Gray3)),
                              XelaTabItem(id: 2, label: "Badge", badgeText: "2")
                            ],
                            bottomLineColor:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            secondaryColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray3,
                            primaryColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            onChange: (item) {
                              setState(() {
                                selectedTabId = item.id;
                              });
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          selectedTabId == 2
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Device Fingerprint",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                          )),
                                          XelaBadge(
                                            text: "79",
                                            background: _isDark
                                                ? XelaColor.Blue8
                                                : XelaColor.Blue11,
                                            textColor: _isDark
                                                ? XelaColor.Blue1
                                                : XelaColor.Blue3,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "User Agent",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                          )),
                                          XelaBadge(
                                              text: "49",
                                              background: _isDark
                                                  ? XelaColor.Red7
                                                  : XelaColor.Red11,
                                              textColor: _isDark
                                                  ? XelaColor.Red1
                                                  : XelaColor.Red3)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "IP",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                          )),
                                          XelaBadge(
                                              text: "22",
                                              background: _isDark
                                                  ? XelaColor.Orange8
                                                  : XelaColor.Orange11,
                                              textColor: _isDark
                                                  ? XelaColor.Orange1
                                                  : XelaColor.Orange3)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Attempts",
                                            style:
                                                XelaTextStyle.xelaButtonMedium
                                                    .apply(
                                                        color: _isDark
                                                            ? XelaColor.Gray11
                                                            : XelaColor.Gray2),
                                          )),
                                          XelaBadge(
                                              text: "6",
                                              background: _isDark
                                                  ? XelaColor.Green8
                                                  : XelaColor.Green11,
                                              textColor: _isDark
                                                  ? XelaColor.Green1
                                                  : XelaColor.Green2)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaChip(
                                            text: "Design",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                            text: "Arts",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                          text: "Architecture",
                                          size: XelaChipSize.LARGE,
                                          borderWidth: 0,
                                          defaultBackgroundColor: _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11,
                                          selectedBackgroundColor: _isDark
                                              ? XelaColor.Blue5
                                              : XelaColor.Blue6,
                                          defaultContentColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray6,
                                          selectedContentColor: _isDark
                                              ? Colors.white
                                              : Colors.white,
                                          defaultBorderColor:
                                              Colors.transparent,
                                          selectedBorderColor:
                                              Colors.transparent,
                                          selected: true,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                            text: "UI Design",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaChip(
                                          text: "Business",
                                          size: XelaChipSize.LARGE,
                                          borderWidth: 0,
                                          defaultBackgroundColor: _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11,
                                          selectedBackgroundColor: _isDark
                                              ? XelaColor.Blue5
                                              : XelaColor.Blue6,
                                          defaultContentColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray6,
                                          selectedContentColor: _isDark
                                              ? Colors.white
                                              : Colors.white,
                                          defaultBorderColor:
                                              Colors.transparent,
                                          selectedBorderColor:
                                              Colors.transparent,
                                          selected: true,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                            text: "HTML & CSS",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                            text: "User Experience",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        XelaChip(
                                            text: "Prototyping",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                          text: "Mobile",
                                          size: XelaChipSize.LARGE,
                                          borderWidth: 0,
                                          defaultBackgroundColor: _isDark
                                              ? XelaColor.Gray3
                                              : XelaColor.Gray11,
                                          selectedBackgroundColor: _isDark
                                              ? XelaColor.Blue5
                                              : XelaColor.Blue6,
                                          defaultContentColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray6,
                                          selectedContentColor: _isDark
                                              ? Colors.white
                                              : Colors.white,
                                          defaultBorderColor:
                                              Colors.transparent,
                                          selectedBorderColor:
                                              Colors.transparent,
                                          selected: true,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        XelaChip(
                                            text: "Development",
                                            size: XelaChipSize.LARGE,
                                            borderWidth: 0,
                                            defaultBackgroundColor: _isDark
                                                ? XelaColor.Gray3
                                                : XelaColor.Gray11,
                                            selectedBackgroundColor: _isDark
                                                ? XelaColor.Blue5
                                                : XelaColor.Blue6,
                                            defaultContentColor: _isDark
                                                ? XelaColor.Gray11
                                                : XelaColor.Gray6,
                                            selectedContentColor: _isDark
                                                ? Colors.white
                                                : Colors.white,
                                            defaultBorderColor:
                                                Colors.transparent,
                                            selectedBorderColor:
                                                Colors.transparent),
                                      ],
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants",
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
                    child: XelaTabs(items: tabsLabel),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaTabs(items: tabsLabelIcon),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaTabs(items: tabsLabelIconBadge),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaTabs(items: tabsLabelBadge),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaTabs(items: tabsIconBadge),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaTabs(items: tabsIcon),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataTable extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTable> {
  bool _isDark = false;

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
    XelaTabItem(id: 1, label: "All orders", badgeText: "88"),
    XelaTabItem(id: 2, label: "Pickups", badgeText: "61"),
    XelaTabItem(id: 3, label: "Returns", badgeText: "27"),
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
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: _isDark ? XelaColor.Blue5 : XelaColor.Blue4),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_basket,
                              size: 15, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Orders",
                            style: XelaTextStyle.xelaButtonLarge.apply(
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
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
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
                    child: Row(
                      children: [
                        Expanded(
                            child: XelaButton(
                          onPressed: () {},
                          leftIcon: Icon(Icons.sort,
                              size: 15,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          text: "Sort",
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? Colors.white : XelaColor.Gray2,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          size: XelaButtonSize.SMALL,
                          autoResize: false,
                        )),
                        const SizedBox(width: 8),
                        Expanded(
                            child: XelaButton(
                          onPressed: () {},
                          leftIcon: Icon(Icons.tune,
                              size: 15,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          text: "Filters",
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? Colors.white : XelaColor.Gray2,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          size: XelaButtonSize.SMALL,
                          autoResize: false,
                        )),
                        const SizedBox(width: 8),
                        XelaButton(
                          onPressed: () {},
                          leftIcon: Icon(Icons.search,
                              size: 18,
                              color: _isDark ? Colors.white : XelaColor.Gray2),
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? Colors.white : XelaColor.Gray2,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          size: XelaButtonSize.SMALL,
                          autoResize: true,
                        )
                      ],
                    )),
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
                                  Text("21 - 30 of 88 results",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const Spacer(),
                                  Text("Items per page",
                                      style: XelaTextStyle.xelaCaption.apply(
                                          color: XelaColor.Gray8)),
                                  const SizedBox(width: 8),
                                  XelaButton(
                                    onPressed: () {},
                                    text: "10",
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
                            XelaDivider(
                                color: _isDark
                                    ? XelaColor.Gray3
                                    : XelaColor.Gray11),
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
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("998-5878",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Oludayo Ayomide",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("DJI Mavic Pro 2",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isDark ? XelaColor.Red7 : XelaColor.Red11),
                    child: Text("Rejected",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Red1 : XelaColor.Red3)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$17.84",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Mar 13, 2021 08:05 AM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Received",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Blue6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("623-4534",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Edwin Martins",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Macbook Pro 16 inch (2021)",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isDark ? XelaColor.Green8 : XelaColor.Green11),
                    child: Text("Completed",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                                _isDark ? XelaColor.Green1 : XelaColor.Green1)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$6.48",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Sep 4, 2021 12:14 AM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Received",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Blue6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("395-9823",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Hellen Jummy",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Lego Star'War edition",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            _isDark ? XelaColor.Orange8 : XelaColor.Orange11),
                    child: Text("Pending",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark
                                ? XelaColor.Orange1
                                : XelaColor.Orange3)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$11.70",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Jan 11, 2021 01:49 PM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Draft",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
      ],
    );
  }

  Widget Tab2DataWidget() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text("Order ID No.",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("395-9823",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Customer",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Hellen Jummy",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Product",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Lego Star'War edition",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _isDark ? XelaColor.Orange8 : XelaColor.Orange11),
                  child: Text("Pending",
                      style: XelaTextStyle.xelaCaption.apply(
                          color:
                              _isDark ? XelaColor.Orange1 : XelaColor.Orange3)),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Price",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("\$11.70",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Created date",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Jan 11, 2021 01:49 PM",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Delivery status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Draft",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
          ],
        ),
      ),
      XelaDivider(
          style: XelaDividerStyle.DOTTED,
          color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text("Order ID No.",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("998-5878",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Customer",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Oludayo Ayomide",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Product",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("DJI Mavic Pro 2",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _isDark ? XelaColor.Red7 : XelaColor.Red11),
                  child: Text("Rejected",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Red1 : XelaColor.Red3)),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Price",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("\$17.84",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Created date",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Mar 13, 2021 08:05 AM",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Delivery status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Received",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Blue6)),
              ],
            ),
          ],
        ),
      ),
      XelaDivider(
          style: XelaDividerStyle.DOTTED,
          color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text("Order ID No.",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("623-4534",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Customer",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Edwin Martins",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Product",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Macbook Pro 16 inch (2021)",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _isDark ? XelaColor.Green8 : XelaColor.Green11),
                  child: Text("Completed",
                      style: XelaTextStyle.xelaCaption.apply(
                          color:
                              _isDark ? XelaColor.Green1 : XelaColor.Green1)),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Price",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("\$6.48",
                    style: XelaTextStyle.xelaSmallBodyBold.apply(
                        color: _isDark ? Colors.white : XelaColor.Gray2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Created date",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Sep 4, 2021 12:14 AM",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Delivery status",
                    style: XelaTextStyle.xelaSmallBody.apply(
                        color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                const Spacer(),
                Text("Received",
                    style: XelaTextStyle.xelaCaption.apply(
                        color: XelaColor.Blue6)),
              ],
            ),
          ],
        ),
      ),
      XelaDivider(
          style: XelaDividerStyle.DOTTED,
          color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
    ]);
  }

  Widget Tab3DataWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("623-4534",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Edwin Martins",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Macbook Pro 16 inch (2021)",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isDark ? XelaColor.Green8 : XelaColor.Green11),
                    child: Text("Completed",
                        style: XelaTextStyle.xelaCaption.apply(
                            color:
                                _isDark ? XelaColor.Green1 : XelaColor.Green1)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$6.48",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Sep 4, 2021 12:14 AM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Received",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Blue6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("395-9823",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Hellen Jummy",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Lego Star'War edition",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            _isDark ? XelaColor.Orange8 : XelaColor.Orange11),
                    child: Text("Pending",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark
                                ? XelaColor.Orange1
                                : XelaColor.Orange3)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$11.70",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Jan 11, 2021 01:49 PM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Draft",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Order ID No.",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("998-5878",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Customer",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Oludayo Ayomide",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Product",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("DJI Mavic Pro 2",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isDark ? XelaColor.Red7 : XelaColor.Red11),
                    child: Text("Rejected",
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Red1 : XelaColor.Red3)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Price",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("\$17.84",
                      style: XelaTextStyle.xelaSmallBodyBold.apply(
                          color: _isDark ? Colors.white : XelaColor.Gray2)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Created date",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Mar 13, 2021 08:05 AM",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Delivery status",
                      style: XelaTextStyle.xelaSmallBody.apply(
                          color: _isDark ? XelaColor.Gray8 : XelaColor.Gray6)),
                  const Spacer(),
                  Text("Received",
                      style: XelaTextStyle.xelaCaption.apply(
                          color: XelaColor.Blue6)),
                ],
              ),
            ],
          ),
        ),
        XelaDivider(
            style: XelaDividerStyle.DOTTED,
            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11),
      ],
    );
  }
}

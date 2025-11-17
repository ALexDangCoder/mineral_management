import 'package:bnv_opendata/domain/models/xela_accordion_models.dart';
import 'package:bnv_opendata/domain/models/xela_checkbox_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_accordion.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_range_slider_input.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_segmented_control.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Filter1 extends StatefulWidget {
  const Filter1({super.key});

  @override
  _Filter1State createState() => _Filter1State();
}

class _Filter1State extends State<Filter1> {
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
        backgroundColor: _isDark ? XelaColor.Gray2 : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              children: [
                Row(
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
                        child: Text("Filters",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2))),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
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
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        XelaSegmentedControl(
                          items: [
                            XelaSegmentedControlItem(id: "1", label: "General"),
                            XelaSegmentedControlItem(id: "2", label: "Trend")
                          ],
                          segmentedControlValue: 0,
                          primaryBackground:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          secondaryBackground:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray12,
                          secondaryFontColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaAccordion(
                            iconPosition: XelaAccordionIconPosition.RIGHT,
                            title: "Source",
                            isOpen: true,
                            closeBackground: Colors.transparent,
                            openBackground: Colors.transparent,
                            openTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            closeTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            openIcon: Icon(Icons.remove,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            closeIcon: Icon(Icons.add,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            content: Column(
                              children: [
                                XelaTextField(
                                  placeholder: "Type",
                                  leftIcon: Icon(Icons.data_usage,
                                      size: 20,
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                  value: "Heatmap",
                                  borderDefaultColor: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11,
                                  background: Colors.transparent,
                                  textfieldColor: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2,
                                ),
                                const SizedBox(height: 16),
                                XelaTextField(
                                  placeholder: "Source",
                                  leftIcon: Icon(Icons.public,
                                      size: 20,
                                      color: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2),
                                  value: "Twitter",
                                  borderDefaultColor: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11,
                                  background: Colors.transparent,
                                  textfieldColor: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2,
                                ),
                              ],
                            )),
                        const SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11)),
                        const SizedBox(height: 8),
                        XelaAccordion(
                            iconPosition: XelaAccordionIconPosition.RIGHT,
                            title: "Data",
                            isOpen: false,
                            closeBackground: Colors.transparent,
                            openBackground: Colors.transparent,
                            openTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            closeTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            openIcon: Icon(Icons.remove,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            closeIcon: Icon(Icons.add,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                XelaCheckbox(
                                  checkboxIcon: const Icon(Icons.done,
                                      color: Colors.white),
                                  label: "Hashtags",
                                  labelColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray2,
                                  defaultColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray11,
                                  selectedColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  isChecked: true,
                                  size: XelaCheckboxSize.LARGE,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                XelaCheckbox(
                                  checkboxIcon: const Icon(Icons.done,
                                      color: Colors.white),
                                  label: "Tweets",
                                  isChecked: true,
                                  labelColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray2,
                                  defaultColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray11,
                                  selectedColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  size: XelaCheckboxSize.LARGE,
                                ),
                                const SizedBox(height: 16),
                                Text("Quantity, k",
                                    style: XelaTextStyle.xelaCaption.apply(
                                        color: XelaColor.Gray8)),
                                XelaRangeSliderInput(
                                  values: const RangeValues(30, 80),
                                  max: 100,
                                  min: 10,
                                  primaryColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  secondaryColor: _isDark
                                      ? XelaColor.Gray3
                                      : XelaColor.Gray11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("10",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray10
                                                    : XelaColor.Gray2)),
                                    Text("100",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? XelaColor.Gray10
                                                    : XelaColor.Gray2)),
                                  ],
                                )
                              ],
                            )),
                        const SizedBox(height: 8),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11)),
                        const SizedBox(height: 8),
                        XelaAccordion(
                            iconPosition: XelaAccordionIconPosition.RIGHT,
                            title: "Popular Hashtags",
                            isOpen: true,
                            closeBackground: Colors.transparent,
                            openBackground: Colors.transparent,
                            openTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            closeTitleColor:
                                _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                            openIcon: Icon(Icons.remove,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            closeIcon: Icon(Icons.add,
                                size: 15,
                                color: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray3),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                XelaCheckbox(
                                  checkboxIcon: const Icon(Icons.done,
                                      color: Colors.white),
                                  label: "#Figma",
                                  labelColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray2,
                                  defaultColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray11,
                                  selectedColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  isChecked: true,
                                  size: XelaCheckboxSize.LARGE,
                                ),
                                const SizedBox(height: 16),
                                XelaCheckbox(
                                  checkboxIcon: const Icon(Icons.done,
                                      color: Colors.white),
                                  label: "#Prototyping",
                                  isChecked: true,
                                  labelColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray2,
                                  defaultColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray11,
                                  selectedColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  size: XelaCheckboxSize.LARGE,
                                ),
                                const SizedBox(height: 16),
                                XelaCheckbox(
                                  checkboxIcon: const Icon(Icons.done,
                                      color: Colors.white),
                                  label: "#UI&UX",
                                  isChecked: true,
                                  labelColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray2,
                                  defaultColor: _isDark
                                      ? XelaColor.Gray10
                                      : XelaColor.Gray11,
                                  selectedColor: _isDark
                                      ? XelaColor.Blue5
                                      : XelaColor.Blue3,
                                  size: XelaCheckboxSize.LARGE,
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  child: Text(
                                    "View more",
                                    style: XelaTextStyle.xelaButtonSmall.apply(
                                        color: _isDark
                                            ? XelaColor.Blue5
                                            : XelaColor.Blue3),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }
}

import 'package:bnv_opendata/domain/models/xela_checkbox_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_range_slider_input.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Filter2 extends StatefulWidget {
  @override
  _Filter2State createState() => _Filter2State();
}

class _Filter2State extends State<Filter2> {
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
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XelaTextField(
                          placeholder: "Location",
                          leftIcon: Icon(Icons.pin,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                          value: "California, USA",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Job type",
                          style: XelaTextStyle.xelaHeadline.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Full time Job",
                          isChecked: true,
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Part time Job",
                          isChecked: true,
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Internship Job",
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Remote Job",
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Contract",
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Salary",
                          style: XelaTextStyle.xelaHeadline.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        XelaRangeSliderInput(
                          values: const RangeValues(2000, 4960),
                          max: 5000,
                          min: 1000,
                          primaryColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          secondaryColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Experience level",
                          style: XelaTextStyle.xelaHeadline.apply(
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Entry / Junior",
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Middle",
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        XelaCheckbox(
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          label: "Senior",
                          isChecked: true,
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray2,
                          defaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Orange3 : XelaColor.Orange3,
                          size: XelaCheckboxSize.MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }
}

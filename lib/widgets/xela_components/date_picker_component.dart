import 'package:bnv_opendata/domain/models/xela_date_picker_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_date_picker.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerComponent extends StatefulWidget {
  const DatePickerComponent({Key? key}) : super(key: key);

  @override
  _DatePickerComponentState createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  bool _isDark = false;

  DateTime? selectedDate;

  List<DateTime> selectedDates = [
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 4)),
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 5)),
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
                        "Date Picker",
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
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
                      child: Column(
                        children: [
                          XelaDatePicker(
                            selectedDate: selectedDate,
                            prevMonthIcon: Icon(
                              Icons.chevron_left,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            ),
                            nextMonthIcon: Icon(
                              Icons.chevron_right,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            ),
                            mode: XelaDatePickerMode.SINGLE_DATE,
                            localeName: "en",
                            monthHeaderColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            yearHeaderColor:
                                _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                            textColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            todayColor:
                                _isDark ? XelaColor.Blue3 : XelaColor.Blue3,
                            todayBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            selectedColor:
                                _isDark ? Colors.white : Colors.white,
                            disabledColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                            betweenStartAndEndColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            selectedBackground:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            weekdayHeaderColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                            dividerColor:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            changeMonthBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            changeMonthBorderColor:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            onTapDate: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          XelaDivider(
                            style: XelaDividerStyle.DOTTED,
                            color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date",
                                style: XelaTextStyle.xelaButtonMedium.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray3),
                              ),
                              const Spacer(),
                              selectedDate != null
                                  ? Text(
                                      DateFormat.yMMMMd('en')
                                          .format(selectedDate!),
                                      style:
                                          XelaTextStyle.xelaButtonMedium.apply(
                                              color: _isDark
                                                  ? XelaColor.Gray11
                                                  : XelaColor.Gray3),
                                    )
                                  : Container()
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                "Location",
                                style: XelaTextStyle.xelaButtonMedium.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray3),
                              ),
                              const Spacer(),
                              Text(
                                "4140 Parker Rd. Alletown",
                                style: XelaTextStyle.xelaButtonMedium.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray3),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          XelaButton(
                            onPressed: () {},
                            text: "Set reminder",
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            autoResize: false,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Multiply Dates",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: XelaDatePicker(
                      minDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      monthOffset: 12,
                      selectedDates: selectedDates,
                      prevMonthIcon: Icon(
                        Icons.chevron_left,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      nextMonthIcon: Icon(
                        Icons.chevron_right,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      mode: XelaDatePickerMode.MULTIPLY_DATES,
                      localeName: "en",
                      monthHeaderColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      yearHeaderColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      textColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      todayColor: _isDark ? XelaColor.Blue3 : XelaColor.Blue3,
                      todayBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      selectedColor: _isDark ? Colors.white : Colors.white,
                      disabledColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      betweenStartAndEndColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      selectedBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      weekdayHeaderColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      dividerColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      changeMonthBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      changeMonthBorderColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Range Dates",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: XelaDatePicker(
                      minDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      startDate:
                          DateTime.now().subtract(const Duration(days: 10)),
                      endDate: DateTime.now().subtract(const Duration(days: 5)),
                      monthOffset: 12,
                      prevMonthIcon: Icon(
                        Icons.chevron_left,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      nextMonthIcon: Icon(
                        Icons.chevron_right,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      mode: XelaDatePickerMode.RANGE_DATES,
                      localeName: "en",
                      monthHeaderColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      yearHeaderColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      textColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      todayColor: _isDark ? XelaColor.Blue3 : XelaColor.Blue3,
                      todayBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      selectedColor: _isDark ? Colors.white : Colors.white,
                      disabledColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      betweenStartAndEndColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      selectedBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      weekdayHeaderColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      dividerColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      changeMonthBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      changeMonthBorderColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Single Date",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: XelaDatePicker(
                      minDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      monthOffset: 12,
                      selectedDate:
                          DateTime.now().subtract(const Duration(days: 3)),
                      prevMonthIcon: Icon(
                        Icons.chevron_left,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      nextMonthIcon: Icon(
                        Icons.chevron_right,
                        color: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      ),
                      mode: XelaDatePickerMode.SINGLE_DATE,
                      localeName: "en",
                      monthHeaderColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      yearHeaderColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      textColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      todayColor: _isDark ? XelaColor.Blue3 : XelaColor.Blue3,
                      todayBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      selectedColor: _isDark ? Colors.white : Colors.white,
                      disabledColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      betweenStartAndEndColor:
                          _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                      selectedBackground:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      weekdayHeaderColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray9,
                      dividerColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      changeMonthBackground:
                          _isDark ? Colors.transparent : Colors.white,
                      changeMonthBorderColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}

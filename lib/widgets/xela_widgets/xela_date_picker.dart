import 'package:bnv_opendata/domain/models/xela_date_picker_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'xela_color.dart';
import 'xela_divider.dart';
import 'xela_text_style.dart';

class XelaDatePicker extends StatefulWidget {
  DateTime? minDate;
  DateTime? maxDate;
  List<DateTime>? disabledDates;
  List<DateTime>? selectedDates;
  DateTime? selectedDate;
  DateTime? startDate;
  DateTime? endDate;
  final XelaDatePickerMode mode;
  final int monthOffset;
  final Color textColor;
  final Color todayColor;
  final Color selectedColor;
  final Color disabledColor;
  final Color betweenStartAndEndColor;
  final Color textBackground;
  final Color todayBackground;
  final Color selectedBackground;
  final Color disabledBackground;
  final Color betweenStartAndEndBackground;
  final Color weekdayHeaderColor;
  final Color monthHeaderColor;
  final Color yearHeaderColor;
  final Color changeMonthBackground;
  final Color changeMonthBorderColor;
  final Color dividerColor;
  final Widget? prevMonthIcon;
  final Widget? nextMonthIcon;
  final Function(DateTime)? onTapDate;
  final XelaFirstDayOfWeek firstDayOfWeek;
  final String localeName;

  XelaDatePicker({
    Key? key,
    this.minDate,
    this.maxDate,
    this.disabledDates,
    this.selectedDates,
    this.selectedDate,
    this.startDate,
    this.endDate,
    this.mode = XelaDatePickerMode.SINGLE_DATE,
    this.monthOffset = 0,
    this.textColor = XelaColor.Gray3,
    this.todayColor = XelaColor.Blue3,
    this.selectedColor = Colors.white,
    this.disabledColor = XelaColor.Gray9,
    this.betweenStartAndEndColor = XelaColor.Gray3,
    this.textBackground = Colors.transparent,
    this.todayBackground = Colors.white,
    this.selectedBackground = XelaColor.Blue3,
    this.disabledBackground = Colors.transparent,
    this.betweenStartAndEndBackground = XelaColor.Blue8,
    this.weekdayHeaderColor = XelaColor.Gray7,
    this.monthHeaderColor = XelaColor.Gray2,
    this.yearHeaderColor = XelaColor.Gray9,
    this.changeMonthBackground = Colors.white,
    this.changeMonthBorderColor = XelaColor.Gray11,
    this.dividerColor = XelaColor.Gray9,
    this.prevMonthIcon,
    this.nextMonthIcon,
    this.onTapDate,
    this.firstDayOfWeek = XelaFirstDayOfWeek.MONDAY,
    this.localeName = "en",
  }) : super(key: key);

  @override
  _XelaDatePickerState createState() => _XelaDatePickerState();
}

class _XelaDatePickerState extends State<XelaDatePicker> {
  _XelaDatePickerState();

  var daysPerWeek = 7;
  List<String> weekdays = [];

  DateTime currentYearMonth = DateTime.now();

  List<Widget> weekdaysChildren = [];

  @override
  void initState() {
    super.initState();

    widget.minDate ??= DateTime.now();
    widget.maxDate ??= DateTime.now().add(const Duration(days: 365));
    widget.selectedDates ??= [];

    initializeDateFormatting(widget.localeName);
    final tempWeekdays =
        DateFormat.EEEE(widget.localeName).dateSymbols.SHORTWEEKDAYS;
    if (widget.firstDayOfWeek == XelaFirstDayOfWeek.MONDAY) {
      for (var i = 1; i < 7; i++) {
        weekdays.add(tempWeekdays[i]);
      }
      weekdays.add(tempWeekdays[0]);
    } else {
      weekdays = tempWeekdays;
    }

    currentYearMonth = DateTime(widget.minDate!.year,
        widget.minDate!.month + widget.monthOffset, widget.minDate!.day);

    for (var weekday in weekdays) {
      weekdaysChildren.add(Expanded(
        child: Text(
          weekday.capitalize ?? '',
          style:
              XelaTextStyle.xelaCaption.apply(color: widget.weekdayHeaderColor),
          textAlign: TextAlign.center,
        ),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.minDate ??= DateTime.now();
    widget.maxDate ??= DateTime.now().add(const Duration(days: 365));
    widget.selectedDates ??= [];

    if (widget.selectedDates != null) {
      for (var k = 0; k < widget.selectedDates!.length; k++) {
        widget.selectedDates![k] = DateTime(widget.selectedDates![k].year,
            widget.selectedDates![k].month, widget.selectedDates![k].day);
      }
    }

    if (widget.startDate != null) {
      widget.startDate = DateTime(widget.startDate!.year,
          widget.startDate!.month, widget.startDate!.day);
    }

    if (widget.endDate != null) {
      widget.endDate = DateTime(
          widget.endDate!.year, widget.endDate!.month, widget.endDate!.day);
    }

    if (widget.selectedDate != null) {
      widget.selectedDate = DateTime(widget.selectedDate!.year,
          widget.selectedDate!.month, widget.selectedDate!.day);
    }

    final int lastMonthDay =
        DateTime(currentYearMonth.year, currentYearMonth.month + 1, 0).day;
    final int firstDayOfWeek =
        DateTime(currentYearMonth.year, currentYearMonth.month, 1).weekday;
    final int rows = ((lastMonthDay + firstDayOfWeek) ~/ daysPerWeek) +
        ((lastMonthDay + firstDayOfWeek) % (daysPerWeek) > 0 ? 1 : 0);
    final List<DateTime> days = [];

    final DateTime prevMonth =
        DateTime(currentYearMonth.year, currentYearMonth.month - 1, 1);
    final int lastPrevMonthDay = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;
    final DateTime nextMonth =
        DateTime(currentYearMonth.year, currentYearMonth.month + 1, 1);
    int day;
    int i;
    for (var r = 0; r < rows; r++) {
      for (var cell = 1; cell <= daysPerWeek; cell++) {
        i = (r * daysPerWeek) + cell + 1;
        if (firstDayOfWeek >= i) {
          day = lastPrevMonthDay - (firstDayOfWeek - i);
          days.add(DateTime(prevMonth.year, prevMonth.month, day));
        } else {
          day = i - firstDayOfWeek;
          if (lastMonthDay < day) {
            day -= lastMonthDay;
            days.add(DateTime(nextMonth.year, nextMonth.month, day));
          } else {
            days.add(
                DateTime(currentYearMonth.year, currentYearMonth.month, day));
          }
        }
      }
    }

    final List<Widget> rowsList = [];

    final DateTime today = DateTime.now();

    for (var r = 0; r < rows; r++) {
      final List<Widget> cells = [];

      for (var cell = 0; cell < daysPerWeek; cell++) {
        final int index = (r * daysPerWeek) + cell;
        final DateTime dayDate = days[index];
        bool isEnabledDate = false;

        if (widget.minDate != null && widget.maxDate != null) {
          isEnabledDate = (dayDate.month == currentYearMonth.month &&
              dayDate
                  .isAfter(widget.minDate!.subtract(const Duration(days: 1))) &&
              dayDate.isBefore(widget.maxDate!));
        }

        if (widget.disabledDates != null && isEnabledDate) {
          isEnabledDate = !widget.disabledDates!.contains(dayDate);
        }

        Color backgroundColor = widget.textBackground;
        Color textColor = widget.textColor;

        if (widget.selectedDates != null) {
          textColor = isEnabledDate
              ? dayDate == widget.selectedDate ||
                      widget.selectedDates!.contains(dayDate) ||
                      dayDate == widget.startDate ||
                      dayDate == widget.endDate
                  ? widget.selectedColor
                  : dayDate == DateTime(today.year, today.month, today.day)
                      ? widget.todayColor
                      : widget.textColor
              : widget.disabledColor;
        }

        if (widget.startDate != null &&
            widget.endDate != null &&
            isEnabledDate &&
            widget.mode == XelaDatePickerMode.RANGE_DATES) {
          if (dayDate.isAfter(widget.startDate!) &&
              dayDate.isBefore(widget.endDate!) &&
              textColor != widget.selectedColor) {
            textColor = widget.betweenStartAndEndColor;
          }
        }

        if (widget.selectedDates != null) {
          backgroundColor = isEnabledDate
              ? dayDate == widget.selectedDate ||
                      widget.selectedDates!.contains(dayDate) ||
                      dayDate == widget.startDate ||
                      dayDate == widget.endDate
                  ? widget.selectedBackground
                  : dayDate == DateTime(today.year, today.month, today.day)
                      ? widget.todayBackground
                      : widget.textBackground
              : widget.disabledBackground;
        }

        if (widget.startDate != null &&
            widget.endDate != null &&
            isEnabledDate &&
            widget.mode == XelaDatePickerMode.RANGE_DATES) {
          if (dayDate.isAfter(widget.startDate!) &&
              dayDate.isBefore(widget.endDate!) &&
              textColor != widget.selectedColor) {
            backgroundColor = widget.betweenStartAndEndBackground;
          }
        }

        cells.add(Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                if (isEnabledDate) {
                  setState(() {
                    if (widget.mode == XelaDatePickerMode.SINGLE_DATE) {
                      if (widget.selectedDate == dayDate) {
                        widget.selectedDate = null;
                      } else {
                        widget.selectedDate = dayDate;
                      }
                    } else if (widget.mode == XelaDatePickerMode.RANGE_DATES) {
                      if (widget.startDate == null) {
                        widget.startDate = dayDate;
                      } else if (widget.startDate == dayDate) {
                        widget.startDate = null;
                        if (widget.endDate != null) {
                          widget.startDate = widget.endDate;
                          widget.endDate = null;
                        }
                      } else if (widget.endDate == null &&
                          widget.startDate != null) {
                        if (dayDate.isAfter(widget.startDate!)) {
                          widget.endDate = dayDate;
                        } else {
                          widget.startDate = null;
                          widget.endDate = null;
                        }
                      } else if (widget.endDate == dayDate) {
                        widget.endDate = null;
                      } else {
                        widget.startDate = null;
                        widget.endDate = null;
                      }
                    } else if (widget.mode ==
                        XelaDatePickerMode.MULTIPLY_DATES) {
                      widget.selectedDates ??= [];
                      if (widget.selectedDates!.contains(dayDate)) {
                        widget.selectedDates!.remove(dayDate);
                      } else {
                        widget.selectedDates!.add(dayDate);
                      }
                    }
                  });

                  if (widget.onTapDate != null) {
                    widget.onTapDate!(dayDate);
                  }
                }
              },
              child: Ink(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: backgroundColor ==
                                  widget.betweenStartAndEndBackground
                              ? 6
                              : 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                backgroundColor !=
                                        widget.betweenStartAndEndBackground
                                    ? 8
                                    : 0),
                            color: backgroundColor,
                            border: dayDate ==
                                    DateTime(today.year, today.month, today.day)
                                ? Border.all(color: widget.todayColor, width: 2)
                                : Border.all(
                                    color: backgroundColor ==
                                            widget.betweenStartAndEndBackground
                                        ? backgroundColor
                                        : Colors.transparent,
                                    width: 2)),
                      ),
                    ),
                    Text(
                      dayDate.day.toString(),
                      style: TextStyle(
                          fontSize: XelaTextStyle.xelaButtonMedium.fontSize,
                          fontWeight: isEnabledDate
                              ? XelaTextStyle.xelaButtonMedium.fontWeight
                              : FontWeight.normal,
                          fontFamily: XelaTextStyle.xelaButtonMedium.fontFamily,
                          color: textColor),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
      }

      rowsList.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: cells,
        ),
      ));
    }

    final datesContainer = Column(
      children: rowsList,
    );

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentYearMonth.year.toString(),
              style: XelaTextStyle.xelaHeadline.apply(
                  color: widget.yearHeaderColor),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              DateFormat('MMMM', widget.localeName)
                      .format(currentYearMonth)
                      .capitalize ??
                  '',
              style: XelaTextStyle.xelaHeadline.apply(
                  color: widget.monthHeaderColor),
            ),
            const Spacer(),
            widget.prevMonthIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        currentYearMonth = DateTime(currentYearMonth.year,
                            currentYearMonth.month - 1, currentYearMonth.day);
                      });
                    },
                    child: Ink(
                      width: 32,
                      height: 32,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: widget.changeMonthBackground,
                            border: Border.all(
                                color: widget.changeMonthBorderColor)),
                        width: 32,
                        height: 32,
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: FittedBox(
                            child: widget.prevMonthIcon,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              width: 8,
            ),
            widget.nextMonthIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        currentYearMonth = DateTime(currentYearMonth.year,
                            currentYearMonth.month + 1, currentYearMonth.day);
                      });
                    },
                    child: Ink(
                      width: 32,
                      height: 32,
                      child: Container(
                        alignment: Alignment.center,
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: widget.changeMonthBackground,
                            border: Border.all(
                                color: widget.changeMonthBorderColor)),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: FittedBox(
                            child: widget.nextMonthIcon,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        XelaDivider(
          color: widget.dividerColor,
          style: XelaDividerStyle.DOTTED,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(
            children: weekdaysChildren,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: datesContainer,
        )
      ],
    );
  }
}

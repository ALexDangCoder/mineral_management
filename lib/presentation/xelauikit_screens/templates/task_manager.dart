import 'package:bnv_opendata/domain/models/xela_date_picker_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/task_manager_details.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_accordion.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_date_picker.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
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
                        hoverElevation: 0,
                        focusElevation: 2,
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
                          Text("Tasks",
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
                        padding: const EdgeInsets.only(
                            top: 20, left: 32, right: 32, bottom: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                XelaUserAvatar(
                                    image: Image.asset(
                                        "assets/images/avatar1.png")),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Cody Fisher",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(
                                                color: _isDark
                                                    ? Colors.white
                                                    : XelaColor.Gray2)),
                                    Text("kenzi.lawson@example.com",
                                        style: XelaTextStyle.xelaSmallBodyBold
                                            .apply(color: XelaColor.Gray6)),
                                  ],
                                )),
                                const SizedBox(width: 12),
                                Icon(Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)
                              ],
                            ),
                            const SizedBox(height: 24),
                            XelaDatePicker(
                              minDate: DateTime.now()
                                  .subtract(const Duration(days: 365)),
                              monthOffset: 12,
                              prevMonthIcon: Icon(
                                Icons.arrow_back,
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray3,
                              ),
                              nextMonthIcon: Icon(
                                Icons.arrow_forward,
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray3,
                              ),
                              mode: XelaDatePickerMode.SINGLE_DATE,
                              selectedDate: selectedDate,
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
                                  if (selectedDate != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TaskManagerDetails(
                                                  selectedDate: selectedDate!)),
                                    );
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 24),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray3
                                    : XelaColor.Gray11),
                            const SizedBox(height: 8),
                            XelaAccordion(
                                closeIcon: Icon(Icons.expand_more,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                openIcon: Icon(Icons.expand_less,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                openTitleColor: XelaColor.Gray8,
                                closeTitleColor: XelaColor.Gray8,
                                openBackground: Colors.transparent,
                                closeBackground: Colors.transparent,
                                isOpen: true,
                                title: "Teams",
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "Account",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                          isChecked: true,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: 20,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar4.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar3.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "Fact Checking",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: 40,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar3.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                right: 20,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar1.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar2.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "Dev",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: 40,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar4.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                right: 20,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar5.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar6.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "News and Updates",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar7.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "Budget",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                          isChecked: true,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: 20,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar8.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar9.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: XelaCheckbox(
                                          checkboxIcon: const Icon(Icons.done,
                                              color: Colors.white),
                                          label: "Business",
                                          labelColor: _isDark
                                              ? XelaColor.Gray11
                                              : XelaColor.Gray2,
                                          defaultColor: _isDark
                                              ? XelaColor.Gray4
                                              : XelaColor.Gray11,
                                          selectedColor: _isDark
                                              ? XelaColor.Blue6
                                              : XelaColor.Blue3,
                                          isChecked: true,
                                        )),
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                                right: 60,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar6.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                right: 40,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar7.png"),
                                                  ),
                                                )),
                                            Positioned(
                                                right: 20,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: _isDark
                                                              ? XelaColor.Gray2
                                                              : XelaColor
                                                                  .Gray12,
                                                          width: 2)),
                                                  child: XelaUserAvatar(
                                                    style: XelaUserAvatarStyle
                                                        .CIRCLE,
                                                    size: XelaUserAvatarSize
                                                        .SMALL,
                                                    image: Image.asset(
                                                        "assets/images/avatar8.png"),
                                                  ),
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: _isDark
                                                          ? XelaColor.Gray2
                                                          : XelaColor.Gray12,
                                                      width: 2)),
                                              child: XelaUserAvatar(
                                                style:
                                                    XelaUserAvatarStyle.CIRCLE,
                                                size: XelaUserAvatarSize.SMALL,
                                                image: Image.asset(
                                                    "assets/images/avatar1.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 8),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray3
                                    : XelaColor.Gray11),
                            const SizedBox(height: 8),
                            XelaAccordion(
                                closeIcon: Icon(Icons.expand_more,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                openIcon: Icon(Icons.expand_less,
                                    size: 15,
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2),
                                openTitleColor: XelaColor.Gray8,
                                closeTitleColor: XelaColor.Gray8,
                                openBackground: Colors.transparent,
                                closeBackground: Colors.transparent,
                                isOpen: true,
                                title: "Type",
                                content: Column(
                                  children: [
                                    XelaCheckbox(
                                      checkboxIcon: const Icon(Icons.done,
                                          color: Colors.white),
                                      label: "Install",
                                      labelColor: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2,
                                      defaultColor: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      selectedColor: _isDark
                                          ? XelaColor.Blue6
                                          : XelaColor.Blue3,
                                      isChecked: true,
                                    ),
                                    const SizedBox(height: 8),
                                    XelaCheckbox(
                                      checkboxIcon: const Icon(Icons.done,
                                          color: Colors.white),
                                      label: "Re-install",
                                      labelColor: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2,
                                      defaultColor: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      selectedColor: _isDark
                                          ? XelaColor.Blue6
                                          : XelaColor.Blue3,
                                    ),
                                    const SizedBox(height: 8),
                                    XelaCheckbox(
                                      checkboxIcon: const Icon(Icons.done,
                                          color: Colors.white),
                                      label: "Package-selected",
                                      labelColor: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2,
                                      defaultColor: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      selectedColor: _isDark
                                          ? XelaColor.Blue6
                                          : XelaColor.Blue3,
                                    ),
                                    const SizedBox(height: 8),
                                    XelaCheckbox(
                                      checkboxIcon: const Icon(Icons.done,
                                          color: Colors.white),
                                      label: "Re-attribution",
                                      labelColor: _isDark
                                          ? XelaColor.Gray11
                                          : XelaColor.Gray2,
                                      defaultColor: _isDark
                                          ? XelaColor.Gray4
                                          : XelaColor.Gray11,
                                      selectedColor: _isDark
                                          ? XelaColor.Blue6
                                          : XelaColor.Blue3,
                                    ),
                                  ],
                                )),
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

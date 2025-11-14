import 'package:bnv_opendata/domain/models/xela_radiobutton_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_radiobutton.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class RadioButtonComponent extends StatefulWidget {
  const RadioButtonComponent({Key? key}) : super(key: key);

  @override
  _RadioButtonComponentState createState() => _RadioButtonComponentState();
}

class _RadioButtonComponentState extends State<RadioButtonComponent> {
  bool _isDark = false;

  List<XelaRadioButtonItem> items = [
    XelaRadioButtonItem(
        id: "1",
        label: "Label",
        caption: "caption",
        value: "\$15/mo",
        state: XelaRadioButtonState.DISABLED),
    XelaRadioButtonItem(id: "2", label: "Label", caption: "caption"),
    XelaRadioButtonItem(
        id: "3", label: "Label", caption: "caption", value: "\$25/mo"),
    XelaRadioButtonItem(
      id: "4",
      label: "Label",
      caption: "caption",
    ),
    XelaRadioButtonItem(
      id: "5",
      label: "Label",
      caption: "caption",
    ),
  ];

  List<XelaRadioButtonItem> itemsOnlyLabel = [
    XelaRadioButtonItem(
        id: "1",
        label: "Label",
        value: "\$15/mo",
        state: XelaRadioButtonState.DISABLED),
    XelaRadioButtonItem(
      id: "2",
      label: "Label",
    ),
    XelaRadioButtonItem(id: "3", label: "Label", value: "\$25/mo"),
    XelaRadioButtonItem(
      id: "4",
      label: "Label",
    ),
    XelaRadioButtonItem(
      id: "5",
      label: "Label",
    ),
  ];

  List<XelaRadioButtonItem> itemsOnlyCaption = [
    XelaRadioButtonItem(
        id: "1",
        caption: "caption",
        value: "\$15/mo",
        state: XelaRadioButtonState.DISABLED),
    XelaRadioButtonItem(id: "2", caption: "caption"),
    XelaRadioButtonItem(id: "3", caption: "caption", value: "\$25/mo"),
    XelaRadioButtonItem(
      id: "4",
      caption: "caption",
    ),
    XelaRadioButtonItem(
      id: "5",
      caption: "caption",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: kIsWeb ? 0 : 24),
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
                        "Radio Button",
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
                        "Large",
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: items,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.LARGE,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: items,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.LARGE,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyLabel,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.LARGE,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyLabel,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.LARGE,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyCaption,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.LARGE,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyCaption,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.LARGE,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Medium",
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: items,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.MEDIUM,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: items,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.MEDIUM,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyLabel,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.MEDIUM,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyLabel,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.MEDIUM,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyCaption,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.MEDIUM,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyCaption,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.MEDIUM,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Small",
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: items,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.SMALL,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: items,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.SMALL,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyLabel,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.SMALL,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyLabel,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.SMALL,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                        items: itemsOnlyCaption,
                        onChange: (item) {},
                        size: XelaRadioButtonSize.SMALL,
                        selectedColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        defaultColor:
                            _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                        labelColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        captionColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                        valueColor:
                            _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: XelaRadioButtonGroup(
                      items: itemsOnlyCaption,
                      onChange: (item) {},
                      size: XelaRadioButtonSize.SMALL,
                      selectedColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      defaultColor:
                          _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                      labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                      valueColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      itemBorder: true,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

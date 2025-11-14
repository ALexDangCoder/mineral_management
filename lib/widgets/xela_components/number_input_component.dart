import 'package:bnv_opendata/domain/models/xela_number_input_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_number_input.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class NumberInputComponent extends StatefulWidget {
  const NumberInputComponent({Key? key}) : super(key: key);

  @override
  _NumberInputComponentState createState() => _NumberInputComponentState();
}

class _NumberInputComponentState extends State<NumberInputComponent> {
  bool _isDark = false;
  int value = 1;

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
                        "Number Input",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                              onChange: (val) {
                                if (val < 0) {
                                  setState(() {
                                    value = 0;
                                  });
                                }
                              },
                              label: "width",
                              helperText: "Helper Text",
                              value: value,
                              decreaseIcon: Icon(Icons.remove,
                                  size: 15,
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                              increaseIcon: Icon(Icons.add,
                                  size: 15,
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                              defaultBorderColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              defaultBackground:
                                  _isDark ? Colors.transparent : Colors.white,
                              labelColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              valueColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              helperTextColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants state: DEFAULT",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                              onChange: (val) {},
                              value: 1,
                              decreaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              increaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              defaultBorderColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              defaultBackground:
                                  _isDark ? Colors.transparent : Colors.white,
                              labelColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              valueColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              helperTextColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8),
                          XelaNumberInput(
                              onChange: (val) {},
                              label: "Label",
                              value: 1,
                              decreaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              increaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              defaultBorderColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              defaultBackground:
                                  _isDark ? Colors.transparent : Colors.white,
                              labelColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              valueColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              helperTextColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                              onChange: (val) {},
                              value: 1,
                              helperText: "Helper Text",
                              decreaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              increaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              defaultBorderColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              defaultBackground:
                                  _isDark ? Colors.transparent : Colors.white,
                              labelColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              valueColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              helperTextColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8),
                          XelaNumberInput(
                              onChange: (val) {},
                              label: "Label",
                              value: 1,
                              helperText: "Helper Text",
                              decreaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              increaseIcon: Icon(Icons.grid_view,
                                  size: 15, color: XelaColor.Gray3),
                              defaultBorderColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              defaultBackground:
                                  _isDark ? Colors.transparent : Colors.white,
                              labelColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              valueColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              helperTextColor:
                                  _isDark ? XelaColor.Gray6 : XelaColor.Gray8)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants state: ERROR",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.ERROR,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.ERROR,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.ERROR,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.ERROR,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants state: SUCCESS",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.SUCCESS,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.SUCCESS,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.SUCCESS,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.SUCCESS,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Variants state: DISABLED",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            disabledBackground:
                                _isDark ? XelaColor.Gray2 : XelaColor.Gray11,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.DISABLED,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            disabledBackground:
                                _isDark ? XelaColor.Gray2 : XelaColor.Gray11,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.DISABLED,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Center(
                      child: Row(
                        children: [
                          XelaNumberInput(
                            onChange: (val) {},
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            disabledBackground:
                                _isDark ? XelaColor.Gray2 : XelaColor.Gray11,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.DISABLED,
                          ),
                          XelaNumberInput(
                            onChange: (val) {},
                            label: "Label",
                            value: 1,
                            helperText: "Helper Text",
                            decreaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            increaseIcon: Icon(Icons.grid_view,
                                size: 15, color: XelaColor.Gray3),
                            defaultBorderColor:
                                _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                            defaultBackground:
                                _isDark ? Colors.transparent : Colors.white,
                            disabledBackground:
                                _isDark ? XelaColor.Gray2 : XelaColor.Gray11,
                            labelColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            valueColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            helperTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                            state: XelaNumberInputState.DISABLED,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

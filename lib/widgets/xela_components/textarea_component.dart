import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textarea.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TextareaComponent extends StatefulWidget {
  const TextareaComponent({Key? key}) : super(key: key);

  @override
  _TextareaComponentState createState() => _TextareaComponentState();
}

class _TextareaComponentState extends State<TextareaComponent> {
  bool _isDark = false;

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
                        "Textarea",
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
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaTextarea(
                          placeholder: "Placeholder",
                          value: "",
                          placeholderColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          counterColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          defaultHelperTextColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background:
                              _isDark ? Colors.transparent : Colors.white,
                          borderFocusColor:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaTextarea(
                          placeholder: "Placeholder",
                          value: "",
                          showCounter: true,
                          placeholderColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          counterColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          defaultHelperTextColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background:
                              _isDark ? Colors.transparent : Colors.white,
                          borderFocusColor:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaTextarea(
                          placeholder: "Placeholder",
                          value: "",
                          helperText: "Helper Text",
                          placeholderColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          counterColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          defaultHelperTextColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background:
                              _isDark ? Colors.transparent : Colors.white,
                          borderFocusColor:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: XelaTextarea(
                          placeholder: "Placeholder",
                          value: "",
                          helperText: "Helper Text",
                          showCounter: true,
                          placeholderColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          counterColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          defaultHelperTextColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background:
                              _isDark ? Colors.transparent : Colors.white,
                          borderFocusColor:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3)),
                ],
              ))
            ],
          ),
        ));
  }
}

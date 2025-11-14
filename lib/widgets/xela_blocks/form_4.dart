import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Form4 extends StatefulWidget {
  @override
  _Form4State createState() => _Form4State();
}

class _Form4State extends State<Form4> {
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
        //resizeToAvoidBottomInset: false,
        backgroundColor: _isDark ? XelaColor.Gray1 : XelaColor.Gray12,
        body: Padding(
          padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
          child: Column(
            children: [
              Row(
                children: [
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
                          size: 20,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                    ),
                  ),
                  const Spacer(),
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
                      ))
                ],
              ),
              Expanded(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: _isDark ? XelaColor.Gray2 : Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    //physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign up as",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2)),
                        Text("Company Name",
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Blue5
                                    : XelaColor.Blue3)),
                        const SizedBox(height: 24),
                        XelaTextField(
                          placeholder: "Company name",
                          value: "Barone LLC.",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Address",
                          value: "",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: XelaTextField(
                                placeholder: "Your name",
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                background: Colors.transparent,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: XelaTextField(
                                placeholder: "Your role",
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                background: Colors.transparent,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Email Address",
                          value: "",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Mobile Number",
                          value: "",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: XelaCheckbox(
                                defaultColor: _isDark
                                    ? XelaColor.Gray3
                                    : XelaColor.Gray11,
                                selectedColor:
                                    _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                                checkboxIcon:
                                    const Icon(Icons.done, color: Colors.white),
                                labelColor: _isDark
                                    ? XelaColor.Gray10
                                    : XelaColor.Gray8,
                                label:
                                    "By creating an account, you agree to the Terms of Service and Privacy Policy ",
                                isChecked: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            XelaButton(
                              onPressed: () {},
                              autoResize: false,
                              text: "Sign Up",
                              background:
                                  _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}

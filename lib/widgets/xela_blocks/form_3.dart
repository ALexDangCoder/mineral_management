import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Form3 extends StatefulWidget {
  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {
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
                      children: [
                        Text("Create account",
                            style: XelaTextStyle.xelaTitle3.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2)),
                        const SizedBox(height: 24),
                        XelaTextField(
                          placeholder: "Username",
                          value: "Cody Fisher",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Email Address",
                          value: "michael.mitc@example.com",
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
                                placeholder: "Password",
                                secureField: true,
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
                                placeholder: "Confirm",
                                secureField: true,
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
                        const SizedBox(height: 24),
                        XelaCheckbox(
                          defaultColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Purple3 : XelaColor.Purple3,
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          labelColor:
                              _isDark ? XelaColor.Gray10 : XelaColor.Gray8,
                          label:
                              "By creating an account, you agree to the Terms of Service and Privacy Policy ",
                          isChecked: true,
                        ),
                        const SizedBox(height: 16),
                        XelaButton(
                          onPressed: () {},
                          autoResize: false,
                          text: "Register",
                          background:
                              _isDark ? XelaColor.Purple3 : XelaColor.Purple3,
                        ),
                        const SizedBox(height: 24),
                        Text("or",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray8)),
                        const SizedBox(height: 24),
                        XelaButton(
                          onPressed: () {},
                          text: "Continue with Google",
                          leftIcon: Image.asset(
                            "assets/images/form_google_icon.png",
                            width: 24,
                            height: 24,
                          ),
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? XelaColor.Gray12 : XelaColor.Gray2,
                          size: XelaButtonSize.MEDIUM,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          autoResize: false,
                        ),
                        const SizedBox(height: 16),
                        XelaButton(
                          onPressed: () {},
                          text: "Continue with Facebook",
                          leftIcon: Image.asset(
                            "assets/images/form_fb_image.png",
                            width: 24,
                            height: 24,
                          ),
                          type: XelaButtonType.SECONDARY,
                          background: Colors.transparent,
                          foregroundColor:
                              _isDark ? XelaColor.Gray12 : XelaColor.Gray2,
                          size: XelaButtonSize.MEDIUM,
                          defaultBorderColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          autoResize: false,
                        ),
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

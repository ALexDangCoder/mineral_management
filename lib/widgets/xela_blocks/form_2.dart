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

class Form2 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
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
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
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
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: _isDark ? XelaColor.Gray2 : Colors.white),
                    child: Column(
                      children: [
                        Text("Get’s started",
                            style: XelaTextStyle.xelaTitle3.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Spacer(),
                            Text("Already have an account? ",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2)),
                            Text("Log in",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Orange5
                                        : XelaColor.Orange3)),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 24),
                        XelaButton(
                          onPressed: () {},
                          text: "Sign up with Facebook",
                          rightIcon: Image.asset(
                              "assets/images/form_fb_icon.png",
                              width: 20,
                              height: 20),
                          background:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          size: XelaButtonSize.MEDIUM,
                        ),
                        const SizedBox(height: 8),
                        XelaButton(
                          onPressed: () {},
                          text: "Sign up with Google",
                          rightIcon: Image.asset(
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
                        ),
                        const SizedBox(height: 24),
                        Text("Or continue with ",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray8)),
                        const SizedBox(height: 24),
                        XelaTextField(
                          placeholder: "Email Address",
                          leftIcon: Icon(Icons.email,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                          value: "michael.mitc@example.com",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Password",
                          secureField: true,
                          leftIcon: Icon(Icons.password,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 24),
                        XelaCheckbox(
                          defaultColor:
                              _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                          selectedColor:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          checkboxIcon:
                              const Icon(Icons.done, color: Colors.white),
                          labelColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          label: "I agreeing to platform Terms of service",
                        ),
                        const SizedBox(height: 16),
                        XelaButton(
                          onPressed: () {},
                          autoResize: false,
                          text: "Register",
                          background:
                              _isDark ? XelaColor.Orange5 : XelaColor.Orange3,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer()
              ],
            )));
  }
}

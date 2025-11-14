import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class Form1 extends StatefulWidget {
  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
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
                        Text("Create Your Free Account",
                            style: XelaTextStyle.xelaHeadline.apply(
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
                                        ? XelaColor.Blue5
                                        : XelaColor.Blue3)),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 24),
                        XelaTextField(
                          placeholder: "Full Name",
                          rightIcon: Icon(Icons.account_circle,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                          value: "Marvin McKinney",
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaTextField(
                          placeholder: "Email Address",
                          rightIcon: Icon(Icons.email,
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
                          placeholder: "Company Name",
                          rightIcon: Icon(Icons.business,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
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
                          rightIcon: Icon(Icons.password,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                          borderDefaultColor:
                              _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                          background: Colors.transparent,
                          textfieldColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                        ),
                        const SizedBox(height: 16),
                        XelaButton(
                          onPressed: () {},
                          autoResize: false,
                          text: "Create Account",
                          rightIcon: const Icon(Icons.arrow_forward,
                              size: 15, color: Colors.white),
                          background:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Spacer(),
                            Text("By signing up you are agreeing to ",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: _isDark
                                        ? XelaColor.Gray11
                                        : XelaColor.Gray2)),
                            Text("Terms & Conditions",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: _isDark
                                        ? XelaColor.Blue5
                                        : XelaColor.Blue3)),
                            const Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer()
              ],
            )));
  }
}

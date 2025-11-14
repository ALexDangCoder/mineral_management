import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_checkbox_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
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
        backgroundColor: _isDark ? Colors.black : Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: XelaColor.Gray2,
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
                      Text("Checkout",
                          style: XelaTextStyle.xelaButtonLarge.apply(
                              color: Colors.white)),
                      const Spacer(),
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 32,
                                  height: 32,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: _isDark
                                          ? XelaColor.Blue8
                                          : XelaColor.Blue11),
                                  child: Text("1",
                                      style:
                                          XelaTextStyle.xelaButtonMedium.apply(
                                              color: _isDark
                                                  ? XelaColor.Blue2
                                                  : XelaColor.Blue3)),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Personal Details",
                                        style: XelaTextStyle.xelaHeadline.apply(
                                            color: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2)),
                                    Row(
                                      children: [
                                        Text("If you already have an account ",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: XelaColor.Gray6)),
                                        Text("Sign in here",
                                            style:
                                                XelaTextStyle.xelaCaption.apply(
                                                    color: _isDark
                                                        ? XelaColor.Blue6
                                                        : XelaColor.Blue3))
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "First name",
                              value: "Roselle",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "Last name",
                              value: "Ehrman",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "Phone number",
                              value: "(+33)7 45 55 87 71",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "Email",
                              value: "vuhaithuongnute@gmail.com",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "Country",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "State",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "City",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "ZIP Code",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            XelaTextField(
                              placeholder: "Address",
                              value: "775 Rolling Green Rd.",
                              borderDefaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              background:
                                  _isDark ? XelaColor.Gray1 : Colors.white,
                              textfieldColor:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                XelaButton(
                                  onPressed: () {},
                                  type: XelaButtonType.SECONDARY,
                                  defaultBorderColor: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11,
                                  text: "Add secondary address",
                                  background: Colors.transparent,
                                  foregroundColor: _isDark
                                      ? XelaColor.Blue6
                                      : XelaColor.Blue3,
                                  size: XelaButtonSize.SMALL,
                                  leftIcon: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: _isDark
                                        ? XelaColor.Blue6
                                        : XelaColor.Blue3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            XelaCheckbox(
                              checkboxIcon: const Icon(Icons.done,
                                  size: 15, color: Colors.white),
                              selectedColor:
                                  _isDark ? XelaColor.Blue6 : XelaColor.Blue3,
                              defaultColor:
                                  _isDark ? XelaColor.Gray4 : XelaColor.Gray11,
                              size: XelaCheckboxSize.LARGE,
                              isChecked: true,
                              label:
                                  "My billing address is the same as my delivery address",
                              labelColor:
                                  _isDark ? Colors.white : XelaColor.Gray2,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                XelaButton(
                                  onPressed: () {},
                                  type: XelaButtonType.SECONDARY,
                                  defaultBorderColor: _isDark
                                      ? XelaColor.Gray4
                                      : XelaColor.Gray11,
                                  background: Colors.transparent,
                                  foregroundColor: _isDark
                                      ? XelaColor.Blue6
                                      : XelaColor.Blue3,
                                  size: XelaButtonSize.MEDIUM,
                                  leftIcon: Icon(
                                    Icons.chevron_left,
                                    size: 18,
                                    color: _isDark
                                        ? XelaColor.Blue6
                                        : XelaColor.Blue3,
                                  ),
                                ),
                                const Spacer(),
                                XelaButton(
                                  onPressed: () {},
                                  text: "Proceed to checkout",
                                  rightIcon: const Icon(Icons.navigate_next,
                                      size: 16, color: Colors.white),
                                  autoResize: true,
                                  background: _isDark
                                      ? XelaColor.Blue6
                                      : XelaColor.Blue3,
                                )
                              ],
                            )
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

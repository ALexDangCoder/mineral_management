import 'dart:ui';

import 'package:flutter/material.dart';

///=========== Colors for default when didn't setup app theme ===============
///https://stackoverflow.com/a/17239853
const colorPrimary = Color(0xff0ABAB5);
const colorPrimaryTransparent = Color(0x720ABAB5);
const colorAccent = Color(0xffDCFFFE);
const colorSelected = Color(0xFFE0F2F1);
const blackColor = Color(0xFF303742);

///=========== Using to make change app theme ================================
abstract class AppColor {
  Color primaryColor();

  Color accentColor();

  Color statusColor();

  Color mainColor();

  Color bgColor();

  Color dfTxtColor();

  Color secondTxtColor();

  Color dfBtnColor();

  Color dfBtnTxtColor();

  Color txtLightColor();

  Color sideBtnColor();

  Color disableColor();

  Color errorColor();
}

class LightApp extends AppColor {
  @override
  Color primaryColor() {
    return colorPrimary;
  }

  @override
  Color accentColor() {
    return colorAccent;
  }

  @override
  Color statusColor() {
    return const Color(0xFFFCFCFC);
  }

  @override
  Color mainColor() {
    return const Color(0xFF30536F);
  }

  @override
  Color bgColor() {
    return const Color(0xFFFCFCFC);
  }

  @override
  Color dfBtnColor() {
    return const Color(0xFF324452);
  }

  @override
  Color dfBtnTxtColor() {
    return const Color(0xFFFFFFFF);
  }

  @override
  Color dfTxtColor() {
    return const Color(0xFF303742);
  }

  @override
  Color secondTxtColor() {
    return const Color(0xFF9097A3);
  }

  @override
  Color txtLightColor() {
    return Colors.white.withOpacity(0.85);
  }

  @override
  Color sideBtnColor() {
    return const Color(0xFFDCFFFE);
  }

  @override
  Color disableColor() {
    return const Color(0xFFA9B8BD);
  }

  @override
  Color errorColor() {
    return Colors.red;
  }

}

class DarkApp extends AppColor {
  @override
  Color primaryColor() {
    return Colors.black;
  }

  @override
  Color accentColor() {
    return Colors.black;
  }

  @override
  Color statusColor() {
    return Colors.black;
  }

  @override
  Color mainColor() {
    return Colors.black.withOpacity(0.8);
  }

  @override
  Color bgColor() {
    return Colors.black.withOpacity(0.8);
  }

  @override
  Color dfBtnColor() {
    return Colors.white.withOpacity(0.8);
  }

  @override
  Color dfBtnTxtColor() {
    return Colors.black.withOpacity(0.6);
  }

  @override
  Color dfTxtColor() {
    return Colors.white.withOpacity(0.6);
  }

  @override
  Color secondTxtColor() {
    return Colors.black.withOpacity(0.4);
  }

  @override
  Color txtLightColor() {
    return Colors.white.withOpacity(0.85);
  }

  @override
  Color sideBtnColor() {
    return const Color(0xFFA9B8BD);
  }

  @override
  Color disableColor() {
    return Colors.grey;
  }

  @override
  Color errorColor() {
    return Colors.red;
  }
}

///============ End setup app theme ======================================

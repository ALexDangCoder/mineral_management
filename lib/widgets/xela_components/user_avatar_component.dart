import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class UserAvatarComponent extends StatefulWidget {
  const UserAvatarComponent({Key? key}) : super(key: key);

  @override
  _UserAvatarComponentState createState() => _UserAvatarComponentState();
}

class _UserAvatarComponentState extends State<UserAvatarComponent> {
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
                      Expanded(
                          child: Text(
                        "User Avatar",
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
                        "Image",
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
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          image: Image.asset(
                            "assets/images/user_avatar.png",
                            fit: BoxFit.fill,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Icon",
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
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Initials",
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
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.PLUS,
                          plusIcon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decorationBackground: XelaColor.Blue3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.COUNTER,
                          count: 2,
                          decorationBackground: XelaColor.Red3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.LARGE,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.MEDIUM,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                          decorationPosition:
                              XelaUserAvatarDecorationPosition.TOPRIGHT,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.RECTANGLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                        XelaUserAvatar(
                          initials: "AB",
                          background: XelaColor.Orange9,
                          foreground: XelaColor.Orange3,
                          size: XelaUserAvatarSize.SMALL,
                          style: XelaUserAvatarStyle.CIRCLE,
                          decoration: XelaUserAvatarDecoration.INDICATOR,
                          decorationBackground: XelaColor.Green3,
                          decorationBorderColor:
                              _isDark ? XelaColor.Gray1 : Colors.white,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

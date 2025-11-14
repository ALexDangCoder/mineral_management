import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toast.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ToastComponent extends StatefulWidget {
  const ToastComponent({Key? key}) : super(key: key);

  @override
  _ToastComponentState createState() => _ToastComponentState();
}

class _ToastComponentState extends State<ToastComponent> {
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
                        "Toast",
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Changes saved",
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Undo",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "1 New message",
                      description: "Brooklyn, 5 min ago",
                      avatar: XelaUserAvatar(
                        style: XelaUserAvatarStyle.CIRCLE,
                        image: Image.asset("assets/images/user_avatar.png"),
                        decoration: XelaUserAvatarDecoration.INDICATOR,
                        decorationBorderColor:
                            _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      ),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Reply",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Cancel",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Autoresize Off",
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      description: "Toast description",
                      icon: Icon(Icons.grid_view,
                          size: 20,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      description: "Toast description",
                      avatar: XelaUserAvatar(
                        icon: Icon(Icons.account_circle,
                            size: 20, color: Colors.white),
                      ),
                      //icon: Icon(Icons.grid_view, size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      description: "Toast description",
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      description: "Toast description",
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      icon: Icon(Icons.grid_view,
                          size: 20,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      avatar: XelaUserAvatar(
                        icon: Icon(Icons.account_circle,
                            size: 20, color: Colors.white),
                      ),
                      //icon: Icon(Icons.grid_view, size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      secondActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                      ),
                      rightButton: XelaButton(
                        leftIcon: Icon(
                          Icons.clear,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          size: 20,
                        ),
                        onPressed: () {},
                        size: XelaButtonSize.SMALL,
                        background: Colors.transparent,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      icon: Icon(Icons.grid_view,
                          size: 20,
                          color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      avatar: XelaUserAvatar(
                        icon: Icon(Icons.account_circle,
                            size: 20, color: Colors.white),
                      ),
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaToast(
                      title: "Toast title",
                      firstActionButton: XelaButton(
                        removePaddings: true,
                        onPressed: () {},
                        text: "Action",
                        background: Colors.transparent,
                        foregroundColor:
                            _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      ),
                      background: _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                      titleColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                      descriptionColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        "Autoresize On",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          description: "Toast description",
                          icon: Icon(Icons.grid_view,
                              size: 20,
                              color: _isDark
                                  ? XelaColor.Gray11
                                  : XelaColor.Gray10),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          description: "Toast description",
                          avatar: XelaUserAvatar(
                            icon: Icon(Icons.account_circle,
                                size: 20, color: Colors.white),
                          ),
                          //icon: Icon(Icons.grid_view, size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          description: "Toast description",
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          description: "Toast description",
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          icon: Icon(Icons.grid_view,
                              size: 20,
                              color: _isDark
                                  ? XelaColor.Gray11
                                  : XelaColor.Gray10),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          avatar: XelaUserAvatar(
                            icon: Icon(Icons.account_circle,
                                size: 20, color: Colors.white),
                          ),
                          //icon: Icon(Icons.grid_view, size: 20, color: _isDark ? XelaColor.Gray11 : XelaColor.Gray10),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          secondActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          ),
                          rightButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          icon: Icon(Icons.grid_view,
                              size: 20,
                              color: _isDark
                                  ? XelaColor.Gray11
                                  : XelaColor.Gray10),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          avatar: XelaUserAvatar(
                            icon: Icon(Icons.account_circle,
                                size: 20, color: Colors.white),
                          ),
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaToast(
                          title: "Toast title",
                          firstActionButton: XelaButton(
                            removePaddings: true,
                            onPressed: () {},
                            text: "Action",
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray2,
                          descriptionColor:
                              _isDark ? XelaColor.Gray6 : XelaColor.Gray6,
                          autoresize: true,
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}

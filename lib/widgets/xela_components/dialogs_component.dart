import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_dialog.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class DialogsComponent extends StatefulWidget {
  const DialogsComponent({Key? key}) : super(key: key);

  @override
  _DialogsComponentState createState() => _DialogsComponentState();
}

class _DialogsComponentState extends State<DialogsComponent> {
  bool _isDark = false;

  bool showDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Stack(
          children: [
            Padding(
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
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray2),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            "Dialogs",
                            style: XelaTextStyle.xelaSubheadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
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
                                color: _isDark
                                    ? XelaColor.Gray6
                                    : XelaColor.Gray4),
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
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        alignment: Alignment.center,
                        child: XelaButton(
                          onPressed: () {
                            setState(() {
                              showDialog = true;
                            });
                          },
                          text: "Tap Me!",
                          background:
                              _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            "Variants",
                            style: XelaTextStyle.xelaCaption.apply(
                                color: _isDark
                                    ? XelaColor.Gray6
                                    : XelaColor.Gray4),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: true,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: true,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          closeButton: XelaButton(
                            leftIcon: Icon(
                              Icons.clear,
                              color: XelaColor.Gray3,
                              size: 20,
                            ),
                            onPressed: () {},
                            size: XelaButtonSize.SMALL,
                            background: Colors.transparent,
                          ),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: true,
                          //closeButton: XelaButton(leftIcon: Icon(Icons.clear, color: XelaColor.Gray3, size: 20,), onPressed: () {  }, size: XelaButtonSize.SMALL, background: Colors.transparent,),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          icon: Icon(Icons.grid_view,
                              size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: true,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          //closeButton: XelaButton(leftIcon: Icon(Icons.clear, color: XelaColor.Gray3, size: 20,), onPressed: () {  }, size: XelaButtonSize.SMALL, background: Colors.transparent,),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: false,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          secondaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            background: Colors.transparent,
                            foregroundColor:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                          ),
                          buttonHorizontal: true,
                          //closeButton: XelaButton(leftIcon: Icon(Icons.clear, color: XelaColor.Gray3, size: 20,), onPressed: () {  }, size: XelaButtonSize.SMALL, background: Colors.transparent,),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: XelaDialog(
                          title: "Popup title",
                          description: "Popup description",
                          //icon: Icon(Icons.grid_view, size: 40, color: XelaColor.Gray3),
                          primaryButton: XelaButton(
                            text: "Action",
                            onPressed: () {},
                            autoResize: true,
                            background:
                                _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                            foregroundColor: Colors.white,
                          ),
                          //secondaryButton: XelaButton(text: "Action", onPressed: () {  }, background: Colors.transparent, foregroundColor: _isDark ?  XelaColor.Blue5 : XelaColor.Blue3,),
                          buttonHorizontal: false,
                          //closeButton: XelaButton(leftIcon: Icon(Icons.clear, color: XelaColor.Gray3, size: 20,), onPressed: () {  }, size: XelaButtonSize.SMALL, background: Colors.transparent,),
                          background:
                              _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                          titleColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                          descriptionColor:
                              _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            showDialog
                ? Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: _isDark
                            ? Colors.black.withOpacity(0.8)
                            : Colors.white.withOpacity(0.8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: XelaDialog(
                            icon: Icon(Icons.nightlight_round,
                                size: 40,
                                color:
                                    _isDark ? Colors.white : XelaColor.Gray3),
                            title: "Dark mode",
                            description:
                                "Just letting you know that we have dark mode. You Should give a try! Maybe you like it more.",
                            primaryButton: XelaButton(
                              onPressed: () {},
                              text: "Try Dark mode",
                              autoResize: false,
                              background: XelaColor.Yellow3,
                              foregroundColor: XelaColor.Gray2,
                            ),
                            background:
                                _isDark ? XelaColor.Gray2 : XelaColor.Gray12,
                            titleColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            descriptionColor:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray3,
                            closeButton: XelaButton(
                              onPressed: () {
                                setState(() {
                                  showDialog = false;
                                });
                              },
                              leftIcon: Icon(Icons.clear,
                                  size: 20,
                                  color: _isDark
                                      ? XelaColor.Gray11
                                      : XelaColor.Gray3),
                              background: Colors.transparent,
                              size: XelaButtonSize.SMALL,
                            ),
                            buttonHorizontal: false,
                          ),
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaDialog extends StatefulWidget {
  final Widget? icon;
  final String? title;
  final String? description;
  final Widget? primaryButton;
  final Widget? secondaryButton;
  final Widget? closeButton;
  final bool buttonHorizontal;
  final Color background;
  final Color titleColor;
  final Color descriptionColor;

  XelaDialog({
    this.icon,
    this.title,
    this.description,
    this.primaryButton,
    this.secondaryButton,
    this.closeButton,
    this.buttonHorizontal = true,
    this.background = Colors.white,
    this.titleColor = XelaColor.Gray3,
    this.descriptionColor = XelaColor.Gray3,
  });

  @override
  _XelaDialogState createState() => _XelaDialogState();
}

class _XelaDialogState extends State<XelaDialog> {
  _XelaDialogState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: widget.background, borderRadius: BorderRadius.circular(24)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            widget.closeButton != null
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.closeButton != null
                          ? widget.closeButton!
                          : Container(),
                    ],
                  )
                : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: widget.closeButton != null ? 24 : 0,
                ),
                widget.icon != null ? widget.icon! : Container(),
                SizedBox(
                  height: widget.icon != null ? 24 : 0,
                ),
                widget.title != null
                    ? Text(
                        widget.title!,
                        style: XelaTextStyle.xelaHeadline.apply(
                            color: widget.titleColor),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                const SizedBox(
                  height: 8,
                ),
                widget.description != null
                    ? Text(
                        widget.description!,
                        style: XelaTextStyle.xelaBody.apply(
                            color: widget.titleColor),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                const SizedBox(
                  height: 24,
                ),
                widget.buttonHorizontal
                    ? SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.secondaryButton != null
                                ? widget.secondaryButton!
                                : Container(),
                            widget.primaryButton != null
                                ? widget.primaryButton!
                                : Container(),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          widget.primaryButton != null
                              ? widget.primaryButton!
                              : Container(),
                          SizedBox(
                            height: widget.secondaryButton != null ? 8 : 0,
                          ),
                          widget.secondaryButton != null
                              ? widget.secondaryButton!
                              : Container(),
                        ],
                      )
              ],
            ),
          ],
        ));
  }
}

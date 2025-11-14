import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';
import 'xela_user_avatar.dart';

class XelaToast extends StatefulWidget {
  final String title;
  final String? description;
  final Widget? icon;
  final XelaUserAvatar? avatar;
  final Widget? rightButton;
  final Widget? firstActionButton;
  final Widget? secondActionButton;
  final bool autoresize;
  final Color background;
  final Color titleColor;
  final Color descriptionColor;

  XelaToast(
      {required this.title,
      this.description,
      this.icon,
      this.avatar,
      this.rightButton,
      this.firstActionButton,
      this.secondActionButton,
      this.autoresize = false,
      this.background = Colors.white,
      this.titleColor = XelaColor.Gray2,
      this.descriptionColor = XelaColor.Gray6});

  @override
  _XelaToastState createState() => _XelaToastState();
}

class _XelaToastState extends State<XelaToast> {
  _XelaToastState();

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
    var child = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: widget.background),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: widget.icon != null && widget.description != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          widget.icon != null
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: FittedBox(
                      child: widget.icon!,
                    ),
                  ),
                )
              : Container(),
          widget.avatar != null ? widget.avatar! : Container(),
          widget.avatar != null
              ? const SizedBox(
                  width: 16,
                )
              : Container(),
          Expanded(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: XelaTextStyle.xelaBodyBold.apply(
                              color: widget.titleColor),
                        ),
                        widget.description != null
                            ? Text(
                                widget.description!,
                                style: XelaTextStyle.xelaSmallBody.apply(
                                    color: widget.descriptionColor),
                              )
                            : Container(),
                        SizedBox(
                          height: widget.firstActionButton != null &&
                                  widget.secondActionButton != null
                              ? 8
                              : 0,
                        ),
                        widget.firstActionButton != null &&
                                widget.secondActionButton != null
                            ? Row(
                                children: [
                                  widget.firstActionButton != null
                                      ? widget.firstActionButton!
                                      : Container(),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  widget.secondActionButton != null
                                      ? widget.secondActionButton!
                                      : Container(),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (widget.firstActionButton != null &&
                                widget.secondActionButton == null) ||
                            (widget.firstActionButton == null &&
                                widget.secondActionButton != null)
                        ? 16
                        : 0,
                  ),
                  (widget.firstActionButton != null &&
                              widget.secondActionButton == null) ||
                          (widget.firstActionButton == null &&
                              widget.secondActionButton != null)
                      ? widget.firstActionButton != null
                          ? widget.firstActionButton!
                          : widget.secondActionButton!
                      : Container(),
                  SizedBox(
                    width: (widget.firstActionButton != null &&
                                widget.secondActionButton == null) ||
                            (widget.firstActionButton == null &&
                                widget.secondActionButton != null)
                        ? 16
                        : widget.rightButton != null
                            ? 8
                            : 0,
                  ),
                  widget.rightButton != null ? widget.rightButton! : Container()
                ]),
          ),
        ],
      ),
    );

    if (widget.autoresize) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: widget.background),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: widget.icon != null
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                widget.icon != null
                    ? Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: FittedBox(
                            child: widget.icon!,
                          ),
                        ),
                      )
                    : Container(),
                widget.avatar != null ? widget.avatar! : Container(),
                widget.avatar != null
                    ? const SizedBox(
                        width: 16,
                      )
                    : Container(),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: XelaTextStyle.xelaBodyBold.apply(
                                color: widget.titleColor),
                          ),
                          widget.description != null
                              ? Text(
                                  widget.description!,
                                  style: XelaTextStyle.xelaSmallBody.apply(
                                      color: widget.descriptionColor),
                                )
                              : Container(),
                          SizedBox(
                            height: widget.firstActionButton != null &&
                                    widget.secondActionButton != null
                                ? 8
                                : 0,
                          ),
                          widget.firstActionButton != null &&
                                  widget.secondActionButton != null
                              ? Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    widget.firstActionButton != null
                                        ? widget.firstActionButton!
                                        : Container(),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    widget.secondActionButton != null
                                        ? widget.secondActionButton!
                                        : Container(),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        width: (widget.firstActionButton != null &&
                                    widget.secondActionButton == null) ||
                                (widget.firstActionButton == null &&
                                    widget.secondActionButton != null)
                            ? 16
                            : 0,
                      ),
                      (widget.firstActionButton != null &&
                                  widget.secondActionButton == null) ||
                              (widget.firstActionButton == null &&
                                  widget.secondActionButton != null)
                          ? widget.firstActionButton != null
                              ? widget.firstActionButton!
                              : widget.secondActionButton!
                          : Container(),
                      SizedBox(
                        width: (widget.firstActionButton != null &&
                                    widget.secondActionButton == null) ||
                                (widget.firstActionButton == null &&
                                    widget.secondActionButton != null)
                            ? 16
                            : 0,
                      ),
                      widget.rightButton != null
                          ? widget.rightButton!
                          : Container()
                    ]),
              ],
            ),
          )
        ],
      );
    }

    return child;
  }
}

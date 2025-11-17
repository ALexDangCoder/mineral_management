import 'package:bnv_opendata/domain/models/xela_number_input_models.dart';
import 'package:flutter/material.dart';

import 'xela_button.dart';
import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaNumberInput extends StatefulWidget {
  int value;
  XelaNumberInputState state;
  Widget? decreaseIcon;
  Widget? increaseIcon;
  String? helperText;
  String? label;
  final Color labelColor;
  final Color valueColor;
  final Color helperTextColor;
  final Color defaultBackground;
  final Color disabledBackground;
  final Color defaultBorderColor;
  final Color focusBorderColor;
  final Color errorBorderColor;
  final Color successBorderColor;
  final Color disabledBorderColor;
  final Function(int) onChange;

  XelaNumberInput(
      {required this.value,
      this.state = XelaNumberInputState.DEFAULT,
      this.decreaseIcon,
      this.increaseIcon,
      this.helperText,
      this.label,
      this.labelColor = XelaColor.Gray8,
      this.valueColor = XelaColor.Gray2,
      this.helperTextColor = XelaColor.Gray8,
      this.defaultBackground = Colors.white,
      this.disabledBackground = XelaColor.Gray12,
      this.defaultBorderColor = XelaColor.Gray11,
      this.focusBorderColor = XelaColor.Blue5,
      this.errorBorderColor = XelaColor.Red3,
      this.successBorderColor = XelaColor.Green1,
      this.disabledBorderColor = XelaColor.Gray8,
      required this.onChange});

  @override
  _XelaNumberInputState createState() => _XelaNumberInputState();
}

class _XelaNumberInputState extends State<XelaNumberInput> {
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

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children = [
      widget.decreaseIcon != null
          ? XelaButton(
              onPressed: () {
                if (widget.state != XelaNumberInputState.DISABLED) {
                  setState(() {
                    widget.value -= 1;
                    widget.onChange(widget.value);
                  });
                }
              },
              leftIcon: widget.decreaseIcon!,
              background: Colors.transparent,
            )
          : Container(),
      Expanded(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.label != null
              ? Text(
                  widget.label!,
                  style: XelaTextStyle.xelaSmallBody.apply(
                      color: widget.labelColor),
                )
              : Container(),
          Text(widget.value.toString(),
              style: XelaTextStyle.xelaButtonMedium.apply(
                  color: widget.valueColor))
        ],
      ))),
      widget.increaseIcon != null
          ? XelaButton(
              onPressed: () {
                if (widget.state != XelaNumberInputState.DISABLED) {
                  setState(() {
                    widget.value += 1;
                    widget.onChange(widget.value);
                  });
                }
              },
              leftIcon: widget.increaseIcon!,
              background: Colors.transparent,
            )
          : Container(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          decoration: BoxDecoration(
            color: widget.state == XelaNumberInputState.DISABLED
                ? widget.disabledBackground
                : widget.defaultBackground,
            border: Border.all(
                color: widget.state == XelaNumberInputState.DEFAULT
                    ? widget.defaultBorderColor
                    : widget.state == XelaNumberInputState.FOCUS
                        ? widget.focusBorderColor
                        : widget.state == XelaNumberInputState.ERROR
                            ? widget.errorBorderColor
                            : widget.state == XelaNumberInputState.SUCCESS
                                ? widget.successBorderColor
                                : widget.disabledBorderColor,
                width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
        Container(
            width: 160,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: widget.helperText != null ? 8 : 0),
            child: widget.helperText != null
                ? Text(
                    widget.helperText!,
                    style: XelaTextStyle.xelaCaption.apply(
                        color: widget.helperTextColor),
                  )
                : Container())
      ],
    );
  }
}

import 'package:bnv_opendata/domain/models/xela_textarea_models.dart';
import 'package:flutter/material.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaTextarea extends StatefulWidget {
  final String? placeholder;
  String value;
  final TextEditingController? textEditingController;
  XelaTextareaState state;
  String? helperText;
  final bool disableAutoCorrection;
  final Color background;
  final Color disabledBackground;
  final Color placeholderColor;
  final Color counterColor;
  final Color textfieldColor;
  final Color disabledTextfieldColor;
  final Color borderDefaultColor;
  final Color borderDisabledColor;
  final Color borderErrorColor;
  final Color borderSuccessColor;
  final Color borderFocusColor;
  final Color defaultHelperTextColor;
  final Color disabledHelperTextColor;
  final Color errorHelperTextColor;
  final Color successHelperTextColor;
  Function(String)? onChange;
  final int maxLength;
  final bool showCounter;

  XelaTextarea(
      {this.placeholder,
      required this.value,
      this.textEditingController,
      this.state = XelaTextareaState.DEFAULT,
      this.disableAutoCorrection = true,
      this.helperText,
      this.background = Colors.white,
      this.disabledBackground = XelaColor.Gray12,
      this.placeholderColor = XelaColor.Gray8,
      this.textfieldColor = XelaColor.Gray,
      this.disabledTextfieldColor = XelaColor.Gray8,
      this.borderDefaultColor = XelaColor.Gray11,
      this.borderDisabledColor = XelaColor.Gray8,
      this.borderErrorColor = XelaColor.Red3,
      this.borderSuccessColor = XelaColor.Green1,
      this.borderFocusColor = XelaColor.Blue5,
      this.defaultHelperTextColor = XelaColor.Gray8,
      this.disabledHelperTextColor = XelaColor.Gray8,
      this.errorHelperTextColor = XelaColor.Red3,
      this.successHelperTextColor = XelaColor.Green1,
      this.onChange,
      this.maxLength = 200,
      this.showCounter = false,
      this.counterColor = XelaColor.Gray8});

  @override
  _XelaTextareaState createState() => _XelaTextareaState();
}

class _XelaTextareaState extends State<XelaTextarea> {
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

  int currentLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: widget.state == XelaTextareaState.DISABLED
                  ? widget.disabledBackground
                  : widget.background,
              border: Border.all(
                  color: widget.state == XelaTextareaState.DEFAULT
                      ? widget.borderDefaultColor
                      : widget.state == XelaTextareaState.FOCUS
                          ? widget.borderFocusColor
                          : widget.state == XelaTextareaState.ERROR
                              ? widget.borderErrorColor
                              : widget.state == XelaTextareaState.SUCCESS
                                  ? widget.borderSuccessColor
                                  : widget.borderDisabledColor,
                  width: 1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.placeholder != null
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              widget.placeholder!,
                              style: XelaTextStyle.xelaSmallBody.apply(
                                  color: widget.placeholderColor),
                            )),
                            widget.showCounter
                                ? Text(
                                    currentLength.toString() +
                                        "/" +
                                        widget.maxLength.toString(),
                                    style: XelaTextStyle.xelaSmallBody.apply(
                                        color: widget.placeholderColor))
                                : Container()
                          ],
                        ))
                    : Container(),
                Expanded(
                  child: Focus(
                    child: TextFormField(
                      onChanged: (val) {
                        if (widget.onChange != null) {
                          widget.onChange!(val);
                        }
                        setState(() {
                          currentLength = val.length;
                        });
                      },
                      controller: widget.textEditingController,
                      style: XelaTextStyle.xelaButtonMedium.apply(
                        color: widget.state == XelaTextareaState.DISABLED
                            ? widget.disabledTextfieldColor
                            : widget.textfieldColor,
                      ),
                      enabled: widget.state != XelaTextareaState.DISABLED,
                      cursorColor: widget.textfieldColor,
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: widget.state == XelaTextareaState.DISABLED
                            ? widget.disabledBackground
                            : widget.background,
                        counterText: "",
                      ),
                      autocorrect: !widget.disableAutoCorrection,
                      keyboardType: TextInputType.multiline,
                      expands: true,
                      maxLines: null,
                      maxLength: widget.maxLength,
                    ),
                    onFocusChange: (hasFocus) {
                      setState(() {
                        if (hasFocus) {
                          widget.state = XelaTextareaState.FOCUS;
                        } else {
                          widget.state = XelaTextareaState.DEFAULT;
                        }
                      });
                    },
                  ),
                )
              ],
            )),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: widget.helperText != null ? 8 : 0),
            child: widget.helperText != null
                ? Text(
                    widget.helperText!,
                    style: XelaTextStyle.xelaCaption.apply(
                        color: widget.state == XelaTextareaState.DEFAULT
                            ? widget.defaultHelperTextColor
                            : widget.state == XelaTextareaState.ERROR
                                ? widget.errorHelperTextColor
                                : widget.state == XelaTextareaState.SUCCESS
                                    ? widget.successHelperTextColor
                                    : widget.disabledHelperTextColor),
                  )
                : Container())
      ],
    );
  }
}

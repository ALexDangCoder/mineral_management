import 'package:bnv_opendata/domain/models/xela_radiobutton_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaRadioButtonGroup extends StatefulWidget {
  final List<XelaRadioButtonItem> items;
  final Function(XelaRadioButtonItem) onChange;
  final bool itemBorder;
  final XelaRadioButtonSize size;
  final Color selectedColor;
  final Color defaultColor;
  final Color labelColor;
  final Color captionColor;
  final Color valueColor;
  final String? selectedItemID;

  XelaRadioButtonGroup({
    required this.items,
    required this.onChange,
    this.itemBorder = false,
    this.size = XelaRadioButtonSize.MEDIUM,
    this.selectedColor = XelaColor.Blue3,
    this.defaultColor = XelaColor.Gray11,
    this.labelColor = XelaColor.Gray2,
    this.captionColor = XelaColor.Gray8,
    this.valueColor = XelaColor.Gray2,
    this.selectedItemID,
  });

  @override
  _XelaRadioButtonGroupState createState() => _XelaRadioButtonGroupState();
}

class _XelaRadioButtonGroupState extends State<XelaRadioButtonGroup> {
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedId = widget.selectedItemID;
    });
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  String? selectedId;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (var item in widget.items) {
      children.add(const SizedBox(height: 4));
      children.add(InkWell(
        borderRadius: BorderRadius.circular(18),
        hoverColor: Colors.transparent,
        splashColor: item.state == XelaRadioButtonState.DISABLED
            ? Colors.transparent
            : null,
        highlightColor: item.state == XelaRadioButtonState.DISABLED
            ? Colors.transparent
            : null,
        onTap: () {
          if (item.state == XelaRadioButtonState.DISABLED) {
            return;
          }
          setState(() {
            selectedId = item.id;
          });
          widget.onChange(item);
        },
        child: Opacity(
          opacity: item.state == XelaRadioButtonState.DISABLED ? 0.5 : 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              padding: EdgeInsets.all(widget.itemBorder ? 16 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: widget.itemBorder
                    ? Border.all(
                        color: selectedId == item.id
                            ? widget.selectedColor
                            : widget.defaultColor,
                        width: 1)
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: widget.size == XelaRadioButtonSize.LARGE
                        ? 32
                        : widget.size == XelaRadioButtonSize.MEDIUM
                            ? 24
                            : 20,
                    height: widget.size == XelaRadioButtonSize.LARGE
                        ? 32
                        : widget.size == XelaRadioButtonSize.MEDIUM
                            ? 24
                            : 20,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedId == item.id
                              ? widget.selectedColor
                              : widget.defaultColor,
                          width: selectedId == item.id
                              ? widget.size == XelaRadioButtonSize.LARGE
                                  ? 8
                                  : widget.size == XelaRadioButtonSize.MEDIUM
                                      ? 6
                                      : 5
                              : 2,
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        item.label != null
                            ? Text(
                                item.label!,
                                style: XelaTextStyle.xelaButtonMedium.apply(
                                    color: widget.labelColor),
                              )
                            : Container(),
                        item.caption != null
                            ? Text(
                                item.caption!,
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: widget.captionColor),
                              )
                            : Container(),
                      ],
                    ),
                  )),
                  item.value != null
                      ? Text(
                          item.value!,
                          style: XelaTextStyle.xelaButtonLarge.apply(
                              color: widget.valueColor),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ));
      children.add(const SizedBox(height: 4));
    }

    return Column(
      children: children,
    );
  }
}

class XelaRadioButtonItem {
  final String id;
  final String? label;
  final String? caption;
  final String? value;
  final XelaRadioButtonState state;

  XelaRadioButtonItem(
      {required this.id,
      this.label,
      this.caption,
      this.value,
      this.state = XelaRadioButtonState.DEFAULT});
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaAlert extends StatefulWidget {
  final String title;
  final String id;
  final String text;
  final DateTime? dateTime;              // ✅ đổi sang DateTime?
  final String dateFormat;               // ✅ cho phép custom format
  final Widget? leftIcon;
  final Widget? rightWidget;
  final Color primaryColor;
  final Color secondaryColor;
  final Color background;

  const XelaAlert({
    super.key,
    required this.title,
    required this.id,
    required this.text,
    this.leftIcon,
    this.rightWidget,
    this.primaryColor = XelaColor.Blue6,
    this.secondaryColor = XelaColor.Gray7,
    this.background = Colors.white,
    this.dateTime,
    this.dateFormat = 'dd/MM/yyyy HH:mm',
  });

  @override
  State<XelaAlert> createState() => _XelaAlertState();
}

class _XelaAlertState extends State<XelaAlert> {
  @override
  Widget build(BuildContext context) {
    final String? formatted =
    widget.dateTime != null ? DateFormat(widget.dateFormat).format(widget.dateTime!) : null;

    return Container(
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: 4,
            decoration: BoxDecoration(
              color: widget.primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
          if (widget.leftIcon != null)
            Container(
              width: 34,
              height: 18,
              padding: const EdgeInsets.only(left: 16),
              child: FittedBox(fit: BoxFit.fill, child: widget.leftIcon),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: XelaTextStyle.xelaSubheadline.apply(color: widget.primaryColor)),
                  const SizedBox(height: 4),
                  Text(widget.text,
                      style: XelaTextStyle.xelaBody.apply(color: widget.secondaryColor)),
                  if (formatted != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      formatted,
                      style: XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (widget.rightWidget != null)
            Container(
              width: 32,
              height: 16,
              padding: const EdgeInsets.only(right: 16),
              child: FittedBox(fit: BoxFit.fill, child: widget.rightWidget),
            ),
        ],
      ),
    );
  }
}

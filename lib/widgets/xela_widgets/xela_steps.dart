import 'package:bnv_opendata/domain/models/xela_steps_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaSteps extends StatefulWidget {
  List<XelaStepItem> steps;
  final XelaStepsOrientation orientation;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryAccentColor;
  final Color secondaryAccentColor;
  final Color secondaryColor;
  final Color errorColor;
  final bool lines;
  final Color iconColor;

  XelaSteps(
      {required this.steps,
      this.orientation = XelaStepsOrientation.VERTICAL,
      this.primaryTextColor = XelaColor.Gray3,
      this.secondaryTextColor = XelaColor.Gray7,
      this.primaryAccentColor = XelaColor.Blue3,
      this.secondaryAccentColor = XelaColor.Blue11,
      this.secondaryColor = XelaColor.Gray11,
      this.errorColor = XelaColor.Red3,
      this.iconColor = Colors.white,
      this.lines = true,});

  @override
  _XelaStepsState createState() => _XelaStepsState();
}

class _XelaStepsState extends State<XelaSteps> {
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
    final List<Widget> children = [];

    if (widget.orientation == XelaStepsOrientation.VERTICAL) {
      for (var step in widget.steps) {
        children.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                if (widget.steps.first.id != step.id) Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Container(
                          width: 2,
                          height: 12,
                          color: (step.state == XelaStepsState.ACTIVE ||
                                      step.state == XelaStepsState.COMPLETED
                                  ? widget.primaryAccentColor
                                  : step.state == XelaStepsState.ERROR
                                      ? widget.errorColor
                                      : widget.secondaryColor)
                              .withOpacity(widget.lines ? 1 : 0),
                        ),) else Container(),
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: step.state == XelaStepsState.DEFAULT
                        ? widget.secondaryColor
                        : step.state == XelaStepsState.ACTIVE
                            ? widget.secondaryAccentColor
                            : step.state == XelaStepsState.COMPLETED
                                ? widget.primaryAccentColor
                                : widget.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: step.state == XelaStepsState.COMPLETED
                      ? Icon(
                          Icons.done,
                          size: 16,
                          color: widget.iconColor,
                        )
                      : step.state == XelaStepsState.ERROR
                          ? Icon(
                              Icons.clear,
                              size: 16,
                              color: widget.iconColor,
                            )
                          : Text(
                              step.id.toString(),
                              style: XelaTextStyle.xelaButtonMedium.apply(
                                  color: step.state == XelaStepsState.ACTIVE
                                      ? widget.primaryAccentColor
                                      : widget.primaryTextColor,),
                            ),
                ),
                if (widget.steps.last.id != step.id) Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 2,
                          height: 12,
                          color: (step.state == XelaStepsState.ACTIVE ||
                                      step.state == XelaStepsState.COMPLETED
                                  ? widget.primaryAccentColor
                                  : step.state == XelaStepsState.ERROR
                                      ? widget.errorColor
                                      : widget.secondaryColor)
                              .withOpacity(widget.lines ? 1 : 0),
                        ),
                      ) else Container(),
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                  left: 12,
                  top: widget.steps.last.id != step.id ? 0 : 9,
                  bottom: widget.steps.first.id != step.id ? 0 : 9,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (step.title != null) Text(
                          step.title!,
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color: step.state == XelaStepsState.ACTIVE
                                  ? widget.primaryAccentColor
                                  : widget.primaryTextColor,),
                        ) else Container(),
                  if (step.caption != null) Text(
                          step.caption!,
                          style: XelaTextStyle.xelaCaption.apply(
                              color: widget.secondaryTextColor,),
                        ) else Container(),
                ],
              ),
            ),),
          ],
        ),);
      }
    } else {
      for (var step in widget.steps) {
        children.add(Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 4),
                        child: Container(
                          width: 12,
                          height: 2,
                          color: (step.state == XelaStepsState.ACTIVE ||
                                      step.state == XelaStepsState.COMPLETED
                                  ? widget.primaryAccentColor
                                  : step.state == XelaStepsState.ERROR
                                      ? widget.errorColor
                                      : widget.secondaryColor)
                              .withOpacity(
                                  widget.lines && step != widget.steps.first
                                      ? 1
                                      : 0,),
                        ),),),
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: step.state == XelaStepsState.DEFAULT
                        ? widget.secondaryColor
                        : step.state == XelaStepsState.ACTIVE
                            ? widget.secondaryAccentColor
                            : step.state == XelaStepsState.COMPLETED
                                ? widget.primaryAccentColor
                                : widget.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: step.state == XelaStepsState.COMPLETED
                      ? Icon(
                          Icons.done,
                          size: 16,
                          color: widget.iconColor,
                        )
                      : step.state == XelaStepsState.ERROR
                          ? Icon(
                              Icons.clear,
                              size: 16,
                              color: widget.iconColor,
                            )
                          : Text(
                              step.id.toString(),
                              style: XelaTextStyle.xelaButtonMedium.apply(
                                  color: step.state == XelaStepsState.ACTIVE
                                      ? widget.primaryAccentColor
                                      : widget.primaryTextColor,),
                            ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 4),
                  child: Container(
                    width: 12,
                    height: 2,
                    color: (step.state == XelaStepsState.ACTIVE ||
                                step.state == XelaStepsState.COMPLETED
                            ? widget.primaryAccentColor
                            : step.state == XelaStepsState.ERROR
                                ? widget.errorColor
                                : widget.secondaryColor)
                        .withOpacity(
                            widget.lines && step != widget.steps.last ? 1 : 0,),
                  ),
                ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (step.title != null) Text(
                          step.title!,
                          style: XelaTextStyle.xelaButtonMedium.apply(
                              color: step.state == XelaStepsState.ACTIVE
                                  ? widget.primaryAccentColor
                                  : widget.primaryTextColor,),
                        ) else Container(),
                  if (step.caption != null) Text(
                          step.caption!,
                          style: XelaTextStyle.xelaCaption.apply(
                              color: widget.secondaryTextColor,),
                        ) else Container(),
                ],
              ),
            ),
          ],
        ),),);
      }
    }

    Widget child;

    if (widget.orientation == XelaStepsOrientation.VERTICAL) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }

    return Container(
      child: child,
    );
  }
}

class XelaStepItem {
  final int id;
  final String? title;
  final String? caption;
  XelaStepsState state;

  XelaStepItem(
      {required this.id,
      this.title,
      this.caption,
      this.state = XelaStepsState.DEFAULT,});
}

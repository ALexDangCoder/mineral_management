import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaSegmentedControl extends StatefulWidget {
  final List<XelaSegmentedControlItem> items;
  final int segmentedControlValue;
  final Function(XelaSegmentedControlItem)? onChange;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color primaryFontColor;
  final Color secondaryFontColor;
  final bool autoResize;

  XelaSegmentedControl({
    required this.items,
    this.segmentedControlValue = 0,
    this.onChange,
    this.primaryBackground = XelaColor.Blue6,
    this.secondaryBackground = XelaColor.Gray12,
    this.primaryFontColor = Colors.white,
    this.secondaryFontColor = XelaColor.Gray2,
    this.autoResize = false,
  });

  @override
  _XelaSegmentedControlState createState() => _XelaSegmentedControlState();
}

class _XelaSegmentedControlState extends State<XelaSegmentedControl>
    with SingleTickerProviderStateMixin {
  _XelaSegmentedControlState();

  int segmentedControlValue = 0;
  String? selectedItemId;

  @override
  void initState() {
    super.initState();
    segmentedControlValue = widget.segmentedControlValue;

    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
          selectedItemId = widget.items[segmentedControlValue].id;

          final RenderBox renderBox = keys[segmentedControlValue]
              .currentContext
              ?.findRenderObject() as RenderBox;
          Offset childOffset = renderBox.localToGlobal(Offset.zero);
          RenderBox parent =
              parentKey.currentContext?.findRenderObject() as RenderBox;
          Offset childRelativeToParent = parent.globalToLocal(childOffset);

          width = renderBox.size.width;
          left = childRelativeToParent.dx;
        }));
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    keys.clear();
    super.dispose();
  }

  double itemWidth = 0;

  List<GlobalKey> keys = [];

  double left = 0;
  double width = 0;

  GlobalKey parentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    keys.clear();
    List<Widget> children = [];

    var i = 0;
    for (var item in widget.items) {
      var key = GlobalKey();
      keys.add(key);

      var child = InkWell(
        onTap: () {
          setState(() {
            segmentedControlValue = i;
            selectedItemId = item.id;

            final RenderBox renderBox =
                key.currentContext?.findRenderObject() as RenderBox;
            Offset childOffset = renderBox.localToGlobal(Offset.zero);
            RenderBox parent =
                parentKey.currentContext?.findRenderObject() as RenderBox;
            Offset childRelativeToParent = parent.globalToLocal(childOffset);

            width = renderBox.size.width;
            left = childRelativeToParent.dx;
          });

          if (widget.onChange != null) {
            widget.onChange!(item);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              item.iconInactive != null && item.iconActive != null
                  ? Container(
                      padding:
                          EdgeInsets.only(right: item.label != null ? 8 : 0),
                      alignment: Alignment.center,
                      width: item.label != null ? 24 : 16,
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: selectedItemId == item.id
                            ? item.iconActive
                            : item.iconInactive,
                      ))
                  : Container(),
              item.label != null
                  ? Text(
                      item.label!,
                      style: XelaTextStyle.xelaButtonMedium.apply(
                          color: selectedItemId == item.id
                              ? widget.primaryFontColor
                              : widget.secondaryFontColor),
                    )
                  : Container(),
            ],
          ),
        ),
      );

      if (widget.autoResize) {
        children.add(Wrap(key: key, children: [child]));
      } else {
        children.add(Expanded(key: key, child: child));
      }

      i++;
    }

    return Column(
      key: parentKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
              color: widget.secondaryBackground,
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              AnimatedPositioned(
                left: left,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 48,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: widget.primaryBackground),
                  curve: Curves.fastOutSlowIn,
                ),
                curve: Curves.fastOutSlowIn,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize:
                    widget.autoResize ? MainAxisSize.min : MainAxisSize.max,
                children: children,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class XelaSegmentedControlItem {
  final String id;
  final String? label;
  final Widget? iconActive;
  final Widget? iconInactive;

  XelaSegmentedControlItem({
    required this.id,
    this.label,
    this.iconActive,
    this.iconInactive,
  });
}

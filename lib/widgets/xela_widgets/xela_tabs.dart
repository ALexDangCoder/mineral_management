import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaTabs extends StatefulWidget {
  final List<XelaTabItem> items;
  int tabsValue;
  final Function(XelaTabItem)? onChange;
  final Color primaryColor;
  final Color secondaryColor;
  final Color bottomLineColor;
  final Color defaultBadgeBackground;
  final Color defaultBadgeTextColor;
  final Color selectedBadgeBackground;
  final Color selectedBadgeTextColor;

  XelaTabs(
      {required this.items,
      this.tabsValue = 0,
      this.onChange,
      this.primaryColor = XelaColor.Blue6,
      this.secondaryColor = XelaColor.Gray6,
      this.bottomLineColor = XelaColor.Gray10,
      this.defaultBadgeBackground = XelaColor.Orange3,
      this.defaultBadgeTextColor = Colors.white,
      this.selectedBadgeBackground = XelaColor.Orange3,
      this.selectedBadgeTextColor = Colors.white});

  @override
  _XelaTabsState createState() => _XelaTabsState();
}

class _XelaTabsState extends State<XelaTabs>
    with SingleTickerProviderStateMixin {
  _XelaTabsState();

  int segmentedControlValue = 0;
  int? selectedItemId;

  @override
  void initState() {
    super.initState();
    segmentedControlValue = widget.tabsValue;

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
        hoverColor: Colors.transparent,
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
          alignment: Alignment.center,
          //padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              item.iconInactive != null && item.iconActive != null
                  ? Container(
                      padding: EdgeInsets.only(
                          right: item.label != null || item.badgeText != null
                              ? 8
                              : 0),
                      alignment: Alignment.center,
                      width: item.label != null || item.badgeText != null
                          ? 24
                          : 16,
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
                              ? widget.primaryColor
                              : widget.secondaryColor),
                    )
                  : Container(),
              item.badgeText != null
                  ? Padding(
                      padding:
                          EdgeInsets.only(left: item.label != null ? 8 : 0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        height: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: selectedItemId == item.id
                                ? widget.selectedBadgeBackground
                                : widget.defaultBadgeBackground),
                        child: Text(
                          item.badgeText!,
                          style: TextStyle(
                              fontSize: 10,
                              color: selectedItemId == item.id
                                  ? widget.selectedBadgeTextColor
                                  : widget.defaultBadgeTextColor),
                          maxLines: 1,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      );

      children.add(Expanded(key: key, child: child));

      i++;
    }

    return Column(
      key: parentKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 1,
                decoration: BoxDecoration(color: widget.bottomLineColor),
              ),
              AnimatedPositioned(
                left: left,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  width: width,
                  decoration: BoxDecoration(color: widget.primaryColor),
                  curve: Curves.fastOutSlowIn,
                ),
                curve: Curves.fastOutSlowIn,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class XelaTabItem {
  final int id;
  final String? label;
  final Widget? iconActive;
  final Widget? iconInactive;
  String? badgeText;

  XelaTabItem(
      {required this.id,
      this.label,
      this.iconActive,
      this.iconInactive,
      this.badgeText});
}

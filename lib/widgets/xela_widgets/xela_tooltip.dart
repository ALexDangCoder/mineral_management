import 'dart:math';

import 'package:flutter/material.dart';

import 'xela_color.dart';

enum XelaTooltipArrowDirection {
  TOP,
  RIGHT,
  BOTTOM,
  LEFT,
  BOTTOM_RIGHT,
  BOTTOM_LEFT,
  TOP_RIGHT,
  TOP_LEFT,
  RIGHT_TOP,
  RIGHT_BOTTOM,
  LEFT_TOP,
  LEFT_BOTTOM,
}

const defaultArrowHeight = 8;

class XelaTooltip extends StatelessWidget {
  XelaTooltip(
      {Key? key,
      required this.child,
      this.arrowDirection = XelaTooltipArrowDirection.BOTTOM,
      this.background = XelaColor.Gray3})
      : super(key: key);

  final Widget child;

  final XelaTooltipArrowDirection arrowDirection;

  final Color background;

  final double borderRadius = 10.0;

  final double arrowHeight = 8;

  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    Offset? arrowOffset;
    AlignmentGeometry? alignment;
    final rotatedArrowHalfHeight = getArrowHeight(arrowHeight) / 2;
    final offset = arrowHeight / 2 + rotatedArrowHalfHeight;
    switch (arrowDirection) {
      case XelaTooltipArrowDirection.TOP:
        arrowOffset = Offset(0.0, -offset + rotatedArrowHalfHeight);
        alignment = Alignment.topCenter;
        break;
      case XelaTooltipArrowDirection.RIGHT:
        arrowOffset = Offset(offset - rotatedArrowHalfHeight, 0.0);
        alignment = Alignment.centerRight;
        break;
      case XelaTooltipArrowDirection.RIGHT_TOP:
        this.offset = const Offset(0, 6);
        arrowOffset = this.offset +
            Offset(offset - rotatedArrowHalfHeight,
                offset - rotatedArrowHalfHeight);
        alignment = Alignment.topRight;
        break;
      case XelaTooltipArrowDirection.RIGHT_BOTTOM:
        this.offset = const Offset(0, -6);
        arrowOffset = this.offset +
            Offset(offset - rotatedArrowHalfHeight,
                -offset + rotatedArrowHalfHeight);
        alignment = Alignment.bottomRight;
        break;
      case XelaTooltipArrowDirection.BOTTOM:
        arrowOffset = Offset(0.0, offset - rotatedArrowHalfHeight);
        alignment = Alignment.bottomCenter;
        break;
      case XelaTooltipArrowDirection.LEFT:
        arrowOffset = Offset(-offset + rotatedArrowHalfHeight, 0.0);
        alignment = Alignment.centerLeft;
        break;
      case XelaTooltipArrowDirection.LEFT_TOP:
        this.offset = const Offset(0, 6);
        arrowOffset = this.offset +
            Offset(-offset + rotatedArrowHalfHeight,
                offset - rotatedArrowHalfHeight);
        alignment = Alignment.topLeft;
        break;
      case XelaTooltipArrowDirection.LEFT_BOTTOM:
        this.offset = const Offset(0, -6);
        arrowOffset = this.offset +
            Offset(-offset + rotatedArrowHalfHeight,
                -offset + rotatedArrowHalfHeight);
        alignment = Alignment.bottomLeft;
        break;
      case XelaTooltipArrowDirection.BOTTOM_LEFT:
        this.offset = const Offset(6, 0);
        arrowOffset = this.offset +
            Offset(offset - rotatedArrowHalfHeight,
                offset - rotatedArrowHalfHeight);
        alignment = Alignment.bottomLeft;
        break;
      case XelaTooltipArrowDirection.BOTTOM_RIGHT:
        this.offset = const Offset(-6, 0);
        arrowOffset = this.offset +
            Offset(-offset + rotatedArrowHalfHeight,
                offset - rotatedArrowHalfHeight);
        alignment = Alignment.bottomRight;
        break;
      case XelaTooltipArrowDirection.TOP_LEFT:
        this.offset = const Offset(6, 0);
        arrowOffset = this.offset +
            Offset(offset - rotatedArrowHalfHeight,
                -offset + rotatedArrowHalfHeight);
        alignment = Alignment.topLeft;
        break;
      case XelaTooltipArrowDirection.TOP_RIGHT:
        this.offset = const Offset(-6, 0);
        arrowOffset = this.offset +
            Offset(-offset + rotatedArrowHalfHeight,
                -offset + rotatedArrowHalfHeight);
        alignment = Alignment.topRight;
        break;
      default:
    }

    return Stack(
      alignment: alignment!,
      children: <Widget>[
        xelaToogle(),
        xelaArrow(arrowOffset!),
      ],
    );
  }

  Widget xelaToogle() {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      color: background,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: child,
      ),
    );
  }

  Widget xelaArrow(Offset arrowOffset) {
    return Transform.translate(
      offset: arrowOffset,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(45 / 360),
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(1.5),
          ),
          color: background,
          child: SizedBox(
            height: arrowHeight,
            width: arrowHeight,
          ),
        ),
      ),
    );
  }

  double getArrowHeight(double arrowHeight) => sqrt(2 * pow(arrowHeight, 2));
}

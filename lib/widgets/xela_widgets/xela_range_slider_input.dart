import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'xela_color.dart';
import 'xela_text_style.dart';

class XelaRangeSliderInput extends StatefulWidget {
  RangeValues values;
  final Function(RangeValues)? onChange;
  final double max;
  final double min;
  final Color primaryColor;
  final Color secondaryColor;
  final bool disabled;
  final Color controlColor;
  final int? divisions;
  final bool showLabel;
  final Color valueIndicatorColor;
  final TextStyle valueIndicatorTextStyle;
  final Color valueIndicatorTextColor;

  XelaRangeSliderInput(
      {required this.values,
      this.onChange,
      this.max = 100,
      this.min = 0,
      this.primaryColor = XelaColor.Blue3,
      this.secondaryColor = XelaColor.Gray11,
      this.disabled = false,
      this.controlColor = Colors.white,
      this.divisions = 100,
      this.showLabel = true,
      this.valueIndicatorColor = XelaColor.Gray3,
      this.valueIndicatorTextStyle = XelaTextStyle.xelaCaption,
      this.valueIndicatorTextColor = Colors.white});

  @override
  _XelaRangeSliderInputState createState() => _XelaRangeSliderInputState();
}

class _XelaRangeSliderInputState extends State<XelaRangeSliderInput> {
  _XelaRangeSliderInputState();

  RangeValues currentValues = const RangeValues(40, 60);

  bool active = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentValues = widget.values;
    });
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: widget.primaryColor,
              inactiveTrackColor: widget.secondaryColor,
              rangeTrackShape: XelaRangeSliderTrackShape(active: active),
              trackHeight: 4,
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 1),
              overlayColor: widget.primaryColor,
              rangeThumbShape:
                  XelaRangeSliderThumbShape(thumbRadius: 28, active: active),
              thumbColor: widget.controlColor,
              activeTickMarkColor: widget.primaryColor,
              inactiveTickMarkColor: widget.secondaryColor,
              valueIndicatorColor: widget.valueIndicatorColor,
              valueIndicatorTextStyle: widget.valueIndicatorTextStyle
                  .apply(color: widget.valueIndicatorTextColor),
              rangeValueIndicatorShape:
                  const RectangularRangeSliderValueIndicatorShape(),
            ),
            child: RangeSlider(
              divisions: widget.divisions,
              values: currentValues,
              labels: widget.showLabel
                  ? RangeLabels(currentValues.start.toInt().toString(),
                      currentValues.end.toInt().toString())
                  : null,
              onChangeStart: (value) {
                if (widget.disabled) {
                  return;
                }
                setState(() {
                  active = true;
                });
              },
              onChangeEnd: (value) {
                if (widget.disabled) {
                  return;
                }
                setState(() {
                  active = false;
                });
              },
              onChanged: (values) {
                if (widget.disabled) {
                  return;
                }
                setState(() {
                  currentValues = values;
                });

                if (widget.onChange != null) {
                  widget.onChange!(currentValues);
                }
              },
              max: widget.max,
              min: widget.min,
            )),
      ),
    );
  }
}

class XelaRangeSliderTrackShape extends RoundedRectRangeSliderTrackShape {
  XelaRangeSliderTrackShape({required this.active});

  bool active;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    assert(sliderTheme.overlayShape != null);
    assert(sliderTheme.trackHeight != null);
    final double overlayWidth =
        sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight!;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackRight = trackLeft + parentBox.size.width - overlayWidth;
    final double trackBottom = trackTop + trackHeight;
    return Rect.fromLTRB(math.min(trackLeft, trackRight), trackTop,
        math.max(trackLeft, trackRight), trackBottom);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.rangeThumbShape != null);

    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    // Assign the track segment paints, which are left: active, right: inactive,
    // but reversed for right to left text.
    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );
    final ColorTween inactiveTrackColorTween = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor,
      end: sliderTheme.inactiveTrackColor,
    );
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Offset leftThumbOffset;
    final Offset rightThumbOffset;
    switch (textDirection) {
      case TextDirection.ltr:
        leftThumbOffset = startThumbCenter;
        rightThumbOffset = endThumbCenter;
        break;
      case TextDirection.rtl:
        leftThumbOffset = endThumbCenter;
        rightThumbOffset = startThumbCenter;
        break;
    }
    final Size thumbSize =
        sliderTheme.rangeThumbShape!.getPreferredSize(isEnabled, isDiscrete);
    final double thumbRadius = thumbSize.width / 2;
    assert(thumbRadius > 0);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        leftThumbOffset.dx,
        trackRect.bottom,
        topLeft: trackRadius,
        bottomLeft: trackRadius,
      ),
      inactivePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        leftThumbOffset.dx,
        trackRect.top - ((active ? additionalActiveTrackHeight : 0) / 2),
        rightThumbOffset.dx,
        trackRect.bottom + ((active ? additionalActiveTrackHeight : 0) / 2),
      ),
      activePaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        rightThumbOffset.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
      ),
      inactivePaint,
    );
  }
}

class XelaRangeSliderThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;
  bool active;

  XelaRangeSliderThumbShape({required this.thumbRadius, required this.active});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor != null
          ? sliderTheme.thumbColor!
          : Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = sliderTheme.activeTrackColor != null
          ? sliderTheme.activeTrackColor!
          : XelaColor.Blue3
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final linePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor != null
          ? sliderTheme.inactiveTrackColor!
          : XelaColor.Gray11
      ..style = PaintingStyle.fill;

    final Rect fillRect = Rect.fromCenter(
        center: center, width: thumbRadius - 2, height: thumbRadius - 2);
    final Rect borderRect = Rect.fromCenter(
        center: center, width: thumbRadius, height: thumbRadius);
    final RRect fillRRect = RRect.fromRectAndCorners(fillRect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
        bottomLeft: const Radius.circular(8),
        bottomRight: const Radius.circular(8));

    final Rect shadowRect = Rect.fromCenter(
        center: center.translate(0, -4),
        width: thumbRadius - 1,
        height: thumbRadius - 1);
    final RRect shadowRRect = RRect.fromRectAndCorners(shadowRect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
        bottomLeft: const Radius.circular(8),
        bottomRight: const Radius.circular(8));

    canvas.drawShadow(Path()..addRRect(shadowRRect),
        XelaColor.Gray.withOpacity(0.25), 8, false);

    canvas.drawRRect(fillRRect, fillPaint);

    final Rect lineRectMid =
        Rect.fromCenter(center: center, width: 1, height: thumbRadius - 2 - 10);
    final RRect lineRRectMid = RRect.fromRectAndCorners(lineRectMid,
        topRight: const Radius.circular(2),
        topLeft: const Radius.circular(2),
        bottomLeft: const Radius.circular(2),
        bottomRight: const Radius.circular(2));

    final Rect lineRectLeft = Rect.fromCenter(
        center: center.translate(-4.5, 0),
        width: 1,
        height: thumbRadius - 2 - 10);
    final RRect lineRRectLeft = RRect.fromRectAndCorners(lineRectLeft,
        topRight: const Radius.circular(2),
        topLeft: const Radius.circular(2),
        bottomLeft: const Radius.circular(2),
        bottomRight: const Radius.circular(2));

    final Rect lineRectRight = Rect.fromCenter(
        center: center.translate(4.5, 0),
        width: 1,
        height: thumbRadius - 2 - 10);
    final RRect lineRRectRight = RRect.fromRectAndCorners(lineRectRight,
        topRight: const Radius.circular(2),
        topLeft: const Radius.circular(2),
        bottomLeft: const Radius.circular(2),
        bottomRight: const Radius.circular(2));

    canvas.drawRRect(lineRRectMid, linePaint);
    canvas.drawRRect(lineRRectLeft, linePaint);
    canvas.drawRRect(lineRRectRight, linePaint);

    if (active) {
      canvas.drawRRect(
          RRect.fromRectAndCorners(borderRect,
              topRight: const Radius.circular(8),
              topLeft: const Radius.circular(8),
              bottomLeft: const Radius.circular(8),
              bottomRight: const Radius.circular(8)),
          borderPaint);
    }
  }
}

import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/widgets/xela_components/accordion_component.dart';
import 'package:bnv_opendata/widgets/xela_components/alert_component.dart';
import 'package:bnv_opendata/widgets/xela_components/badge_component.dart';
import 'package:bnv_opendata/widgets/xela_components/buttons_component.dart';
import 'package:bnv_opendata/widgets/xela_components/charts_component.dart';
import 'package:bnv_opendata/widgets/xela_components/checkbox_component.dart';
import 'package:bnv_opendata/widgets/xela_components/chips_component.dart';
import 'package:bnv_opendata/widgets/xela_components/colors_component.dart';
import 'package:bnv_opendata/widgets/xela_components/date_picker_component.dart';
import 'package:bnv_opendata/widgets/xela_components/dialogs_component.dart';
import 'package:bnv_opendata/widgets/xela_components/divider_component.dart';
import 'package:bnv_opendata/widgets/xela_components/number_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/radio_button_component.dart';
import 'package:bnv_opendata/widgets/xela_components/range_slider_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/segmented_control_component.dart';
import 'package:bnv_opendata/widgets/xela_components/slide_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/steps_component.dart';
import 'package:bnv_opendata/widgets/xela_components/tabs_component.dart';
import 'package:bnv_opendata/widgets/xela_components/text_input_component.dart';
import 'package:bnv_opendata/widgets/xela_components/textarea_component.dart';
import 'package:bnv_opendata/widgets/xela_components/toast_component.dart';
import 'package:bnv_opendata/widgets/xela_components/toggle_component.dart';
import 'package:bnv_opendata/widgets/xela_components/tooltips_component.dart';
import 'package:bnv_opendata/widgets/xela_components/typography_component.dart';
import 'package:bnv_opendata/widgets/xela_components/user_avatar_component.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  _ComponentsScreenState createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
          "Ready-to-use components and automatic styling. A rich variety of UI components specially designed for mobile apps. Xela Design System provides tabs, side menu, stack navigation and tons of other components such as lists and forms.",
          style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6)),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Typography",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TypographyComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Colors",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ColorsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Buttons",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ButtonsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Text Input",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextInputComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Number Input",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NumberInputComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Textarea",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextareaComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "User Avatar",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UserAvatarComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Radio Button",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RadioButtonComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Checkbox",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckboxComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Toggle",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ToggleComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Slider Input",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SliderInputComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Range Slider Input",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RangeSliderInputComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Segmented Control",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SegmentedControlComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Tooltips",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TooltipsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Badge",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BadgeComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Alert",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AlertComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Steps",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StepsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Chips",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChipsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Tabs",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TabsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Dialogs",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DialogsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Date Picker",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DatePickerComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Accordion",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccordionComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Charts",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChartsComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Toast",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ToastComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Divider",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DividerComponent()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Components",
                style: XelaTextStyle.xelaHeadline.apply(color: XelaColor.Gray2),
              )),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: children,
          ))
        ],
      ),
    ));
  }
}

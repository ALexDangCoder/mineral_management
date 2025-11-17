import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_steps_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_steps.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class StepsComponent extends StatefulWidget {
  const StepsComponent({Key? key}) : super(key: key);

  @override
  _StepsComponentState createState() => _StepsComponentState();
}

class _StepsComponentState extends State<StepsComponent> {
  bool _isDark = false;

  List<XelaStepItem> steps = [
    XelaStepItem(
        id: 1,
        title: 'Step 1',
        caption: 'Basic information',
        state: XelaStepsState.ACTIVE),
    XelaStepItem(id: 2, title: 'Step 2', caption: 'User management'),
    XelaStepItem(id: 3, title: 'Step 3', caption: 'Fleet settings'),
    XelaStepItem(id: 4, title: 'Step 4', caption: 'Confirmation'),
  ];

  List<XelaStepItem> stepsVars = [
    XelaStepItem(
        id: 1,
        title: 'Title',
        caption: 'Caption',
        state: XelaStepsState.DEFAULT),
    XelaStepItem(
        id: 2,
        title: 'Title',
        caption: 'Caption',
        state: XelaStepsState.COMPLETED),
    XelaStepItem(
        id: 3, title: 'Title', caption: 'Caption', state: XelaStepsState.ERROR),
    XelaStepItem(
        id: 4,
        title: 'Title',
        caption: 'Caption',
        state: XelaStepsState.ACTIVE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isDark ? XelaColor.Gray1 : Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      RawMaterialButton(
                        elevation: 0,
                        focusElevation: 2,
                        highlightElevation: 0,
                        hoverElevation: 0,
                        fillColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        constraints: const BoxConstraints(),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(Icons.arrow_back,
                              size: 20,
                              color:
                                  _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        'Steps',
                        style: XelaTextStyle.xelaSubheadline.apply(
                            color:
                                _isDark ? XelaColor.Gray11 : XelaColor.Gray2),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: XelaToggle(
                          onToggle: (val) {
                            setState(() {
                              _isDark = val;
                            });
                          },
                          status: _isDark,
                          size: XelaToggleSize.MEDIUM,
                          iconOn: Icon(Icons.nightlight_round,
                              size: 20, color: XelaColor.Gray3),
                          iconOff: Icon(Icons.nightlight_round,
                              size: 20, color: XelaColor.Gray7),
                          onBackground: XelaColor.Gray3,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        'Usage Example',
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: _isDark ? XelaColor.Gray2 : XelaColor.Gray12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Getting Started',
                            style: XelaTextStyle.xelaHeadline.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          ),
                          Text(
                            'Complete these steps and become a member',
                            style: XelaTextStyle.xelaCaption.apply(
                                color: XelaColor.Gray6),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: XelaDivider(
                              style: XelaDividerStyle.DOTTED,
                              color:
                                  _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            ),
                          ),
                          XelaSteps(
                            steps: steps,
                            primaryAccentColor:
                                _isDark ? XelaColor.Green1 : XelaColor.Green2,
                            secondaryAccentColor:
                                _isDark ? XelaColor.Green8 : XelaColor.Green10,
                            primaryTextColor:
                                _isDark ? XelaColor.Gray6 : XelaColor.Gray2,
                            secondaryTextColor:
                                _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                            secondaryColor:
                                _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                            errorColor:
                                _isDark ? XelaColor.Red5 : XelaColor.Red3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XelaButton(
                                  size: XelaButtonSize.MEDIUM,
                                  onPressed: () {},
                                  text: 'Skip for now',
                                  type: XelaButtonType.SECONDARY,
                                  background: Colors.transparent,
                                  foregroundColor: _isDark
                                      ? XelaColor.Green1
                                      : XelaColor.Green2,
                                  defaultBorderColor: _isDark
                                      ? XelaColor.Gray3
                                      : XelaColor.Gray11,
                                ),
                                XelaButton(
                                    size: XelaButtonSize.MEDIUM,
                                    background: _isDark
                                        ? XelaColor.Green1
                                        : XelaColor.Green2,
                                    foregroundColor: Colors.white,
                                    text: 'Continue',
                                    rightIcon: Icon(Icons.arrow_forward,
                                        size: 20, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        final currentStep =
                                            steps.firstWhereOrNull((element) =>
                                                element.state ==
                                                XelaStepsState.ACTIVE);
                                        if (currentStep != null) {
                                          final currentStepIndex =
                                              steps.indexOf(currentStep);
                                          if (currentStepIndex == 2) {
                                            currentStep.state =
                                                XelaStepsState.ERROR;
                                            return;
                                          }
                                          if (currentStepIndex != -1) {
                                            currentStep.state =
                                                XelaStepsState.COMPLETED;
                                            if (currentStepIndex <
                                                steps.length - 1) {
                                              steps[currentStepIndex + 1]
                                                      .state =
                                                  XelaStepsState.ACTIVE;
                                            }
                                          }
                                        } else {
                                          if (steps[0].state ==
                                              XelaStepsState.DEFAULT) {
                                            steps[0].state =
                                                XelaStepsState.ACTIVE;
                                          }
                                        }
                                      });
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        'Variants',
                        style: XelaTextStyle.xelaCaption.apply(
                            color: _isDark ? XelaColor.Gray6 : XelaColor.Gray4),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSteps(
                      steps: stepsVars,
                      primaryAccentColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryAccentColor:
                          _isDark ? XelaColor.Blue8 : XelaColor.Blue10,
                      primaryTextColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray2,
                      secondaryTextColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      secondaryColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      errorColor: _isDark ? XelaColor.Red5 : XelaColor.Red3,
                      lines: true,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSteps(
                      steps: stepsVars,
                      primaryAccentColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryAccentColor:
                          _isDark ? XelaColor.Blue8 : XelaColor.Blue10,
                      primaryTextColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray2,
                      secondaryTextColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      secondaryColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      errorColor: _isDark ? XelaColor.Red5 : XelaColor.Red3,
                      lines: false,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSteps(
                      orientation: XelaStepsOrientation.HORIZONTAL,
                      steps: stepsVars,
                      primaryAccentColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryAccentColor:
                          _isDark ? XelaColor.Blue8 : XelaColor.Blue10,
                      primaryTextColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray2,
                      secondaryTextColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      secondaryColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      errorColor: _isDark ? XelaColor.Red5 : XelaColor.Red3,
                      lines: true,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: XelaDivider(
                      color: _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: XelaSteps(
                      orientation: XelaStepsOrientation.HORIZONTAL,
                      steps: stepsVars,
                      primaryAccentColor:
                          _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      secondaryAccentColor:
                          _isDark ? XelaColor.Blue8 : XelaColor.Blue10,
                      primaryTextColor:
                          _isDark ? XelaColor.Gray6 : XelaColor.Gray2,
                      secondaryTextColor:
                          _isDark ? XelaColor.Gray7 : XelaColor.Gray7,
                      secondaryColor:
                          _isDark ? XelaColor.Gray3 : XelaColor.Gray11,
                      errorColor: _isDark ? XelaColor.Red5 : XelaColor.Red3,
                      lines: false,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

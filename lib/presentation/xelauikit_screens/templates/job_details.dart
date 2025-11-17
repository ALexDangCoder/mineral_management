import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_divider_models.dart';
import 'package:bnv_opendata/domain/models/xela_toggle_models.dart';
import 'package:bnv_opendata/domain/models/xela_user_avatar_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_toggle.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  bool _isDark = false;

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
    return Scaffold(
        backgroundColor: _isDark ? Colors.black : XelaColor.Gray12,
        body: Padding(
            padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: _isDark ? Colors.black : XelaColor.Gray2),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
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
                              size: 20, color: Colors.white),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo.png",
                              width: 103, height: 16, color: Colors.white)
                        ],
                      )),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
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
                  ),
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                XelaUserAvatar(
                                    size: XelaUserAvatarSize.LARGE,
                                    icon: Icon(Icons.android,
                                        size: 20, color: Colors.white),
                                    background: XelaColor.Blue3),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abstergo Ltd.",
                                        style: XelaTextStyle.xelaBodyBold.apply(
                                            color: _isDark
                                                ? Colors.white
                                                : XelaColor.Gray2)),
                                    Text("Lafayette, California",
                                        style: XelaTextStyle.xelaCaption.apply(
                                            color: XelaColor.Gray6)),
                                  ],
                                )),
                                const SizedBox(width: 16),
                                XelaButton(
                                  onPressed: () {},
                                  leftIcon: Icon(Icons.favorite,
                                      size: 15,
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2),
                                  type: XelaButtonType.SECONDARY,
                                  background: Colors.transparent,
                                  foregroundColor:
                                      _isDark ? Colors.white : XelaColor.Gray2,
                                  defaultBorderColor: _isDark
                                      ? XelaColor.Gray3
                                      : XelaColor.Gray11,
                                  size: XelaButtonSize.SMALL,
                                  autoResize: true,
                                ),
                                const SizedBox(width: 16),
                                XelaButton(
                                  onPressed: () {},
                                  leftIcon: Icon(Icons.share,
                                      size: 15,
                                      color: _isDark
                                          ? Colors.white
                                          : XelaColor.Gray2),
                                  type: XelaButtonType.SECONDARY,
                                  background: Colors.transparent,
                                  foregroundColor:
                                      _isDark ? Colors.white : XelaColor.Gray2,
                                  defaultBorderColor: _isDark
                                      ? XelaColor.Gray3
                                      : XelaColor.Gray11,
                                  size: XelaButtonSize.SMALL,
                                  autoResize: true,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11),
                            const SizedBox(height: 24),
                            Text("Experience",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: XelaColor.Gray6)),
                            Text("Minimum 3+ Years",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            Text("Job Type",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: XelaColor.Gray6)),
                            Text("Remote, Full Time",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            Text("Offer Salary",
                                style: XelaTextStyle.xelaCaption.apply(
                                    color: XelaColor.Gray6)),
                            Text("\$35-\$55/hour",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11),
                            const SizedBox(height: 24),
                            Text("Senior Product Designer, Financial Services",
                                style: XelaTextStyle.xelaHeadline.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            Text("Job Description",
                                style: XelaTextStyle.xelaBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            Text(
                                "The Financial Services team at Square is responsible for all ways in which a seller may receive, manage, and transfer funds within the Square ecosystem. As a senior-level Product Designer for Financial Services, you will drive the design for experiences that millions of small- and medium-sized businesses depend on to thrive in today’s economy. We have multiple, high impact roles open across several product areas that cover all aspects of starting and running a business. We’re looking for designers who are motivated by turning complex financial problems into simple and elegant solutions. You’ll help make decisions that directly improve our product direction and roadmap. Your work will span from core features to experimental projects. Being a collaborative role, you will partner with other designers, project managers, data analysts, and engineers. We believe generalists have a hand in each stage of product development, so Product Designers at Square take projects from napkin sketches to final specifications.",
                                style: XelaTextStyle.xelaSmallBody.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                color: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11),
                            const SizedBox(height: 24),
                            Text("Qualifications",
                                style: XelaTextStyle.xelaBodyBold.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                            const SizedBox(height: 24),
                            Text("You have:",
                                style: XelaTextStyle.xelaSmallBodyBold.apply(
                                    color: _isDark
                                        ? XelaColor.Blue5
                                        : XelaColor.Blue3)),
                            const SizedBox(height: 8),
                            Text(
                                "- 7+ years of relevant professional experience \n- A portfolio that shows work you were directly responsible for the success of\n- Experience as a primary contributor to multiple high impact projects",
                                style: XelaTextStyle.xelaSmallBody.apply(
                                    color: _isDark
                                        ? Colors.white
                                        : XelaColor.Gray2)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}

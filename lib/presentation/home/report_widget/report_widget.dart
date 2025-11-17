import 'dart:developer';
import 'dart:math';

import 'package:bnv_opendata/config/routes/router.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final List<Map<String, dynamic>> _reportPeriod = [
    {'quarter': 'Quý 4/2025', 'value': 95},
    {'quarter': 'Quý 3/2025', 'value': 75},
    {'quarter': 'Quý 2/2025', 'value': 55},
    {'quarter': 'Quý 1/2025', 'value': 33},
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Click vào widget -> điều hướng đến Resource Reserves
        Navigator.pushNamed(context, Routers.resourceReserves);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  AppS.of(context).reserves_report,
                  style: XelaTextStyle.xelaSubheadline
                      .apply(color: XelaColor.Gray2),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => _showReportingPeriod(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: XelaColor.Gray12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _reportPeriod[_selectedIndex]['quarter'] ?? '',
                          style: XelaTextStyle.xelaCaption.apply(
                            color: XelaColor.Blue6,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${AppS.of(context).reserves_total}1,250,000 tấn',
                  style:
                      XelaTextStyle.xelaBodyBold.apply(color: XelaColor.Blue6),
                ),
                const SizedBox(height: 8),
                _progressWidget(
                  percent:
                      (_reportPeriod[_selectedIndex]['value'] as int) / 100,
                ),
                const SizedBox(height: 8),
                Text(
                  'Đã khai thác ${_reportPeriod[_selectedIndex]['value']}% trữ lượng phê duyệt',
                  style:
                      XelaTextStyle.xelaCaption.apply(color: XelaColor.Blue6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressWidget({required double percent}) {
    final maxProgress = MediaQuery.of(context).size.width - 32 * 2;
    return Container(
      height: 8,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: XelaColor.Gray10,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        width: maxProgress * min(1, percent),

        /// * with percent of progress
        decoration: BoxDecoration(
          color: XelaColor.Blue6,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  void _showReportingPeriod(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // This is key for full screen
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            maxChildSize: 0.9,
            // Maximum height when dragged up
            expand: false,
            builder: (BuildContext context, ScrollController controller) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        AppS.of(context).select_reporting_period,
                        textAlign: TextAlign.center,
                        style: XelaTextStyle.xelaBodyBold.apply(
                          color: XelaColor.Gray2,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: XelaColor.Gray12,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        controller: controller,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return _periodItem(
                            onSelectIndex: () {
                              Navigator.of(this.context).pop();
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            title: _reportPeriod[index]['quarter'],
                            isSelected: index == _selectedIndex,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1,
                            color: XelaColor.Gray12,
                          );
                        },
                        itemCount: _reportPeriod.length,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Widget _periodItem(
      {required String title,
      bool isSelected = false,
      required Function onSelectIndex}) {
    return InkWell(
      onTap: () => onSelectIndex.call(),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: XelaTextStyle.xelaCaption.apply(
                  color: XelaColor.Gray2,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: XelaColor.Blue6,
            )
          ],
        ),
      ),
    );
  }
}

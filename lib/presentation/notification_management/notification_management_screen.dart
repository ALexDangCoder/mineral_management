import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/domain/models/xela_checkbox_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_checkbox.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationManagementScreen extends StatefulWidget {
  NotificationManagementScreen({super.key});

  @override
  State<NotificationManagementScreen> createState() =>
      _NotificationManagementScreenState();
}

class _NotificationManagementScreenState
    extends State<NotificationManagementScreen> {
  List<XelaTabItem> tabs = [
    XelaTabItem(id: 1, label: "Tất cả"),
    XelaTabItem(id: 2, label: "Hoạt động"),
    XelaTabItem(id: 3, label: "TT & PL"),
    XelaTabItem(id: 4, label: "Tài chính"),
    XelaTabItem(id: 5, label: "Hệ thống"),
  ];

  @override
  void initState() {
    super.initState();
    selectedTab = tabs[0];
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    super.dispose();
  }

  late XelaTabItem selectedTab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Thông báo',style: XelaTextStyle.XelaHeadline,),
          centerTitle: true,
        ),
        body: Column(
          children: [
            XelaTabs(
              items: tabs,
              tabsValue: 0,
              bottomLineColor: XelaColor.Gray11,
              defaultBadgeBackground: XelaColor.Gray8,
              onChange: (tab) {
                setState(() {
                  selectedTab = tab;
                });
              },
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              XelaButton(
                                onPressed: () {},
                                text: 'Tất cả trạng thái',
                                rightIcon: Icon(Icons.keyboard_arrow_down),
                                type: XelaButtonType.SECONDARY,
                                background: Colors.transparent,
                                autoResize: false,
                                size: XelaButtonSize.SMALL,
                                foregroundColor: XelaColor.Gray1,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              XelaButton(
                                onPressed: () {},
                                text: 'Sắp xếp',
                                rightIcon: Icon(Icons.keyboard_arrow_down),
                                type: XelaButtonType.SECONDARY,
                                background: Colors.transparent,
                                autoResize: false,
                                size: XelaButtonSize.SMALL,
                                foregroundColor: XelaColor.Gray1,
                              ),
                              SizedBox(width: 10,),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: XelaCheckbox(
                                  size: XelaCheckboxSize.SMALL,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (selectedTab.id == 1)
                          Tab1DataWidget()
                        else
                          selectedTab.id == 2
                              ? Tab2DataWidget()
                              : selectedTab.id == 3
                                  ? Tab3DataWidget()
                                  : selectedTab.id == 4
                                      ? Tab4DataWidget()
                                      : Tab5DataWidget()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Tab1DataWidget() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: XelaAlert(
            title: 'Cảnh báo tồn kho thấp',
            id: '1',
            text: 'abcd',
            leftIcon: Icon(
              Icons.gpp_maybe,
              color: XelaColor.Red2,
            ),
            background: XelaColor.Blue12,
            dateTime: DateTime.now(),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: XelaAlert(
            title: 'Nhắc nhở pháp lý',
            id: '1',
            text: 'abcd',
            leftIcon: Icon(
              Icons.feed_outlined,
              color: XelaColor.Blue1,
              size: 20,
            ),
            background: XelaColor.Blue12,
            dateTime: DateTime.now(),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: XelaAlert(
            title: 'Công nợ quá hạn',
            id: '1',
            text: 'abcd',
            leftIcon: Icon(
              Icons.attach_money,
              color: XelaColor.Blue1,
              size: 20,
            ),
            background: XelaColor.Blue12,
            dateTime: DateTime.now(),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: XelaAlert(
            title: 'Vận Hành',
            id: '1',
            text: 'abcd',
            leftIcon: Icon(
              Icons.car_crash,
              color: XelaColor.Blue2,
              size: 20,
            ),
            background: XelaColor.Blue12,
            dateTime: DateTime.now(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget Tab2DataWidget() {
    return Container(
      width: 100,
      height: 100,
    );
  }

  Widget Tab3DataWidget() {
    return Container(
      width: 100,
      height: 100,
    );
  }

  Widget Tab4DataWidget() {
    return Container(
      width: 100,
      height: 100,
    );
  }

  Widget Tab5DataWidget() {
    return Container(
      width: 100,
      height: 100,
    );
  }
}

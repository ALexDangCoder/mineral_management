import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/data/repositories/notification_repository_impl.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_tabs.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/notification_cubit.dart';
import 'cubit/notification_state.dart';

class NotificationManagementScreen extends StatelessWidget {
  NotificationManagementScreen({super.key});

  final List<XelaTabItem> tabs = [
    XelaTabItem(id: 1, label: "Tất cả"),
    XelaTabItem(id: 2, label: "Hoạt động"),
    XelaTabItem(id: 3, label: "TT & PL"),
    XelaTabItem(id: 4, label: "Tài chính"),
    XelaTabItem(id: 5, label: "Hệ thống"),
  ];

  NotificationCategory _mapTabId(int id) {
    switch (id) {
      case 2:
        return NotificationCategory.activity;
      case 3:
        return NotificationCategory.legal;
      case 4:
        return NotificationCategory.finance;
      case 5:
        return NotificationCategory.system;
      case 1:
      default:
        return NotificationCategory.all;
    }
  }

  int _tabIndexByCat(NotificationCategory c) {
    switch (c) {
      case NotificationCategory.activity:
        return 1;
      case NotificationCategory.legal:
        return 2;
      case NotificationCategory.finance:
        return 3;
      case NotificationCategory.system:
        return 4;
      case NotificationCategory.all:
      default:
        return 0;
    }
  }

  Icon _iconByCat(NotificationCategory c) {
    switch (c) {
      case NotificationCategory.activity:
        return const Icon(Icons.gpp_maybe, color: XelaColor.Red2);
      case NotificationCategory.legal:
        return const Icon(Icons.feed_outlined, color: XelaColor.Blue1, size: 20);
      case NotificationCategory.finance:
        return const Icon(Icons.attach_money, color: XelaColor.Blue1, size: 20);
      case NotificationCategory.system:
        return const Icon(Icons.settings, color: XelaColor.Blue2, size: 20);
      case NotificationCategory.all:
        return const Icon(Icons.notifications, color: XelaColor.Blue1, size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit(NotificationRepositoryImpl())..load(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Row(
                    children: [
                      RawMaterialButton(
                        elevation: 0,
                        focusElevation: 2,
                        highlightElevation: 0,
                        fillColor: Colors.transparent,
                        hoverElevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        constraints: const BoxConstraints(),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: XelaColor.Gray2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Thông báo",
                          style: XelaTextStyle.XelaHeadline.apply(
                            color: XelaColor.Gray2,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Đánh dấu tất cả đã đọc',
                        icon: const Icon(Icons.done_all, color: XelaColor.Gray2),
                        onPressed: state.loading
                            ? null
                            : () => context
                            .read<NotificationCubit>()
                            .markAllVisibleRead(),
                      ),
                    ],
                  ),

                  // ===== Tabs =====
                  XelaTabs(
                    items: tabs,
                    tabsValue: _tabIndexByCat(state.selected),
                    bottomLineColor: XelaColor.Gray11,
                    defaultBadgeBackground: XelaColor.Gray8,
                    onChange: (tab) => context
                        .read<NotificationCubit>()
                        .select(_mapTabId(tab.id)),
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
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    XelaButton(
                                      onPressed: () {},
                                      text: 'Tất cả trạng thái',
                                      rightIcon: const Icon(
                                          Icons.keyboard_arrow_down),
                                      type: XelaButtonType.SECONDARY,
                                      background: Colors.transparent,
                                      autoResize: false,
                                      size: XelaButtonSize.SMALL,
                                      foregroundColor: XelaColor.Gray1,
                                    ),
                                    const SizedBox(width: 5),
                                    XelaButton(
                                      onPressed: () {},
                                      text: 'Sắp xếp',
                                      rightIcon: const Icon(
                                          Icons.keyboard_arrow_down),
                                      type: XelaButtonType.SECONDARY,
                                      background: Colors.transparent,
                                      autoResize: false,
                                      size: XelaButtonSize.SMALL,
                                      foregroundColor: XelaColor.Gray1,
                                    ),
                                  ],
                                ),
                              ),

                              // PHẦN LIST
                              _buildList(context, state),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, NotificationState state) {
    final list = state.visible;
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            'Không có thông báo',
            style: XelaTextStyle.XelaSubheadline,
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, i) {
          final item = list[i];
          final bg = item.isRead ? XelaColor.Gray12 : XelaColor.Blue12;

          return GestureDetector(
            onTap: () =>
                context.read<NotificationCubit>().markRead(item.id, read: true),
            child: XelaAlert(
              title: item.title,
              id: item.id,
              text: item.content,
              leftIcon: _iconByCat(item.category),
              background: bg,
              dateTime: item.createdAt,
            ),
          );
        },
      ),
    );
  }
}

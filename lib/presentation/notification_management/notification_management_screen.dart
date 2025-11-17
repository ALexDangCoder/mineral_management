import 'package:bnv_opendata/data/repositories/notification_repository_impl.dart';
import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';
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

  Future<void> _pickStatus(BuildContext context) async {
    final cubit = context.read<NotificationCubit>();
    final current = cubit.state.statusFilter;

    final value = await showModalBottomSheet<NotificationStatusFilterEnum>(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Tất cả trạng thái', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationStatusFilterEnum.all ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationStatusFilterEnum.all),
            ),
            ListTile(
              title: const Text('Đã đọc', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationStatusFilterEnum.read ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationStatusFilterEnum.read),
            ),
            ListTile(
              title: const Text('Chưa đọc', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationStatusFilterEnum.unread ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationStatusFilterEnum.unread),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );

    if (value != null) cubit.setStatusFilter(value);
  }

  Future<void> _pickSort(BuildContext context) async {
    final cubit = context.read<NotificationCubit>();
    final current = cubit.state.sort;

    final value = await showModalBottomSheet<NotificationSortEnum>(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Mặc định', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationSortEnum.none ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationSortEnum.none),
            ),
            ListTile(
              title: const Text('A → Z (tiêu đề)', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationSortEnum.titleAZ ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationSortEnum.titleAZ),
            ),
            ListTile(
              title: const Text('Z → A (tiêu đề)', style: XelaTextStyle.xelaBodyBold,),
              trailing: current == NotificationSortEnum.titleZA ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(_, NotificationSortEnum.titleZA),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );

    if (value != null) cubit.setSort(value);
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
                  // Header
                  Row(
                    children: [
                      RawMaterialButton(
                        elevation: 0,
                        onPressed: () => Navigator.pop(context),
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
                          style: XelaTextStyle.xelaHeadline
                              .apply(color: XelaColor.Gray2),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Đánh dấu tất cả đã đọc',
                        icon: const Icon(Icons.done_all, color: XelaColor.Gray2),
                        onPressed: () => context
                            .read<NotificationCubit>()
                            .markAllVisibleRead(),
                      ),
                    ],
                  ),

                  // Tabs
                  XelaTabs(
                    items: tabs,
                    tabsValue: state.selected.tabIndex,
                    bottomLineColor: XelaColor.Gray11,
                    defaultBadgeBackground: XelaColor.Gray8,
                    onChange: (tab) => context
                        .read<NotificationCubit>()
                        .select(notificationCategoryEnumFromTabId(tab.id)),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    final cubit =
                                    context.read<NotificationCubit>();
                                    switch (value) {
                                      case 'read':
                                        cubit.setStatusFilter(
                                            NotificationStatusFilterEnum.read);
                                        break;
                                      case 'unread':
                                        cubit.setStatusFilter(
                                            NotificationStatusFilterEnum.unread);
                                        break;
                                      case 'all':
                                      default:
                                        cubit.setStatusFilter(
                                            NotificationStatusFilterEnum.all);
                                    }
                                  },
                                  itemBuilder: (_) => const [
                                    PopupMenuItem(
                                      value: 'all',
                                      child: Text('Tất cả trạng thái', style: XelaTextStyle.xelaHeadline,),
                                    ),
                                    PopupMenuItem(
                                      value: 'read',
                                      child: Text('Đã đọc'),
                                    ),
                                    PopupMenuItem(
                                      value: 'unread',
                                      child: Text('Chưa đọc'),
                                    ),
                                  ],
                                  offset: const Offset(0, 40),
                                  child: XelaButton(
                                    onPressed: () => _pickStatus(context),
                                    text: state.statusFilter.label,
                                    rightIcon: const Icon(Icons.keyboard_arrow_down),
                                    type: XelaButtonType.SECONDARY,
                                    background: Colors.transparent,
                                    autoResize: false,
                                    size: XelaButtonSize.SMALL,
                                    foregroundColor: XelaColor.Gray1,
                                  ),
                                ),

                                const SizedBox(width: 8),

                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    final cubit =
                                    context.read<NotificationCubit>();
                                    switch (value) {
                                      case 'titleAZ':
                                        cubit.setSort(
                                            NotificationSortEnum.titleAZ);
                                        break;
                                      case 'titleZA':
                                        cubit.setSort(
                                            NotificationSortEnum.titleZA);
                                        break;
                                      case 'none':
                                      default:
                                        cubit.setSort(
                                            NotificationSortEnum.none);
                                    }
                                  },
                                  itemBuilder: (_) => const [
                                    PopupMenuItem(
                                      value: 'none',
                                      child: Text('Mặc định'),
                                    ),
                                    PopupMenuItem(
                                      value: 'titleAZ',
                                      child: Text('A → Z (tiêu đề)'),
                                    ),
                                    PopupMenuItem(
                                      value: 'titleZA',
                                      child: Text('Z → A (tiêu đề)'),
                                    ),
                                  ],
                                  offset: const Offset(0, 40),
                                  child: XelaButton(
                                    onPressed: () => _pickSort(context),
                                    text: state.sort.label, // lấy label từ enum extension
                                    rightIcon: const Icon(Icons.keyboard_arrow_down),
                                    type: XelaButtonType.SECONDARY,
                                    background: Colors.transparent,
                                    autoResize: false,
                                    size: XelaButtonSize.SMALL,
                                    foregroundColor: XelaColor.Gray1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          _buildList(context, state),
                        ],
                      ),
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
    final list = state.rendered;
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child:
          Text('Không có thông báo', style: XelaTextStyle.xelaSubheadline),
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

          final bgColor = item.isRead ? XelaColor.Gray12 : XelaColor.Blue12;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              key: ValueKey(item.id),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => context
                  .read<NotificationCubit>()
                  .markRead(item.id, read: true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: XelaAlert(
                    title: item.title,
                    id: item.id,
                    text: item.content,
                    background: Colors.transparent,
                    leftIcon: Icon(
                      item.category.iconData,
                      color: item.category.color,
                      size: 20,
                    ),
                    dateTime: item.createdAt,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';



enum NotificationCategoryEnum { all, activity, legal, finance, system }


extension NotificationCategoryEnumX on NotificationCategoryEnum {
  String get asName => name;

  int get tabIndex {
    switch (this) {
      case NotificationCategoryEnum.activity: return 1;
      case NotificationCategoryEnum.legal:    return 2;
      case NotificationCategoryEnum.finance:  return 3;
      case NotificationCategoryEnum.system:   return 4;
      case NotificationCategoryEnum.all:      return 0;
    }
  }

  IconData get iconData {
    switch (this) {
      case NotificationCategoryEnum.activity: return Icons.car_crash_outlined;
      case NotificationCategoryEnum.legal:    return Icons.featured_play_list_outlined;
      case NotificationCategoryEnum.finance:  return Icons.attach_money;
      case NotificationCategoryEnum.system:   return Icons.settings;
      case NotificationCategoryEnum.all:      return Icons.warning;
    }
  }
  Color get color {
    switch (this) {
      case NotificationCategoryEnum.activity: return XelaColor.Blue1;
      case NotificationCategoryEnum.legal:    return XelaColor.Blue1;
      case NotificationCategoryEnum.finance:  return XelaColor.Blue1;
      case NotificationCategoryEnum.system:   return XelaColor.Blue2;
      case NotificationCategoryEnum.all:      return XelaColor.Red1;
    }
  }
}



NotificationCategoryEnum notificationCategoryEnumFromName(String? n) {
  switch ((n ?? '').toLowerCase()) {
    case 'activity': return NotificationCategoryEnum.activity;
    case 'legal':    return NotificationCategoryEnum.legal;
    case 'finance':  return NotificationCategoryEnum.finance;
    case 'system':   return NotificationCategoryEnum.system;
    case 'all':
    default:         return NotificationCategoryEnum.all;
  }
}

NotificationCategoryEnum notificationCategoryEnumFromTabId(int id) {
  switch (id) {
    case 2: return NotificationCategoryEnum.activity;
    case 3: return NotificationCategoryEnum.legal;
    case 4: return NotificationCategoryEnum.finance;
    case 5: return NotificationCategoryEnum.system;
    case 1:
    default: return NotificationCategoryEnum.all;
  }
}

enum NotificationStatusFilterEnum { all, read, unread }

extension NotificationStatusFilterEnumX on NotificationStatusFilterEnum {
  String get label {
    switch (this) {
      case NotificationStatusFilterEnum.read:   return 'Đã đọc';
      case NotificationStatusFilterEnum.unread: return 'Chưa đọc';
      case NotificationStatusFilterEnum.all:    return 'Tất cả trạng thái';
    }
  }
}

enum NotificationSortEnum { none, titleAZ, titleZA }

extension NotificationSortEnumX on NotificationSortEnum {
  String get label {
    switch (this) {
      case NotificationSortEnum.titleAZ: return 'A → Z';
      case NotificationSortEnum.titleZA: return 'Z → A';
      case NotificationSortEnum.none:    return 'Sắp xếp';
    }
  }
}


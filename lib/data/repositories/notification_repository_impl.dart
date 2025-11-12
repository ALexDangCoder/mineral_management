import 'dart:async';
import 'dart:convert';
import 'package:bnv_opendata/data/mapper/notification_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  static const _prefsKey = 'notifications_store_v1';

  List<AppNotification> _store = [];
  bool _loaded = false;

  Future<void> _ensureLoaded() async {
    if (_loaded) return;

    final preffs = await SharedPreferences.getInstance();

    final raw = preffs.getString(_prefsKey);

    if (raw != null && raw.isNotEmpty) {
      final decoded = jsonDecode(raw) as List<dynamic>;
      _store = decoded
          .map((e) => notificationFromMap(
                Map<String, dynamic>.from(e as Map),
              ))
          .toList();
    } else {
      _store = <AppNotification>[
        AppNotification(
          id: '1',
          category: NotificationCategory.all,
          title: 'Cảnh báo tồn kho thấp',
          content: 'abcde',
          createdAt: DateTime.now(),
          isRead: false,
        ),
        AppNotification(
          id: '2',
          category: NotificationCategory.legal,
          title: 'Nhắc nhở pháp lý',
          content: 'abcde',
          createdAt: DateTime.now(),
          isRead: false,
        ),
        AppNotification(
          id: '3',
          category: NotificationCategory.finance,
          title: 'Công nợ quá hạn',
          content: 'abcde',
          createdAt: DateTime.now(),
          isRead: false,
        ),
        AppNotification(
          id: '4',
          category: NotificationCategory.activity,
          title: 'Vận hành',
          content: 'abcde',
          createdAt: DateTime.now(),
          isRead: false,
        ),
      ];
      await _save();
    }
    _loaded = true;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_store.map(notificationToMap).toList());
    await prefs.setString(_prefsKey, raw);
  }

  Future<List<AppNotification>> fetchAll() async {
    await _ensureLoaded();
    return List<AppNotification>.unmodifiable(_store);
  }

  Future<void> markManyRead(Iterable<String> ids, {bool read = true}) async {
    await _ensureLoaded();
    final set = ids.toSet();
    for (var i = 0; i < _store.length; i++) {
      if (set.contains(_store[i].id)) {
        _store[i] = _store[i].coppyWith(isRead: read);
      }
    }
    await _save();
  }

  Future<void> markRead(String id, {bool read = true}) async {
    await _ensureLoaded();
    final i = _store.indexWhere((e) => e.id == id);
    if (i != -1) {
      // dùng coppyWith theo model của bạn
      _store[i] = _store[i].coppyWith(isRead: read);
      await _save();
    }
  }

  // test
  Future<void> clearAll() async {
    _store = [];
    _loaded = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bnv_opendata/utils/constants/enums.dart';
import 'package:bnv_opendata/data/model/notification_model.dart';
import 'package:bnv_opendata/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  static const _prefsKey = 'notifications_store_v1';

  List<AppNotification> _store = [];
  bool _loaded = false;

  Future<void> _ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);

    if (raw != null && raw.isNotEmpty) {
      final decoded = jsonDecode(raw) as List<dynamic>;
      _store = decoded
          .map((e) => AppNotification.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
    } else {
      _store = <AppNotification>[
        AppNotification(
          id: '1',
          category: NotificationCategoryEnum.activity,
          title: 'Cảnh báo tồn kho thấp',
          content: 'abcd',
          createdAt: DateTime.now(),
          isRead: false,
        ),
        AppNotification(
          id: '2',
          category: NotificationCategoryEnum.legal,
          title: 'Nhắc nhở pháp lý',
          content: 'abcd',
          createdAt: DateTime.now(),
          isRead: true,
        ),
        AppNotification(
          id: '3',
          category: NotificationCategoryEnum.finance,
          title: 'Công nợ quá hạn',
          content: 'abcd',
          createdAt: DateTime.now(),
          isRead: false,
        ),
        AppNotification(
          id: '4',
          category: NotificationCategoryEnum.system,
          title: 'Vận hành hệ thống',
          content: 'abcd',
          createdAt: DateTime.now(),
          isRead: true,
        ),
      ];
      await _save();
    }
    _loaded = true;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_store.map((e) => e.toMap()).toList());
    await prefs.setString(_prefsKey, raw);
  }

  @override
  Future<List<AppNotification>> fetchAll() async {
    await _ensureLoaded();
    return List<AppNotification>.unmodifiable(_store);
  }

  @override
  Future<void> markRead(String id, {bool read = true}) async {
    await _ensureLoaded();
    final i = _store.indexWhere((e) => e.id == id);
    if (i != -1) {
      _store[i] = _store[i].coppyWith(isRead: read);
      await _save();
    }
  }

  @override
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

  // tiện test: reset storage
  Future<void> clearAll() async {
    _store = [];
    _loaded = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}

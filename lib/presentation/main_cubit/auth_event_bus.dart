import 'dart:async';

import 'package:bnv_opendata/presentation/main_cubit/auth_event.dart';

class AuthEventBus {

  final _controller = StreamController<AuthEvent>.broadcast();

  Stream<AuthEvent> get stream => _controller.stream;

  void emit(AuthEvent event) {
    _controller.add(event);
  }

}
import 'dart:async';
import 'dart:developer';

import 'package:co_stock/domain/notifications/snack/snack_notification.dart';

class SnackManager {
  SnackManager._();

  static final SnackManager instance = SnackManager._();

  factory SnackManager() => instance;

  final _snackController = StreamController<SnackNotification>.broadcast();

  Stream<SnackNotification> get snacks => _snackController.stream;

  void reportSnack(SnackNotification snack) {
    log('[${DateTime.timestamp()} ${snack.userMessage}]');
    _snackController.add(snack);
  }

  void dispose() => _snackController.close();
}

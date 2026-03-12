import 'dart:async';

import 'package:co_stock/domain/notifications/snack/snack_manager.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/main.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SnackListener extends StatefulWidget {
  final Widget child;

  const SnackListener({super.key, required this.child});

  @override
  State<SnackListener> createState() => _SnackListenerState();
}

class _SnackListenerState extends State<SnackListener> {
  final SnackManager _snackManager = SnackManager();
  late final StreamSubscription<SnackNotification> _subscription;

  static const _snackBarDuration = Duration(seconds: 4);
  DateTime _lastShownTime = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void initState() {
    super.initState();
    _subscription = _snackManager.snacks
        .scan<SnackNotification?>((prev, current, index) {
          // не показываем одинаковые уведомления слишком часто
          if (prev == null || prev != current) {
            return current;
          }
          if (DateTime.now().difference(_lastShownTime) > _snackBarDuration) {
            return current;
          }
          return null;
        }, null)
        .whereNotNull()
        .listen(_onNotification);
  }

  void _onNotification(SnackNotification notification) {
    _lastShownTime = DateTime.now();

    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;

    final backgroundColor = notification.type.backgroundColor;

    messenger.showSnackBar(
      SnackBar(
        content: Text(notification.userMessage),
        duration: _snackBarDuration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

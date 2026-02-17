import 'dart:async';

import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/errors/error_manager.dart';
import 'package:co_stock/main.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ErrorListener extends StatefulWidget {
  final Widget child;

  const ErrorListener({super.key, required this.child});

  @override
  State<ErrorListener> createState() => _ErrorListenerState();
}

class _ErrorListenerState extends State<ErrorListener> {
  final ErrorManager errorManager = ErrorManager();
  late final StreamSubscription<AppError> subscription;

  @override
  void initState() {
    super.initState();
    subscription = errorManager.errors
        .scan<AppError?>((prevError, curError, index) {
          if (prevError == null || prevError != curError) {
            return curError;
          }

          final now = DateTime.now();
          if (now.difference(_lastShownTime) > _snackBarDuration) {
            return curError;
          }

          return null;
        }, null)
        .whereNotNull()
        .listen(_onError);
  }

  static const _snackBarDuration = Duration(seconds: 4);
  DateTime _lastShownTime = DateTime.fromMillisecondsSinceEpoch(0);

  void _onError(AppError error) {
    _lastShownTime = DateTime.now();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(error.userMessage), duration: _snackBarDuration),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:path_provider/path_provider.dart';

class SnackManager {
  SnackManager._();

  static final SnackManager instance = SnackManager._();

  factory SnackManager() => instance;

  final _snackController = StreamController<SnackNotification>.broadcast();

  Stream<SnackNotification> get snacks => _snackController.stream;

  void reportSnack(SnackNotification snack) {
    logSnack(snack);
    _snackController.add(snack);
  }

  void logSnack(SnackNotification snack) {
    final devMsg = snack.devMessage;
    final timestamp = DateTime.timestamp();
    final logLine = '[$timestamp] $devMsg';

    log(logLine);

    _writeToFile(logLine);
  }

  Future<void> _writeToFile(String line) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/app_errors.log');
      /// Добавляем строку в конец файла
      await file.writeAsString('$line\n', mode: .append);
    } catch (e) {
      log('Failed to write log to file: $e');
    }
  }

  void dispose() => _snackController.close();
}

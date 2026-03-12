import 'package:co_stock/domain/notifications/snack/snack_manager.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_impl.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_success.dart';
part 'app_errors.dart';
part 'snack_notification_ext.dart';
part 'snack_notification.freezed.dart';


/// Тип уведомления для выбора стиля отображения
enum SnackNotificationType { error, success }

abstract class Snack {
  const Snack();

  String get userMessage;

  void report();
}

@freezed
sealed class SnackNotification with _$SnackNotification {
  const SnackNotification._();

  const factory SnackNotification.error(AppError error) = SnackError;

  const factory SnackNotification.success(AppSuccess success) = SnackSuccess;

  /// Сообщение для показа пользователю (делегируется внутреннему объекту)
  String get userMessage => map(
    error: (e) => e.error.userMessage,
    success: (s) => s.success.userMessage,
  );

  /// Тип уведомления
  SnackNotificationType get type => map(
    error: (_) => .error,
    success: (_) => .success,
  );

  /// Отправить уведомление в глобальный менеджер
  void report() => SnackManager().reportSnack(this);
}
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
  String get devMessage;

  /// Для отображения на экране (уведомления для пользователя)
  void report();

  /// Для логирования (уведомления для разработчика)
  void log();
}

@freezed
sealed class SnackNotification extends Snack with _$SnackNotification {
  const SnackNotification._();

  const factory SnackNotification.error(AppError error) = SnackError;

  const factory SnackNotification.success(AppSuccess success) = SnackSuccess;

  /// Сообщение для показа пользователю (делегируется внутреннему объекту)
  @override
  String get userMessage => map(
    error: (e) => e.error.userMessage,
    success: (s) => s.success.userMessage,
  );

  @override
  String get devMessage => map(
    error: (e) => e.error.devMessage,
    success: (s) => s.success.devMessage,
  );


  /// Тип уведомления
  SnackNotificationType get type => map(
    error: (_) => .error,
    success: (_) => .success,
  );

  /// Отправить уведомление в глобальный менеджер
  @override
  void report() => SnackManager().reportSnack(this);

  @override
  void log() => SnackManager().logSnack(this);
}
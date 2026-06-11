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

/// Уведомление о чём либо
abstract class Snack {
  const Snack();

  /// Что видит пользователь в уведомлении на экране
  String get userMessage;

  /// Что видит разработчик в логах
  String get devMessage;

  /// Для отображения на экране (уведомления для пользователя)
  void report();

  /// Для логирования (уведомления для разработчика)
  void log();
}

/// Единая форма для любого вида уведомления
///
/// Нужна для унификации уведомлений. Чтобы можно было вне зависимости от типа
/// уведомления работать с ними в единой системе управления уведомлениями [SnackManager]
@freezed
sealed class SnackNotification extends Snack with _$SnackNotification {
  const SnackNotification._();

  /// Уведомления об ошибках
  const factory SnackNotification.error(AppError error) = SnackError;

  /// Уведомления об успехах
  const factory SnackNotification.success(AppSuccess success) = SnackSuccess;

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
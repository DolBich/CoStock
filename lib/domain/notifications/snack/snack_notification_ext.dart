part of 'snack_notification.dart';

extension SnackNotificationPresentation on SnackNotificationType {
  Color get backgroundColor {
    switch (this) {
      case .error:
        return AppThemeImpl.error;
      case .success:
        return AppThemeImpl.success;
    }
  }
}
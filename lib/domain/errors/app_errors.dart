import 'package:co_stock/domain/errors/error_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_errors.freezed.dart';

enum AuthErrorType { serverError, invalidCredentials, tokenExpired }
enum NetworkErrorType { timeout, noInternet, serverError }

@freezed
sealed class AppError with _$AppError implements Exception {
  const AppError._();

  const factory AppError.auth({required AuthErrorType type, String? msg}) =
      _AuthError;

  const factory AppError.network({
    required NetworkErrorType type,
    String? message,
  }) = _NetworkError;

  String get userMessage => when(
    auth: (type, msg) => _authMessage(type, msg),
    network: (type, msg) => _networkMessage(type, msg),
  );

  String _authMessage(AuthErrorType type, String? msg) {
    switch (type) {
      case AuthErrorType.serverError:
        return 'Authentication server error${msg != null ? ': $msg' : ''}';
      case AuthErrorType.invalidCredentials:
        return 'Invalid email or password';
      case AuthErrorType.tokenExpired:
        return 'Session expired. Please log in again.';
    }
  }

  String _networkMessage(NetworkErrorType type, String? msg) {
    switch (type) {
      case NetworkErrorType.timeout:
        return 'Connection timeout. Check your internet.';
      case NetworkErrorType.noInternet:
        return 'No internet connection.';
      case NetworkErrorType.serverError:
        return 'Server error (${msg ?? 'unknown'})';
    }
  }
}

extension AppErrorReporting on AppError {
  void report() => ErrorManager().reportError(this);
}

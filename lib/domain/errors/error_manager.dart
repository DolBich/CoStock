import 'dart:async';
import 'dart:developer';

import 'package:co_stock/domain/errors/app_errors.dart';

class ErrorManager {
  ErrorManager._();

  static final ErrorManager instance = ErrorManager._();

  factory ErrorManager() => instance;

  final _errorController = StreamController<AppError>.broadcast();

  Stream<AppError> get errors => _errorController.stream;

  void reportError(AppError error) {
    if(error.msg != null) log(error.userMessage);
    _errorController.add(error);
  }

  void dispose() => _errorController.close();
}

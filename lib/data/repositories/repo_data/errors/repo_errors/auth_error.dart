import 'package:co_stock/data/repositories/repo_data/errors/repo_error.dart';

class AuthError extends RepoError {
  AuthError(super.msg);

  @override
  String get msgToText => 'Authentication error: $msg';
}
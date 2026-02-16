abstract class RepoError {
  const RepoError(this.msg);

  final String msg;

  String get msgToText;
}
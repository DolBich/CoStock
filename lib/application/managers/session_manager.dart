class SessionManager {
  static String? _id;

  static String? get id => _id;

  static set id(String? id) => _id = id;

  static void clear() => _id = null;
}
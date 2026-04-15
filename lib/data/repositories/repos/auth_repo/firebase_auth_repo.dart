import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/bases/user.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepository extends IAuthRepository {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _usersCollection = 'users';

  DocumentReference<Map<String, dynamic>> _userDoc(String uid) =>
      _firestore.collection(_usersCollection).doc(uid);

  // Преобразование FirebaseUser + Firestore в User
  Future<Either<AppError, User>> _buildUserFromFirebase(
      firebase_auth.User firebaseUser,
      ) async {
    try {
      final doc = await _userDoc(firebaseUser.uid).get();
      if (!doc.exists) {
        return left(
          AppError.client(
            type: ClientErrorType.state,
            error: Exception('User profile not found in Firestore'),
            stackTrace: StackTrace.current,
          ),
        );
      }
      final data = doc.data()!;
      return right(
        User.customId(
          id: firebaseUser.uid,
          name: data['name'] ?? '',
          email: firebaseUser.email,
          phone: firebaseUser.phoneNumber,
          login: data['login'],
          password: '', // не храним
          settings: data['settings'] != null
              ? UserSettings.fromJson(data['settings'] as Map<String, dynamic>)
              : null,
        ),
      );
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(
          type: ClientErrorType.smth,
          error: e,
          stackTrace: st,
        ),
      );
    }
  }

  // Преобразование FirebaseAuthException в AppError
  AppError _handleAuthException(firebase_auth.FirebaseAuthException e, StackTrace st) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
        return AppError.auth(type: AuthErrorType.password, error: e, stackTrace: st);
      case 'email-already-in-use':
        return AppError.auth(type: AuthErrorType.emailAlreadyRegistered, error: e, stackTrace: st);
      case 'invalid-email':
      case 'invalid-credential':
        return AppError.auth(type: AuthErrorType.identifier, error: e, stackTrace: st);
      case 'network-request-failed':
        return AppError.server(type: ServerErrorType.internet, error: e, stackTrace: st);
      case 'too-many-requests':
        return AppError.server(type: ServerErrorType.server, error: e, stackTrace: st);
      default:
        return AppError.server(type: ServerErrorType.server, error: e, stackTrace: st);
    }
  }

  AppError _handleFirestoreException(FirebaseException e, StackTrace st) {
    if (e.code == 'unavailable' || e.code == 'deadline-exceeded') {
      return AppError.server(type: ServerErrorType.timeout, error: e, stackTrace: st);
    }
    if (e.code == 'permission-denied') {
      return AppError.client(type: ClientErrorType.state, error: e, stackTrace: st);
    }
    return AppError.server(type: ServerErrorType.server, error: e, stackTrace: st);
  }

// 1. Проверка существования аккаунта для входа (возвращает uid)
  @override
  Future<Either<AppError, String>> checkAuthAccount({
    required AuthMethod method,
    required String identifier,
  }) async {
    try {
      String? uid;
      switch (method) {
        case AuthMethod.email:
          uid = await _findUidByField('email', identifier);
          break;
        case AuthMethod.phone:
          uid = await _findUidByField('phone', identifier);
          break;
        case AuthMethod.login:
          uid = await _findUidByField('login', identifier);
          break;
      }
      if (uid != null) {
        return right(uid);
      }
      return left(AppError.auth(type: AuthErrorType.identifier));
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

// 2. Проверка существования аккаунта для регистрации
  @override
  Future<Either<AppError, Unit>?> checkRegAccount({
    required AuthMethod method,
    required String identifier,
    CancelToken? cancelToken,
  }) async {
    try {
      bool exists = false;
      switch (method) {
        case AuthMethod.email:
          final uid = await _findUidByField('email', identifier);
          exists = uid != null;
          break;
        case AuthMethod.phone:
          final uid = await _findUidByField('phone', identifier);
          exists = uid != null;
          break;
        case AuthMethod.login:
          final uid = await _findUidByField('login', identifier);
          exists = uid != null;
          break;
      }
      if (exists) {
        return left(AppError.auth(type: method.error));
      }
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // Вспомогательный метод для поиска uid документа по значению поля
  Future<String?> _findUidByField(String field, String value) async {
    try {
      final query = await _firestore
          .collection(_usersCollection)
          .where(field, isEqualTo: value)
          .limit(1)
          .get();
      return query.docs.isNotEmpty ? query.docs.first.id : null;
    } on FirebaseException {
      return null;
    }
  }

  // 3. Вход
  @override
  Future<Either<AppError, User>> login({
    required String id,
    required String password,
  }) async {
    try {
      String? email;
      if (id.contains('@') && id.contains('.')) {
        email = id;
      } else {
        final query = await _firestore
            .collection(_usersCollection)
            .where('login', isEqualTo: id)
            .limit(1)
            .get();
        if (query.docs.isEmpty) {
          return left(AppError.auth(type: AuthErrorType.identifier));
        }
        email = query.docs.first.data()['email'] as String?;
        if (email == null) {
          return left(
            AppError.client(
              type: ClientErrorType.state,
              error: Exception('User has no email associated'),
              stackTrace: StackTrace.current,
            ),
          );
        }
      }
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await _buildUserFromFirebase(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e, st) {
      return left(_handleAuthException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 4. Регистрация
  @override
  Future<Either<AppError, String>> register(User user) async {
    try {
      if (user.email == null || user.email!.isEmpty) {
        return left(
          AppError.client(
            type: ClientErrorType.state,
            error: Exception('Email required'),
            stackTrace: StackTrace.current,
          ),
        );
      }
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password,
      );
      final uid = userCredential.user!.uid;
      final profileData = {
        'name': user.name,
        'login': user.login,
        'email': user.email,
        'phone': user.phone,
        'settings': user.settings?.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      };
      await _userDoc(uid).set(profileData);
      return right(uid);
    } on firebase_auth.FirebaseAuthException catch (e, st) {
      return left(_handleAuthException(e, st));
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 5. Получение текущего пользователя
  @override
  Future<Either<AppError, User>> getCurrentUser({required String id}) async {
    try {
      final firebaseUser = _auth.currentUser;
      if (firebaseUser == null || firebaseUser.uid != id) {
        return left(AppError.auth(type: AuthErrorType.identifier));
      }
      return await _buildUserFromFirebase(firebaseUser);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 6. Обновление имени
  @override
  Future<Either<AppError, Unit>> updateName({
    required String id,
    required String name,
  }) async {
    try {
      await _userDoc(id).update({'name': name});
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 7. Обновление email
  @override
  Future<Either<AppError, Unit>?> updateEmail({
    required String id,
    required String? email,
    CancelToken? cancelToken,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null || user.uid != id) {
        return left(AppError.auth(type: AuthErrorType.identifier));
      }
      if (email == null || email.isEmpty) {
        return left(
          AppError.client(
            type: ClientErrorType.state,
            error: Exception('Email cannot be null'),
            stackTrace: StackTrace.current,
          ),
        );
      }
      await user.verifyBeforeUpdateEmail(email);
      await _userDoc(id).update({'email': email});
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e, st) {
      return left(_handleAuthException(e, st));
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 8. Обновление логина (только Firestore)
  @override
  Future<Either<AppError, Unit>?> updateLogin({
    required String id,
    required String? login,
    CancelToken? cancelToken,
  }) async {
    try {
      if (login == null || login.isEmpty) {
        await _userDoc(id).update({'login': FieldValue.delete()});
      } else {
        // Проверка уникальности логина
        final existing = await _firestore
            .collection(_usersCollection)
            .where('login', isEqualTo: login)
            .limit(1)
            .get();
        if (existing.docs.isNotEmpty && existing.docs.first.id != id) {
          return left(AppError.auth(type: AuthErrorType.loginAlreadyExists));
        }
        await _userDoc(id).update({'login': login});
      }
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 9. Обновление пароля
  @override
  Future<Either<AppError, Unit>> updatePassword({
    required String id,
    required String password,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null || user.uid != id) {
        return left(AppError.auth(type: AuthErrorType.identifier));
      }
      await user.updatePassword(password);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e, st) {
      return left(_handleAuthException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 10. Обновление телефона (только Firestore, для полной смены требуется верификация)
  @override
  Future<Either<AppError, Unit>?> updatePhone({
    required String id,
    required String? phone,
    CancelToken? cancelToken,
  }) async {
    try {
      if (phone == null || phone.isEmpty) {
        await _userDoc(id).update({'phone': FieldValue.delete()});
      } else {
        // Проверка уникальности телефона
        final existing = await _firestore
            .collection(_usersCollection)
            .where('phone', isEqualTo: phone)
            .limit(1)
            .get();
        if (existing.docs.isNotEmpty && existing.docs.first.id != id) {
          return left(AppError.auth(type: AuthErrorType.phoneAlreadyRegistered));
        }
        await _userDoc(id).update({'phone': phone});
      }
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }

  // 11. Обновление настроек
  @override
  Future<Either<AppError, Unit>> updateUserSettings({
    required String id,
    required UserSettings settings,
  }) async {
    try {
      await _userDoc(id).update({'settings': settings.toJson()});
      return right(unit);
    } on FirebaseException catch (e, st) {
      return left(_handleFirestoreException(e, st));
    } catch (e, st) {
      return left(
        AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st),
      );
    }
  }
}

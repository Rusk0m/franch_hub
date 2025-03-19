import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:franch_hub/app/models/user/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  final String message;
}

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firestore = firestore ?? FirebaseFirestore.instance;

  /// Поток данных пользователя с информацией из Firestore
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return User.empty;

      final userDoc = await _firestore.collection('users').doc(firebaseUser.uid).get();

      if (!userDoc.exists) {
        return await _createUserFromFirebaseUser(firebaseUser);
      }

      return User.fromFirestore(userDoc);
    });
  }

  /// Текущий пользователь Firebase
  firebase_auth.User? get currentFirebaseUser => _firebaseAuth.currentUser;

  /// Регистрация с email и паролем
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _createUserInFirestore(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Вход с email и паролем
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Вход через Google
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw const LogInWithGoogleFailure('Отменено пользователем');

      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      await _syncUserWithFirestore(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      throw LogInWithGoogleFailure(e.toString());
    }
  }

  /// Выход из системы
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// Получение пользователя по ID
  Future<User> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) throw Exception('Пользователь не найден');
    return User.fromFirestore(doc);
  }

  //--- Приватные методы ---//

  Future<User> _createUserFromFirebaseUser(firebase_auth.User firebaseUser) async {
    final userData = {
      'uid': firebaseUser.uid,
      'email': firebaseUser.email ?? '',
      'name': firebaseUser.displayName ?? 'Новый пользователь',
      'avatarUrl': firebaseUser.photoURL,
      'role': 'user',
      'createdAt': FieldValue.serverTimestamp(),
      'phone': null,
      'franchiseId': null,
      'franchisorId': null,
    };

    await _firestore.collection('users').doc(firebaseUser.uid).set(userData);
    return User.fromJson(userData);
  }

  Future<void> _createUserInFirestore({
    required String uid,
    required String email,
    required String name,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'role': 'user',
      'createdAt': FieldValue.serverTimestamp(),
      'avatarUrl': null,
      'phone': null,
      'franchiseId': null,
      'franchisorId': null,
    });
  }

  Future<User> _syncUserWithFirestore(firebase_auth.User firebaseUser) async {
    final userRef = _firestore.collection('users').doc(firebaseUser.uid);
    final doc = await userRef.get();

    if (!doc.exists) {
      final newUser = {
        'uid': firebaseUser.uid,
        'email': firebaseUser.email ?? '',
        'name': firebaseUser.displayName ?? 'Новый пользователь',
        'avatarUrl': firebaseUser.photoURL,
        'role': 'user',
        'createdAt': FieldValue.serverTimestamp(),
        'phone': null,
        'franchiseId': null,
        'franchisorId': null,
      };

      await userRef.set(newUser);
      return User.fromJson(newUser);
    }

    return User.fromFirestore(doc);
  }
}

/// Расширение для конвертации Firebase User в нашу модель
extension on firebase_auth.User {
  User get toAppUser => User(
    uid: uid,
    email: email ?? '',
    name: displayName ?? '',
    avatarUrl: photoURL,
    role: 'user',
    createdAt: DateTime.now(),
    phone: null,
    franchiseId: null,
    franchisorId: null,
  );
}

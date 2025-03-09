import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:franch_hub/app/models/user/user.dart';
import 'package:franch_hub/app/repositories/cache_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

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
  final CacheClient _cache;

  AuthenticationRepository(
      {firebase_auth.FirebaseAuth? firebaseAuth,
      GoogleSignIn? googleSignIn,
      FirebaseFirestore? firestore,
      CacheClient? cache})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firestore = firestore ?? FirebaseFirestore.instance,
        _cache = cache ?? CacheClient();

  @visibleForTesting
  bool isWeb = kIsWeb;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    String? franchiseId,
    String? franchisorId,
    String? avatarUrl,
    String? phone,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Создаем запись в Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name':name,
        'email': email,
        'role': 'user',
        'franchiseId': franchiseId,
        'franchisorId': franchisorId,
        'avatarUrl':avatarUrl,
        'phone':phone,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

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

  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;

      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential =
            await _firebaseAuth.signInWithPopup(googleProvider);
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Проверяем существование пользователя в Firestore
      final doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (!doc.exists) {
        // Создаем новую запись для Google-пользователя
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

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
}

extension on firebase_auth.User {
  User get toUser {
    return User(
        uid: uid,
        name: displayName,
        email: email!,
        avatarUrl: photoURL,
        role: 'user',
        createdAt: DateTime.now(),
        );
  }
}

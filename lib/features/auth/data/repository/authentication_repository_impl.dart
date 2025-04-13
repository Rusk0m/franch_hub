import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

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

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FirebaseAuth _firebaseAuth; // Добавьте это поле

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required FirebaseAuth firebaseAuth, // Добавьте параметр
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final firebaseUser = await remoteDataSource.signUp(name, email, password);
    if (firebaseUser == null) throw Exception("Ошибка при регистрации");
  }

  @override
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    final firebaseUser =
        await remoteDataSource.logInWithEmailAndPassword(email, password);
    if (firebaseUser == null) throw Exception("Ошибка входа");
  }

  @override
  Future<void> logInWithGoogle() async {
    await remoteDataSource.logInWithGoogle();
  }

  @override
  Future<void> logOut() async {
    await remoteDataSource.logOut();
  }

  @override
  Stream<UserEntity> get user {
    return remoteDataSource.user.map((userModel) => userModel.toEntity());
  }

  @override
  Future<UserEntity> getUser(String uid) async {
    final userModel = await remoteDataSource.getUser(uid);
    return userModel.toEntity();
  }

  @override
  UserEntity? get currentUser => _firebaseAuth.currentUser?.toEntity();

}

extension FirebaseUserX on firebase_auth.User {
  UserEntity toEntity() => UserEntity(
        uid: uid,
        email: email ?? '',
        name: displayName ?? '',
        avatarUrl: photoURL,
        role: 'user',
        createdAt: DateTime.now(),
        phone: null,
      );
}

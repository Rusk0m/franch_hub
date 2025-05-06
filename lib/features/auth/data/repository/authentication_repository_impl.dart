import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';
import 'package:franch_hub/generated/l10n.dart';
class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;

  SignUpWithEmailAndPasswordFailure(BuildContext context, [
    String? messageKey,
  ]) : message = messageKey == null
      ? S.of(context)!.unknownError
      : _getMessage(context, messageKey);

  factory SignUpWithEmailAndPasswordFailure.fromCode(BuildContext context, String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(context, 'invalidEmail');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(context, 'emailAlreadyInUse');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(context, 'operationNotAllowed');
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(context, 'weakPassword');
      default:
        return SignUpWithEmailAndPasswordFailure(context);
    }
  }

  static String _getMessage(BuildContext context, String messageKey) {
    final l10n = S.of(context)!;
    switch (messageKey) {
      case 'invalidEmail':
        return l10n.invalidEmail;
      case 'emailAlreadyInUse':
        return l10n.emailAlreadyInUse;
      case 'operationNotAllowed':
        return l10n.operationNotAllowed;
      case 'weakPassword':
        return l10n.weakPassword;
      case 'signUpError':
        return l10n.signUpError('Unknown error');
      default:
        return l10n.unknownError;
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;

  LogInWithEmailAndPasswordFailure(BuildContext context, [
    String? messageKey,
  ]) : message = messageKey == null
      ? S.of(context)!.unknownError
      : _getMessage(context, messageKey);

  factory LogInWithEmailAndPasswordFailure.fromCode(BuildContext context, String code) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(context, 'invalidEmail');
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(context, 'userDisabled');
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(context, 'emailNotFound');
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(context, 'wrongPassword');
      default:
        return LogInWithEmailAndPasswordFailure(context);
    }
  }

  static String _getMessage(BuildContext context, String messageKey) {
    final l10n = S.of(context)!;
    switch (messageKey) {
      case 'invalidEmail':
        return l10n.invalidEmail;
      case 'userDisabled':
        return l10n.userDisabled;
      case 'emailNotFound':
        return l10n.emailNotFound;
      case 'wrongPassword':
        return l10n.wrongPassword;
      case 'loginError':
        return l10n.loginError('Unknown error');
      default:
        return l10n.unknownError;
    }
  }
}

class LogInWithGoogleFailure implements Exception {
  final String message;

  LogInWithGoogleFailure(BuildContext context, [
    String? messageKey,
  ]) : message = messageKey == null
      ? S.of(context)!.unknownError
      : _getMessage(context, messageKey);

  factory LogInWithGoogleFailure.fromCode(BuildContext context, String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(context, 'accountExistsDifferentCredential');
      case 'invalid-credential':
        return LogInWithGoogleFailure(context, 'invalidCredential');
      case 'operation-not-allowed':
        return LogInWithGoogleFailure(context, 'operationNotAllowed');
      case 'user-disabled':
        return LogInWithGoogleFailure(context, 'userDisabled');
      case 'user-not-found':
        return LogInWithGoogleFailure(context, 'emailNotFound');
      case 'wrong-password':
        return LogInWithGoogleFailure(context, 'wrongPassword');
      case 'invalid-verification-code':
        return LogInWithGoogleFailure(context, 'invalidVerificationCode');
      case 'invalid-verification-id':
        return LogInWithGoogleFailure(context, 'invalidVerificationId');
      default:
        return LogInWithGoogleFailure(context);
    }
  }

  static String _getMessage(BuildContext context, String messageKey) {
    final l10n = S.of(context)!;
    switch (messageKey) {
      case 'accountExistsDifferentCredential':
        return l10n.accountExistsDifferentCredential;
      case 'invalidCredential':
        return l10n.invalidCredential;
      case 'operationNotAllowed':
        return l10n.operationNotAllowed;
      case 'userDisabled':
        return l10n.userDisabled;
      case 'emailNotFound':
        return l10n.emailNotFound;
      case 'wrongPassword':
        return l10n.wrongPassword;
      case 'invalidVerificationCode':
        return l10n.invalidVerificationCode;
      case 'invalidVerificationId':
        return l10n.invalidVerificationId;
      case 'googleLoginError':
        return l10n.googleLoginError('Unknown error');
      default:
        return l10n.unknownError;
    }
  }
}

class LogOutFailure implements Exception {
  final String message;

  LogOutFailure(BuildContext context)
      : message = S.of(context)!.logoutError('Logout failed');
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDataSource remoteDataSource;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required firebase_auth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await remoteDataSource.signUp(name, email, password);
      if (firebaseUser == null) {
        throw Exception('Sign up failed: User is null');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception('Sign up failed: ${e.code}');
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await remoteDataSource.logInWithEmailAndPassword(email, password);
      if (firebaseUser == null) {
        throw Exception('Login failed: User is null');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception('Login failed: ${e.code}');
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      await remoteDataSource.logInWithGoogle();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception('Google login failed: ${e.code}');
    } catch (e) {
      throw Exception('Google login failed: $e');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await remoteDataSource.logOut();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  @override
  Stream<UserEntity> get user {
    return remoteDataSource.user.map((userModel) => userModel.toEntity());
  }

  @override
  Future<UserEntity> getUser(String uid) async {
    try {
      final userModel = await remoteDataSource.getUser(uid);
      return userModel.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  @override
  UserEntity? get currentUser => _firebaseAuth.currentUser?.toEntity();
}

extension FirebaseUserX on firebase_auth.User {
  UserEntity toEntity() => UserEntity(
    uid: uid,
    email: email ?? '',
    name: displayName,
    avatarUrl: photoURL,
    role: 'user',
    createdAt: DateTime.now(),
    phone: phoneNumber,
  );
}
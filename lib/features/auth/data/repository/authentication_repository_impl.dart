import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed. Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;

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
}

class LogInWithGoogleFailure implements Exception {
  final String message;

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
          'Operation is not allowed. Please contact support.',
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
}

class LogOutFailure implements Exception {}

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
        throw const SignUpWithEmailAndPasswordFailure('Sign up failed');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser =
      await remoteDataSource.logInWithEmailAndPassword(email, password);
      if (firebaseUser == null) {
        throw const LogInWithEmailAndPasswordFailure('Login failed');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      await remoteDataSource.logInWithGoogle();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await remoteDataSource.logOut();
    } catch (e) {
      throw LogOutFailure();
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
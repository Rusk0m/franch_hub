import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<firebase_auth.User?> signUp(String name, String email, String password);
  Future<firebase_auth.User?> logInWithEmailAndPassword(String email, String password);
  Future<void> logInWithGoogle();
  Future<void> logOut();
  Future<UserModel> getUser(String uid);
  Stream<UserModel> get user;
  firebase_auth.User? get currentFirebaseUser;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  })
      : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  @override
  Future<firebase_auth.User?> signUp(String name, String email,
      String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'createdAt': DateTime.now().toIso8601String(),
        'role': 'user',
      });

      return userCredential.user;
    } catch (e) {
      throw Exception("Ошибка регистрации: $e");
    }
  }

  @override
  Future<firebase_auth.User?> logInWithEmailAndPassword(String email,
      String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Ошибка входа: $e");
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception("Ошибка входа через Google: $e");
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) throw Exception('Пользователь не найден');
    return UserModel.fromFirestore(doc);
  }

  @override
  firebase_auth.User? get currentFirebaseUser => _firebaseAuth.currentUser;

  @override
  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return UserModel.empty;

      final userDoc = await _firestore.collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (!userDoc.exists) {
        return await _createUserFromFirebaseUser(firebaseUser);
      }

      return UserModel.fromFirestore(userDoc);
    });
  }

  Future<UserModel> _createUserFromFirebaseUser(
      firebase_auth.User firebaseUser) async {
    try {
      // 1. Создаем модель пользователя
      final userModel = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName ?? 'New User',
        avatarUrl: firebaseUser.photoURL,
        role: 'user',
        createdAt: DateTime.now(),
        phone: null,
        franchiseId: null,
        franchisorId: null,
      );

      // 2. Сохраняем в Firestore
      await _firestore.collection('users').doc(firebaseUser.uid).set(
        userModel.toJson(),);
      // 3. Возвращаем Model
      return userModel;
    }
    on FirebaseException catch (e) {
      throw Exception(e.message ?? 'User creation failed');
    }
  }
}
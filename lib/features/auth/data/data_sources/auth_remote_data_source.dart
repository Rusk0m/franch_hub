import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:franch_hub/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<firebase_auth.User?> signUp(String name, String email, String password);
  Future<firebase_auth.User?> logInWithEmailAndPassword(
      String email, String password);
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
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  @override
  Future<firebase_auth.User?> signUp(
      String name, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'name': name,
          'createdAt': Timestamp.fromDate(DateTime.now()),
          'role': 'user',
        });
      }
      print('SignUp: User created with UID: ${user?.uid}');
      return user;
    } catch (e) {
      print('SignUp error: $e');
      throw Exception("Ошибка регистрации: $e");
    }
  }

  @override
  Future<firebase_auth.User?> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login: User logged in with UID: ${userCredential.user?.uid}');
      return userCredential.user;
    } catch (e) {
      print('Login error: $e');
      throw Exception("Ошибка входа: $e");
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('GoogleSignIn: User cancelled');
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
      await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (!userDoc.exists) {
          await _createUserFromFirebaseUser(user);
        }
        print('GoogleSignIn: User logged in with UID: ${user.uid}');
      }
    } catch (e) {
      print('GoogleSignIn error: $e');
      throw Exception("Ошибка входа через Google: $e");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      print('Logout: User signed out');
    } catch (e) {
      print('Logout error: $e');
      throw Exception("Ошибка выхода: $e");
    }
  }

  @override
  Future<UserModel> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) throw Exception('Пользователь не найден');
      final userModel = UserModel.fromFirestore(doc);
      print('GetUser: Fetched user with UID: $uid, Role: ${userModel.role}');
      return userModel;
    } catch (e) {
      print('GetUser error: $e');
      throw Exception('Failed to fetch user: $e');
    }
  }

  @override
  firebase_auth.User? get currentFirebaseUser => _firebaseAuth.currentUser;

  @override
  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        print('User stream: No user (unauthenticated)');
        return UserModel.empty;
      }
      final userDoc = await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (!userDoc.exists) {
        print('User stream: Creating new user for UID: ${firebaseUser.uid}');
        return await _createUserFromFirebaseUser(firebaseUser);
      }
      final userModel = UserModel.fromFirestore(userDoc);
      print('User stream: Emitting user with UID: ${userModel.uid}, Role: ${userModel.role}');
      return userModel;
    });
  }

  Future<UserModel> _createUserFromFirebaseUser(
      firebase_auth.User firebaseUser) async {
    try {
      final userModel = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName ?? 'New User',
        avatarUrl: firebaseUser.photoURL,
        role: 'user',
        createdAt: DateTime.now(),
        phone: firebaseUser.phoneNumber,
      );
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(userModel.toJson());
      print('CreateUser: Created user with UID: ${firebaseUser.uid}');
      return userModel;
    } on FirebaseException catch (e) {
      print('CreateUser error: $e');
      throw Exception(e.message ?? 'User creation failed');
    }
  }
}
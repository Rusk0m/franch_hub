import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/app.dart';
import 'package:franch_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:franch_hub/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Инициализируем зависимости
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn.standard();

  final authRemoteDataSource = AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth, googleSignIn: googleSignIn, firestore: firestore);
  final authenticationRepository = AuthenticationRepositoryImpl(remoteDataSource: authRemoteDataSource, firebaseAuth: firebaseAuth);
  final settingsRepository = SettingsRepository();

  runApp(App(
    authenticationRepository: authenticationRepository,
    settingsRepository: settingsRepository,
  ));
}

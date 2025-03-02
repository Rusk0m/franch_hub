import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/repositories/authentication_repository.dart';
import 'package:franch_hub/app/view/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final  authenticationRepository = AuthenticationRepository();
  runApp(
      RepositoryProvider(
        create: (context) => AuthenticationRepository(),
        child: App(authenticationRepository: authenticationRepository,))
  );
}

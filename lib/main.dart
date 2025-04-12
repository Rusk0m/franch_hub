import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/app/app.dart';
import 'package:franch_hub/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();

  runApp(App());
}

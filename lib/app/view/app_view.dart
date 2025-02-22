import 'package:flutter/material.dart';
import 'package:franch_hub/app/pages/auth/auth.dart';
import 'package:franch_hub/app/theme/theme_app.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterAppTheme.light,
      darkTheme: FlutterAppTheme.dark,
      themeMode: ThemeMode.system,
      home: AuthPage(),
    );
  }
}

import 'package:flutter/material.dart';

class FlutterAppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.amber),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
      ),
      focusColor: Colors.amber,

      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.amber[600]!,
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.amber,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class FlutterTextTheme{
  // Заголовки
  static TextStyle headlineLarge(BuildContext context) => TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onBackground,
    height: 1.2,
  );

  static TextStyle headlineMedium(BuildContext context) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onBackground,
  );

  // Подзаголовки
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // Основной текст
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
    height: 1.5,
  );

  // Вспомогательный текст
  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
  );

  // Текст кнопок
  static TextStyle buttonLabel(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  // Кастомный стиль с возможностью переопределения цвета
  static TextStyle custom({
    required BuildContext context,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }
}
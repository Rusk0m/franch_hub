import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/app/repositories/repositories.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SettingsRepository _settingsRepository;

  ThemeCubit(this._settingsRepository) : super(ThemeMode.system) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final theme = await _settingsRepository.getTheme();
    emit(theme);
  }

  Future <void> setTheme(ThemeMode theme) async {
    await _settingsRepository.saveTheme(theme);
    emit(theme);
  }
}

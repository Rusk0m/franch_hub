import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';

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

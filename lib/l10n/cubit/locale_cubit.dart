import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/app/repositories/repositories.dart';

class LocaleCubit extends Cubit<Locale?> {
  final SettingsRepository settingsRepository;
  LocaleCubit(this.settingsRepository) : super(null){
    loadLocale();
  }
  Future<void> loadLocale() async {
    final locale = await settingsRepository.getLocale();
    emit(locale);
  }

  Future<void> changeLocale(Locale locale) async {
    await settingsRepository.saveLocale(locale);
    emit(locale);
  }
}

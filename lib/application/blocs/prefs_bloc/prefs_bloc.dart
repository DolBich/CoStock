import 'package:co_stock/domain/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_seeded.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prefs_event.dart';

part 'prefs_state.dart';

part 'handlers/theme_handler.dart';

part 'prefs_bloc.freezed.dart';

/// Этот Bloc отвечает за все предпочтения пользователя
/// Язык, Тема, Размер шрифта и во твсё такое
class PrefsBloc extends Bloc<PrefsEvent, PrefsState> {
  PrefsBloc() : super(PrefsState.initial()) {
    on<_Init>(_onInit);

    /// Theme
    on<_SetThemeMode>(_onSetThemeMode);
    on<_SetSeedColor>(_onSetSeedColor);
    on<_ChangeThemeSystem>(_changeThemeSystem);

    /// Locale
    on<_ChangeLocale>(_changeLocale);

    add(const PrefsEvent.init());
  }

  Future<void> _onInit(_Init event, Emitter<PrefsState> emit) async {
    final locale = await LocalStorageService.getLocale();
    final themeSysVar = await LocalStorageService.getThemeSysVar();
    final themeMode = await LocalStorageService.getThemeMode();
    final colorSeed = await LocalStorageService.getThemeSeed();

    emit(
      PrefsState.initial(
        locale: locale,
        themeSysVar: themeSysVar,
        themeMode: themeMode,
        colorSeed: colorSeed,
      )
    );
  }

  ///
  /// Theme
  ///
  void _changeThemeSystem(_ChangeThemeSystem event, Emitter<PrefsState> emit) {
    ThemeHandler.themeSystem = event.themeSystem;
    LocalStorageService.saveThemeSysVar(event.themeSystem);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  Future<void> _onSetThemeMode(_SetThemeMode event, Emitter<PrefsState> emit) async {
    ThemeHandler.themeMode = event.mode;
    LocalStorageService.saveThemeMode(event.mode);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  Future<void> _onSetSeedColor(_SetSeedColor event, Emitter<PrefsState> emit) async {
    AppThemeSeeded.seed = event.seed;
    LocalStorageService.saveThemeSeed(event.seed);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  ///
  /// Locale
  ///
  Future<void> _changeLocale(_ChangeLocale event, Emitter<PrefsState> emit) async {
    LocalStorageService.saveLocale(event.appLocale);

    emit(state.copyWith(appLocale: event.appLocale));
  }
}

import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_impl.dart';
import 'package:co_stock/presentation/prefs/theme/theme_config.dart';
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
  PrefsBloc() : super(.initial()) {
    on<_Init>(_onInit);

    /// Theme
    on<_SetThemeMode>(_onSetThemeMode);
    on<_SetSeedColor>(_onSetSeedColor);
    on<_ChangeUseSeed>(_changeUseSeed);

    /// Locale
    on<_ChangeAppLocale>(_changeAppLocale);
    on<_ChangePhoneLocale>(_changePhoneLocale);

    /// Repositories
    on<_ChangeRepo>(_changeRepo);

    add(const PrefsEvent.init());
  }

  Future<void> _onInit(_Init event, Emitter<PrefsState> emit) async {
    final appLocale = await LocalStorageService.getAppLocale();
    final phoneLocale = await LocalStorageService.getPhoneLocale();
    final useSeed = await LocalStorageService.getUseSeed();
    final themeMode = await LocalStorageService.getThemeMode();
    final colorSeed = await LocalStorageService.getThemeSeed();

    emit(
      .initial(
        appLocale: appLocale,
        phoneLocale: phoneLocale,
        useSeed: useSeed,
        themeMode: themeMode,
        colorSeed: colorSeed,
      ),
    );
  }

  ///
  /// Theme
  ///
  void _changeUseSeed(_ChangeUseSeed event, Emitter<PrefsState> emit) {
    ThemeHandler.changeThemeConfig(useSeed: event.useSeed);
    LocalStorageService.saveUseSeed(event.useSeed);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  void _onSetThemeMode(_SetThemeMode event, Emitter<PrefsState> emit) {
    ThemeHandler.themeMode = event.mode;
    LocalStorageService.saveThemeMode(event.mode);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  void _onSetSeedColor(_SetSeedColor event, Emitter<PrefsState> emit) {
    ThemeHandler.changeThemeConfig(seed: event.seed);
    LocalStorageService.saveThemeSeed(event.seed);

    emit(state.copyWith(themeData: ThemeHandler.buildTheme()));
  }

  ///
  /// Locale
  ///
  void _changeAppLocale(_ChangeAppLocale event, Emitter<PrefsState> emit) {
    LocalStorageService.saveAppLocale(event.appLocale);

    emit(state.copyWith(appLocale: event.appLocale));
  }

  void _changePhoneLocale(_ChangePhoneLocale event, Emitter<PrefsState> emit) {
    LocalStorageService.savePhoneLocale(event.phoneLocale);

    emit(state.copyWith(phoneLocale: event.phoneLocale));
  }

  ///
  /// Repositories
  ///

  void _changeRepo(_ChangeRepo event, Emitter<PrefsState> emit) {
    LocalStorageService.saveUseMock(!state.useMock);

    emit(state.copyWith(useMock: !state.useMock));
  }
}

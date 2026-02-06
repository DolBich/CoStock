import 'package:co_stock/presentation/theme/app_theme_classic.dart';
import 'package:co_stock/presentation/theme/app_theme_seeded.dart';
import 'package:co_stock/presentation/theme/app_theme_system.dart';
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
    on<_SetThemeMode>(_onSetThemeMode);
    on<_SetSeedColor>(_onSetSeedColor);
    on<_ChangeThemeSystem>(_changeThemeSystem);
  }

  void _onInit(_Init event, Emitter<PrefsState> emit) {
    // TODO: загрузка из SharedPreferences
  }

  void _changeThemeSystem(_ChangeThemeSystem event, Emitter<PrefsState> emit) {
    ThemeHandler.themeSystem = event.themeSystem;

    emit(
      state.copyWith(
        themeData: ThemeHandler.buildTheme(mode: state.themeMode),
      ),
    );
  }

  void _onSetThemeMode(_SetThemeMode event, Emitter<PrefsState> emit) {
    emit(
      state.copyWith(
        themeMode: event.mode,
        themeData: ThemeHandler.buildTheme(mode: event.mode),
      ),
    );
  }

  void _onSetSeedColor(_SetSeedColor event, Emitter<PrefsState> emit) {
    AppThemeSeeded.seed = event.seed;

    emit(
      state.copyWith(
        seedColor: event.seed,
        themeData: ThemeHandler.buildTheme(mode: state.themeMode),
      ),
    );
  }
}

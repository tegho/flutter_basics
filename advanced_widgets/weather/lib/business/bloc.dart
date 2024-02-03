import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '/business/actions.dart';
import '/business/state.dart';

class AppBloc extends Bloc<BaseEvent, AppState> {
  AppBloc()
      : super(
          AppState(
            themePreset: ThemePreset.dark,
            theme: ThemeData.dark(),
            weatherLevel: 0.25,
            widgetMode: WeatherWidgetMode.small,
          ),
        ) {
    on<InitEvent>(_onActionInit);
    on<PullStateEvent>(_onActionPullState);
    on<ChangeThemePresetEvent>(_onActionChangeThemePreset);
    on<ChangeWeatherLevelEvent>(_onActionChangeWeatherLevel);
    on<ChangeWidgetModeEvent>(_onActionChangeWidgetMode);
  }

  Future<void> _onActionInit(InitEvent action, Emitter<AppState> emit) async {
    emit(state.copyWith(lastEvent: action));
  }

  Future<void> _onActionPullState(
      PullStateEvent action, Emitter<AppState> emit) async {
    emit(state);
  }

  Future<void> _onActionChangeThemePreset(
      ChangeThemePresetEvent action, Emitter<AppState> emit) async {
    ThemeData theme = ThemeData.light();

    switch (action.preset) {
      case ThemePreset.dark:
        theme = ThemeData.dark();
        break;
      case ThemePreset.light:
        theme = ThemeData.light();
        break;
      case ThemePreset.custom:
        const col1 = Color(0xFF2B2D42);
        const col2 = Color(0xFF967D69);
        const col3 = Color(0xFF087E8B);

        theme = FlexColorScheme.light(
          textTheme: TextTheme(
            labelLarge: ThemeData.light()
                .textTheme
                .labelLarge!
                .copyWith(letterSpacing: 0.3),
          ),
          colors: FlexSchemeColor.from(
            primary: col1,
            secondary: col2,
            tertiary: col3,
            brightness: Brightness.light,
          ),
        ).toTheme;
        break;
    }
    emit(state.copyWith(
        lastEvent: action, theme: theme, themePreset: action.preset));
  }

  Future<void> _onActionChangeWeatherLevel(
      ChangeWeatherLevelEvent action, Emitter<AppState> emit) async {
    emit(state.copyWith(weatherLevel: action.weatherLevel));
  }

  Future<void> _onActionChangeWidgetMode(
      ChangeWidgetModeEvent action, Emitter<AppState> emit) async {
    emit(state.copyWith(lastEvent: action, widgetMode: action.newMode));
  }
}

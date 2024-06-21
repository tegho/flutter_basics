import 'package:flutter/material.dart';
import '/business/state.dart';

@immutable
abstract class BaseEvent {}

class InitEvent extends BaseEvent {}

class PullStateEvent extends BaseEvent {}

class ChangeThemePresetEvent extends BaseEvent {
  final ThemePreset preset;

  ChangeThemePresetEvent({required this.preset});
}

class ChangeWeatherLevelEvent extends BaseEvent {
  final double weatherLevel;

  ChangeWeatherLevelEvent({required this.weatherLevel});
}

class ChangeWidgetModeEvent extends BaseEvent {
  final WeatherWidgetMode newMode;

  ChangeWidgetModeEvent({required this.newMode});
}

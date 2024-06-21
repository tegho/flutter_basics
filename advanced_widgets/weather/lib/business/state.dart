import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/business/actions.dart';

part 'state.freezed.dart';

enum ThemePreset { light, dark, custom }

enum WeatherWidgetMode { big, small }

@freezed
class AppState with _$AppState {
  const factory AppState({
    BaseEvent? lastEvent,
    required ThemePreset themePreset,
    required ThemeData theme,
    required double weatherLevel,
    required WeatherWidgetMode widgetMode,
  }) = _AppState;

// factory AppState.fromJson(Map<String, Object?> json) =>
//     _$AppState(json);
}

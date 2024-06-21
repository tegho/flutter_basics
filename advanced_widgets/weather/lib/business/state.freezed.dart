// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  BaseEvent? get lastEvent => throw _privateConstructorUsedError;
  ThemePreset get themePreset => throw _privateConstructorUsedError;
  ThemeData get theme => throw _privateConstructorUsedError;
  double get weatherLevel => throw _privateConstructorUsedError;
  WeatherWidgetMode get widgetMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {BaseEvent? lastEvent,
      ThemePreset themePreset,
      ThemeData theme,
      double weatherLevel,
      WeatherWidgetMode widgetMode});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastEvent = freezed,
    Object? themePreset = null,
    Object? theme = null,
    Object? weatherLevel = null,
    Object? widgetMode = null,
  }) {
    return _then(_value.copyWith(
      lastEvent: freezed == lastEvent
          ? _value.lastEvent
          : lastEvent // ignore: cast_nullable_to_non_nullable
              as BaseEvent?,
      themePreset: null == themePreset
          ? _value.themePreset
          : themePreset // ignore: cast_nullable_to_non_nullable
              as ThemePreset,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      weatherLevel: null == weatherLevel
          ? _value.weatherLevel
          : weatherLevel // ignore: cast_nullable_to_non_nullable
              as double,
      widgetMode: null == widgetMode
          ? _value.widgetMode
          : widgetMode // ignore: cast_nullable_to_non_nullable
              as WeatherWidgetMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseEvent? lastEvent,
      ThemePreset themePreset,
      ThemeData theme,
      double weatherLevel,
      WeatherWidgetMode widgetMode});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastEvent = freezed,
    Object? themePreset = null,
    Object? theme = null,
    Object? weatherLevel = null,
    Object? widgetMode = null,
  }) {
    return _then(_$_AppState(
      lastEvent: freezed == lastEvent
          ? _value.lastEvent
          : lastEvent // ignore: cast_nullable_to_non_nullable
              as BaseEvent?,
      themePreset: null == themePreset
          ? _value.themePreset
          : themePreset // ignore: cast_nullable_to_non_nullable
              as ThemePreset,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      weatherLevel: null == weatherLevel
          ? _value.weatherLevel
          : weatherLevel // ignore: cast_nullable_to_non_nullable
              as double,
      widgetMode: null == widgetMode
          ? _value.widgetMode
          : widgetMode // ignore: cast_nullable_to_non_nullable
              as WeatherWidgetMode,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {this.lastEvent,
      required this.themePreset,
      required this.theme,
      required this.weatherLevel,
      required this.widgetMode});

  @override
  final BaseEvent? lastEvent;
  @override
  final ThemePreset themePreset;
  @override
  final ThemeData theme;
  @override
  final double weatherLevel;
  @override
  final WeatherWidgetMode widgetMode;

  @override
  String toString() {
    return 'AppState(lastEvent: $lastEvent, themePreset: $themePreset, theme: $theme, weatherLevel: $weatherLevel, widgetMode: $widgetMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.lastEvent, lastEvent) ||
                other.lastEvent == lastEvent) &&
            (identical(other.themePreset, themePreset) ||
                other.themePreset == themePreset) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.weatherLevel, weatherLevel) ||
                other.weatherLevel == weatherLevel) &&
            (identical(other.widgetMode, widgetMode) ||
                other.widgetMode == widgetMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, lastEvent, themePreset, theme, weatherLevel, widgetMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final BaseEvent? lastEvent,
      required final ThemePreset themePreset,
      required final ThemeData theme,
      required final double weatherLevel,
      required final WeatherWidgetMode widgetMode}) = _$_AppState;

  @override
  BaseEvent? get lastEvent;
  @override
  ThemePreset get themePreset;
  @override
  ThemeData get theme;
  @override
  double get weatherLevel;
  @override
  WeatherWidgetMode get widgetMode;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationData {
  int get position => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call({int position, String locationName});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? locationName = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationDataCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$_LocationDataCopyWith(
          _$_LocationData value, $Res Function(_$_LocationData) then) =
      __$$_LocationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, String locationName});
}

/// @nodoc
class __$$_LocationDataCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$_LocationData>
    implements _$$_LocationDataCopyWith<$Res> {
  __$$_LocationDataCopyWithImpl(
      _$_LocationData _value, $Res Function(_$_LocationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? locationName = null,
  }) {
    return _then(_$_LocationData(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationData implements _LocationData {
  const _$_LocationData({required this.position, required this.locationName});

  @override
  final int position;
  @override
  final String locationName;

  @override
  String toString() {
    return 'LocationData(position: $position, locationName: $locationName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationData &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, locationName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      __$$_LocationDataCopyWithImpl<_$_LocationData>(this, _$identity);
}

abstract class _LocationData implements LocationData {
  const factory _LocationData(
      {required final int position,
      required final String locationName}) = _$_LocationData;

  @override
  int get position;
  @override
  String get locationName;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

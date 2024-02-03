import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';

@freezed
class LocationData with _$LocationData {
  const factory LocationData({
    required int position,
    required String locationName,
  }) = _LocationData;
}

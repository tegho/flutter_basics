import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';
import 'dart:math';

import 'package:module_model/module_model.dart';

@LazySingleton(as: DataService)
class DataServiceLocal implements DataService {
  late final Random rnd;

  DataServiceLocal() {
    rnd = Random();
  }

  @override
  Future<LocationData> getMyLocation() async {
    await Future<dynamic>.delayed(Duration(seconds: rnd.nextInt(4) + 1));

    return LocationData(
      position: rnd.nextInt(300),
      locationName: 'Unknown',
    );
  }

  @override
  Future<LocationData> getHisLocation() async {
    await Future<dynamic>.delayed(Duration(seconds: rnd.nextInt(4) + 1));

    return LocationData(
      position: rnd.nextInt(300),
      locationName: 'Unknown',
    );
  }
}

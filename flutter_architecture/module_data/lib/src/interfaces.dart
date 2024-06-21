import 'package:module_model/module_model.dart';

abstract class DataService {
  Future<LocationData> getMyLocation();

  Future<LocationData> getHisLocation();
}

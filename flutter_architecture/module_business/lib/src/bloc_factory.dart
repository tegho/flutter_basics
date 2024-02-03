import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module_business/src/bloc_factory.config.dart';

import 'package:module_data/module_data.dart';

@InjectableInit()
void blocFactoryInit() {
  serviceProviderInit();
  GetIt.I.init();
}

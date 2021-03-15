import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class Globals {
  dynamic modelInstance;
}

void setUpLocator() {
  locator.registerLazySingleton(() => Globals());
}

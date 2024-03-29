import 'package:get_it/get_it.dart';
import 'core/services/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

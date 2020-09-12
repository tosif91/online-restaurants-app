import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vegdaily/services/atuhentication.dart';
import 'package:vegdaily/services/local_storage.dart';


GetIt locator=GetIt.instance;

setUpLocator(){
  //stacked service..
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
//services
  locator.registerLazySingleton(() => Authentication());
  locator.registerLazySingleton(() => LocalStorage());

 
}

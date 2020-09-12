import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart ' as path_provider;

class LocalStorage {
  Future initHive() async {
    final getappDocumentDirectory =
        //get path for hive
        await path_provider.getApplicationDocumentsDirectory();
    //intiliase hive.
    Hive.init(getappDocumentDirectory.path);
  }

  Future<bool> checkOnBoardingDone() async {
    return await Hive.openBox('userinfo').then((value) async {
      if (value.get('visit') == 1)
        return true;
      else {
        value.close();
        return false;
      }
    });
  }

  Future<bool> updateOnboardingStatus() async {
    return await Hive.openBox('userinfo').then((value) async {
      return await value
          .put('visit', 1)
          .then((value) => true)
          .catchError((onError) => false);
    });
  }
}

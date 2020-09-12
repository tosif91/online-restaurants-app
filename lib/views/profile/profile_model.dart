import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/atuhentication.dart';
import 'package:vegdaily/utils/routes.dart';

class ProfileModel extends BaseViewModel{
NavigationService _navigationService=locator<NavigationService>();
Authentication _authentication=locator<Authentication>();
  signOut( )async{
    setBusy(true);
    await _authentication.signOut();
    setBusy(false);
    await _navigationService.pushNamedAndRemoveUntil(login);
  }
}
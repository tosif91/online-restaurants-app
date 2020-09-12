
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/atuhentication.dart';
import 'package:vegdaily/services/local_storage.dart';
import 'package:vegdaily/utils/routes.dart';
class SplashModel extends BaseViewModel {
 
 final NavigationService _navigation=locator<NavigationService>();
 final Authentication _auth=locator<Authentication>();
 final LocalStorage _storage=locator<LocalStorage>();
  
  ifUser()async{
   await _storage.initHive();
   bool status=await _storage.checkOnBoardingDone();
   print("$status  local storage");
   if(status)
   {
   if( _auth.checkUser() )
   _navigation.pushNamedAndRemoveUntil(home);
  else
  _navigation.pushNamedAndRemoveUntil(login) ;
   }
   else
   _navigation.pushNamedAndRemoveUntil(onboarding);
  }
}

import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/local_storage.dart';
import 'package:vegdaily/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
class OnBoardingModel extends BaseViewModel{

final NavigationService _navigationService=locator<NavigationService>();
 final LocalStorage _storage=locator<LocalStorage>();

final PageController _controller;
OnBoardingModel(this._controller){
   _controller.addListener(() {
      _offset = _controller.offset;
      _page = _controller.page;
      notifyListeners();
    });
}
  double _offset = 0.0;
  double get offset => _offset;
  double _page = 0;
  double get page => _page;

onBoardingCompleted()async{
bool status =await _storage.updateOnboardingStatus();
print('$status don..');
if(status)
_navigationService.pushNamedAndRemoveUntil(login);
else
print('erorr while updating');
}


}
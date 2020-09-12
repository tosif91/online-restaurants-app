import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/atuhentication.dart';
import 'package:vegdaily/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:email_validator/email_validator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends BaseViewModel {
  Authentication _authentication = locator<Authentication>();
  DialogService _dialogService = locator<DialogService>();
  NavigationService _navigationService=locator<NavigationService>();
  //handling focus on text field
  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  validateEmail(String email) =>
      EmailValidator.validate(email) ? null : 'email address is not valid';
  
  Future<void> handleLogIn(
      String email, String password, BuildContext context) async {
    //use to hide keyboard from focus state
    FocusScope.of(context).requestFocus(FocusNode());
    setBusy(true);

      var result = await _authentication.logInUser(email, password);
      if (result is bool) {
       if(result)
        _navigationService.pushNamedAndRemoveUntil(home);
       else
       print('sime................');      
      } else
        handleException(result);
     
  }
  signUpView()async{
   await _navigationService.navigateTo(signup);
  }
  handleException(var error) async {
   // await _authentication.signOut();
    setBusy(false);
  await _dialogService.showDialog(
        title: 'login failed',
        description:error,
        );
  }
}

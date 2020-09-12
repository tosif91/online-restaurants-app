
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:email_validator/email_validator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/atuhentication.dart';
import 'package:vegdaily/utils/routes.dart';

class SignupModel extends BaseViewModel {
  Authentication _authentication = locator<Authentication>();
  DialogService _dialogService = locator<DialogService>();
  NavigationService _navigationService = locator<NavigationService>();

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  validateEmail(String email) =>
      EmailValidator.validate(email) ? null : 'email address is not valid';
  validateConfirmPassword(String value, passwordConfirmation) =>
      value == passwordConfirmation ? null : 'password didnt matches';

  validatePassword(String password) {
    Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(password))
      return 'invalid password';
    else
      return null;
  }

  validateName(String name) {
    Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(name))
      return 'invalid username';
    else
      return null;
  }

  Future<void> handleRegistration(
     String email, String password, BuildContext context) async {
    setBusy(true);

    try {
      var authResult =
          await _authentication.registerUser(email, password);
      if (authResult is UserCredential) {
        _navigationService.pushNamedAndRemoveUntil(home);
        } else
        handleException( authResult);
    } catch (e) {
      handleException(e);
    }
  } //handlerRegistration

  handleException(var error) async {
    await _authentication.signOut();
    setBusy(false);

    _dialogService.showDialog(
        title: 'signup failed',
        description: (error is PlatformException)
            ? error.message
            : 'something went wrong',
      );
  }

  handleBack()async{
    await _navigationService.pushNamedAndRemoveUntil(login);
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegdaily/locator.dart';
import 'package:vegdaily/services/local_storage.dart';
import 'package:flutter/services.dart';
enum authProblems { UserNotFound, PasswordNotValid, NetworkError }
class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalStorage _storage = locator<LocalStorage>();

  bool checkUser() => _auth.currentUser != null;

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      print('logOut...');
    } catch (e) {
      print(e);
      //handle ui intergration
    }
  }

  Future logInUser(String email, String password) async {
  
  try{        final User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
   return user!=null;
  }catch(e){
  return e.message;
  }
    
  }

  Future<dynamic> registerUser(
      String myemail, String password) async {
    try {
      var _result = await _auth.createUserWithEmailAndPassword(
          email: myemail, password: password);
      return _result;
    } catch (e) {
     
  authProblems errorType;
  if (Platform.isAndroid) {
    switch (e.message) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        errorType = authProblems.UserNotFound;
        break;
      case 'The password is invalid or the user does not have a password.':
        errorType = authProblems.PasswordNotValid;
        break;
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        errorType = authProblems.NetworkError;
        break;
      // ...
      default:
        print('Case ${e.message} is not yet implemented');
    }
  } else if (Platform.isIOS) {
    switch (e.code) {
      case 'Error 17011':
        errorType = authProblems.UserNotFound;
        break;
      case 'Error 17009':
        errorType = authProblems.PasswordNotValid;
        break;
      case 'Error 17020':
        errorType = authProblems.NetworkError;
        break;
      // ...
      default:
        print('Case ${e.message} is not yet implemented');
    }
    }

    return errorType;
  }
}
}
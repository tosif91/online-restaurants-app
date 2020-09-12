
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegdaily/utils/routes.dart';
import 'package:vegdaily/views/home/home.dart';
import 'package:vegdaily/views/login/login.dart';
import 'package:vegdaily/views/onboarding/onboarding.dart';
import 'package:vegdaily/views/signup/signup.dart';

class Routers{

static Route<dynamic> toGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case home:
    return MaterialPageRoute(builder: (context)=>Home());
    case login:
    return MaterialPageRoute(builder: (context)=>LogIn());
    case signup:
    return MaterialPageRoute(builder: (context)=>SignUp());
    case onboarding:
    return MaterialPageRoute(builder: (context)=>Onboarding());
    // case chat_history_screen:
    // return MaterialPageRoute(builder: (context)=>ChatHistoryView());
    // case splash_screen:
    // return MaterialPageRoute(builder: (context)=>SplashView());
    
    
    default:
    return MaterialPageRoute(builder: (context)=>Container(
      alignment: Alignment.center,
      child:Text('Invalid Route'),
      ));
    }//switch
  }
}

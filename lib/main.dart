
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vegdaily/locator.dart';
import 'package:vegdaily/routers.dart';
import 'package:vegdaily/views/splash/splash.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      
  debugShowCheckedModeBanner: false,// user to remove debug manner
    //theme: ThemeData.dark(),
    home: Splash(),
navigatorKey: locator<NavigationService>().navigatorKey,
onGenerateRoute: Routers.toGenerateRoute,
      
    );
  }
}
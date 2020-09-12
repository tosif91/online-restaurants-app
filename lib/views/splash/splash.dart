
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:vegdaily/views/splash/splash_model.dart';
class Splash extends StatelessWidget{
  final SplashModel _model= SplashModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(

                      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            SizedBox(height:100.0),
            TypewriterAnimatedTextKit(isRepeatingAnimation: false,
            speed: Duration(milliseconds:700),
    onTap: () {
        print("Tap Event");
      },
    text: ['Fleksa'],
    textStyle: TextStyle(
      letterSpacing: 1.5,
        fontSize: 25.0,
        fontFamily: 'vibes',
        color:Color(0xff243e63),
        fontWeight: FontWeight.bold
    ),
    onFinished: ()=>_model.ifUser(),
    textAlign: TextAlign.start,
    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
  ), 
              Image.asset('assets/gifs/delivery.gif',width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/3),
            ],
        ),
      ),
          ),
    );
  }
}
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  OnBoardingModel model;

  Page1({@required this.model});

  @override
  Widget build(BuildContext context) {





    return Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [page1Color, page2Color])),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IgnorePointer(
            child: Image.asset(
          'assets/images/page1.png',
          
        )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Send us your Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: headingColor),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Set up a demo with us and share your menu and restaurant details. We build everything you need to go digital.',
                style: TextStyle(fontFamily: 'vibes',color: subheadingColor, fontSize: 18),
              ),
            ),
          ],
        ));
  }
}

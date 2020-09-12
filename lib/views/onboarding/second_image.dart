import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
class SecondImage extends StatelessWidget {
   final OnBoardingModel model;
  SecondImage({@required this.model});
  @override
  Widget build(BuildContext context) {
    return      Positioned(
        top: 150.0,
        height: 250,
          left:   MediaQuery.of(context).size.width - 0.85 * model.offset,
        
        width: MediaQuery.of(context).size.width * 1.6,
        child: IgnorePointer(child: Image.asset('assets/images/page2.png')));
  }
}
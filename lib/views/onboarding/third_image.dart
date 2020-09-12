import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
class ThirdImage extends StatelessWidget {
   final OnBoardingModel model;
  ThirdImage({@required this.model});
  @override
  Widget build(BuildContext context) {
       return Positioned(
        top: MediaQuery.of(context).size.height,
        height: 200,
          left:  MediaQuery.of(context).size.width - 0.85 * model.offset, 
        
        child: IgnorePointer(child: Image.asset('assets/images/page3.png')));
  }
}
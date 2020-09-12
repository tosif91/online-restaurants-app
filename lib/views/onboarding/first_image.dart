import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';

class FirstImage extends StatelessWidget {
  final OnBoardingModel model;
  FirstImage({@required this.model});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (model.page == 1)
            ? 0
            : -0.85 * model.offset,
        top: 200,
        child: IgnorePointer(
            child: Image.asset(
          'assets/images/page1.png',
          
        )));
  }
}

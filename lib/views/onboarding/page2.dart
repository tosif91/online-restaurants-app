import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  OnBoardingModel model;

  Page2({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: page2Color,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IgnorePointer(
                child: Image.asset(
              'assets/images/page2.png',
            )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Get your Online Ordering system',
                style: TextStyle(
                    color: headingColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'We generate a unique landing page and a specialized link connected to the restaurant’s order management system.',
                style: TextStyle(fontFamily: 'vibes',color: subheadingColor,  fontSize: 18),
              ),
            ),
          ],
        ));
  }
}

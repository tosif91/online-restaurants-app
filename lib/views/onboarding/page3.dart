import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  OnBoardingModel model;

  Page3({@required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: page3Color,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IgnorePointer(
                child: Image.asset(
              'assets/images/page3.png',
            )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Start taking orders',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: headingColor),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'You start receiving orders through the platform, manage take out, in-house dining, and delivery the way you want it.',
                style: TextStyle(
                    color: subheadingColor, fontFamily: 'vibes', fontSize: 18),
              ),
            ),
           SizedBox(height:20),
            //add begin widget
            InkWell(onTap: ()=>model.onBoardingCompleted(),
                          child: Container(alignment: Alignment.center,
                child: Text("let's begin",style: TextStyle(color:Colors.white),),
                height: 30,
                          width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlue[100],
                              blurRadius: 10, // soften the shadow
                              spreadRadius: -20, //end the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                10.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                ),
            ),
            
          ],
        ));
  }
}

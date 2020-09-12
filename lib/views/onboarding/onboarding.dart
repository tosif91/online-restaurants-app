import 'package:vegdaily/locator.dart';
import 'package:vegdaily/views/onboarding/first_image.dart';
import 'package:vegdaily/views/onboarding/page1.dart';
import 'package:vegdaily/views/onboarding/page2.dart';
import 'package:vegdaily/views/onboarding/page3.dart';
import 'package:vegdaily/views/onboarding/second_image.dart';
import 'package:vegdaily/views/onboarding/third_image.dart';
import 'package:vegdaily/widgets/circle_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vegdaily/views/onboarding/onboarding_model.dart';

class Onboarding extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
          viewModelBuilder: ()=>OnBoardingModel(_pageController),
          
          builder:(contex,model,_)=>Scaffold(
            body: SafeArea(
               child: Stack(
            children: [
              PageView(
                controller: _pageController,
                 physics: ClampingScrollPhysics(),
                children: <Widget>[
              //give pages here .
                Page1(model:model ),
                Page2(model: model,),
                Page3(model: model,),
                ],
              ),
      Positioned(
        bottom: 10,
        right: 0,
        left: 0,
              child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < 3; i++)
              if (i == model.page) ...[CircleBar(true)] else
                CircleBar(false),
          ],
        ),
      ),
    
            
            ],
          ),
            )
      ),
    );
  }
}
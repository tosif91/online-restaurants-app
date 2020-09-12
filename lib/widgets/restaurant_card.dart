import 'package:flutter/material.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/widgets/discount.dart';
import 'package:vegdaily/widgets/star_display.dart';

class RestaurentCard extends StatelessWidget {
  final int index;

  RestaurentCard({this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: loginBackgroundColor,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  (index&2 ==0 )?Image.asset('assets/res_images/image2.jpg'):Image.asset('assets/res_images/image7.jpg'),
                  Positioned(
                    bottom: 5,
                    right: 7,
                    child: Discount()),
                ],
              )),
              ListTile(contentPadding: EdgeInsets.all(0),
                title: Text('Bay View Cafe',style: TextStyle(fontSize: 14.0,color: buttonHoverColor),),
                
                 dense: true,
                  trailing: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Icon(Icons.favorite_border,color: buttonHoverColor,),
                  ), 
                 subtitle: Text('Cafe | Western Food | Western',style: TextStyle(fontSize: 10.0)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
                children: [
                  StarDisplay(value: 3,),
                   Text('(650 Reviews)',style: TextStyle(fontSize: 9.0,color: buttonHoverColor),),
                   ],
              ),
              Text(' Delivery Time: 20-30Mins',style: TextStyle(fontSize: 8.0,color: buttonHoverColor),)
          ],
        ),
      ),
    );
  }
}
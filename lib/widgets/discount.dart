import 'package:flutter/material.dart';
import 'package:vegdaily/utils/colors.dart';

class Discount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        color: buttonHoverColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: <Widget>[
            SizedBox(width:4.0),
            Icon(Icons.verified,color: Colors.white,size: 15.0,),
            SizedBox(width:4.0),
            Text('15%',style:TextStyle(color: Colors.white,fontSize: 10.0,fontWeight: FontWeight.bold)),
            SizedBox(width:4.0),
          ],),
        ),
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/widgets/star_display.dart';

class SearchCard extends StatelessWidget {
  SearchCard({this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        color: loginBackgroundColor,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
         mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width/3.5,
             decoration: BoxDecoration( image:DecorationImage(
                      image:(index % 2 ==0)?AssetImage('assets/res_images/image2.jpg'):AssetImage('assets/res_images/image5.jpg'),
                      fit: BoxFit.cover
                      
                    )),
             ),
            ),
          ),
         
//ljk
     Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
         children: [
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
         ],
       ),
     ),
             



//lkjh


                 ],),
      ),
      
    );
  }
}
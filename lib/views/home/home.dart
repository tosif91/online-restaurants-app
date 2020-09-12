import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/home/home_page.dart';
import 'package:vegdaily/views/home/home_model.dart';
import 'package:vegdaily/views/profile/profile.dart';
import 'package:vegdaily/views/search/search.dart';
import 'package:vegdaily/views/tag/tag.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeModel(controller: _controller),
      builder: (context, model, child) => Scaffold(

          //appbar

          //body part
          body: PageView(
            controller: _controller,
            children: <Widget>[
              HomePage(
                model: model,
              ),
              Search(),
              Tag(),
              Profile(),
            ],
          ),

          //bottom  part
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            
            color: loginBackgroundColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () => model.onItemTapped(0),
                  icon: Icon(Icons.home_outlined,
                      size: 30.0,
                      color: (model.selectedIndex == 0)
                          ? buttonHoverColor
                          : Colors.grey),
                ),
                IconButton(
                    onPressed: () => model.onItemTapped(1),
                    icon: Icon(Icons.search_outlined,
                        size: 30.0,
                        color: (model.selectedIndex == 1)
                            ? buttonHoverColor
                            : Colors.grey)),
                IconButton(
                  onPressed: () => model.onItemTapped(2),
                  icon: Icon(Icons.bookmark_border,
                      size: 30.0,
                      color: (model.selectedIndex == 2)
                          ? buttonHoverColor
                          : Colors.grey),
                ),
                IconButton(
                  onPressed: () => model.onItemTapped(3),
                  icon: Icon(Icons.person_outline_outlined,
                      size: 30.0,
                      color: (model.selectedIndex == 3)
                          ? buttonHoverColor
                          : Colors.grey),
                ),
              ],
            ),
          )),
    );
  }
}

// BottomNavigationBar(
//           elevation: 0,
//          backgroundColor: loginBackgroundColor,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,

//            type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(

//                 icon: Icon(Icons.home_outlined,size: 25.0,),
//                 title: Text('')),
//             BottomNavigationBarItem(

//                 icon: Icon(Icons.search_outlined,size: 25.0,),
//                 title: Text('')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.tag,size: 25.0,),
//                 title: Text('')),
//                 BottomNavigationBarItem(
//                 icon: Icon(Icons.person_outline_outlined,size: 25.0,),
//                 title: Text('')),

//           ],

//             currentIndex: model.selectedIndex,
//           fixedColor: Colors.black,
//           onTap: model.onItemTapped,
//         ),

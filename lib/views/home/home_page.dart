import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/home/home_model.dart';

import 'package:flutter/material.dart';
import 'package:vegdaily/widgets/restaurent_card.dart';

class HomePage extends StatefulWidget {
  final HomeModel model;
  HomePage({this.model});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  void appBarStatus(bool status) {
    setState(() {
      _isAppbar = status;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        appBarStatus(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 5),
          child: AnimatedContainer(
            height: _isAppbar ? MediaQuery.of(context).size.height / 5 : 0.0,
            duration: Duration(milliseconds: 200),
            child: HeadBar(model: widget.model),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: 10,
            itemBuilder: (context, index) => (index==0)
            ?Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image:AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover
                    
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                    
                     Padding(
                       padding: const EdgeInsets.only(left:8.0),
                       child: Column(mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                         children: [
                           Text('Get 10% offer',style:TextStyle(color: Colors.white,fontSize: 11.0)),
                           Text('for your next order now.',style:TextStyle(color: Colors.white,fontSize: 7.0))
                         ],
                       ),
                     ),
                     Icon(Icons.arrow_forward,color: Colors.white,)
                    ],),
                ),
              ),),
            )
            :RestaurentCard(index:index)),
      ),
    );
  }

  @override
  Ticker createTicker(void Function(Duration elapsed) onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}

class HeadBar extends StatelessWidget {
  HomeModel model;
  HeadBar({this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: loginBackgroundColor,
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Unit 10 2F, 123 Frankfurt',
                      style: TextStyle(fontSize: 8, color: basicColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: basicColor,
                    )
                  ],
                ),
                InkWell(
                  onTap: () => model.onItemTapped(1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: searchColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            )),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 1.2,
                              color: searchColor,
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20,
                                    color: basicColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'search',
                                    style: TextStyle(
                                        fontSize: 10, color: loginTextColor),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.filter_list,
                        color: basicColor,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

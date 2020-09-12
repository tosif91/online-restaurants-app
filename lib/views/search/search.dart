import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:vegdaily/utils/colors.dart';
import 'package:vegdaily/views/home/home_model.dart';

import 'package:flutter/material.dart';
import 'package:vegdaily/views/search/search_model.dart';
import 'package:vegdaily/widgets/restaurent_card.dart';
import 'package:vegdaily/widgets/search_card.dart';

class Search extends StatefulWidget {
  final SearchModel model;
  Search({this.model});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>
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
              Size.fromHeight(MediaQuery.of(context).size.height / 3.4),
          child: AnimatedContainer(
            height: _isAppbar ? MediaQuery.of(context).size.height / 3.4 : 0.0,
            duration: Duration(milliseconds: 200),
            child: SearchBar(model: widget.model),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: 10,
            itemBuilder: (context, index) => SearchCard(index: index,)
            
            ),
      ),
    );
  }

  @override
  Ticker createTicker(void Function(Duration elapsed) onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}


class SearchBar extends StatelessWidget {
  final SearchModel model;
  SearchBar({this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(

                  image:DecorationImage(
                    image:AssetImage('assets/res_images/image7.jpg'),
                    fit: BoxFit.cover
                    
                  )
                ),
    );
  }
}

import 'package:vegdaily/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeModel extends BaseViewModel {
  
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();

  
  int _selectedIndex = 0;
  double _page;
  double _offset;

  double get offset => _offset;
  double get page => _page;
  int get selectedIndex => _selectedIndex;
  final PageController controller;
  HomeModel({@required this.controller}) {
    controller.addListener(() {
      _offset = controller.offset;
      _page = controller.page;
      _selectedIndex = _page.toInt();
      notifyListeners();
    });
  }

 

  onItemTapped(int index) {
    _selectedIndex = index;
    controller.jumpToPage(index);
    notifyListeners();
  }


}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool selectedFav = false;
  bool selectedCategoryIcon = false;

  double chooseWidth(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  double chooseHeight(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  void selectedFavItemFunc() {
    selectedFav = !selectedFav;
    print('hello');
    notifyListeners();
  }


  void selectedCategoryFunc() {
    selectedCategoryIcon = !selectedCategoryIcon;
    print('hello');
    notifyListeners();
  }
}

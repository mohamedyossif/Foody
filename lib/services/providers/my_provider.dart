import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool selectedFav = false;
  bool selectedCategoryIcon = false;
  int _currentIndex = 0;
  bool isSearch = true;
  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  double chooseWidth(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  double chooseHeight(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }
  void isTrue() {
    isSearch = true;
    notifyListeners();
  }

  void isFalse() {
    isSearch = false;
    notifyListeners();
  }
}

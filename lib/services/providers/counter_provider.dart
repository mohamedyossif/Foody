import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
class CounterProvider extends ChangeNotifier {
  int itemCount = 0;
  void add() {
    itemCount++;
    notifyListeners();
  }

  void remove() {
    itemCount--;
    itemCount<0?itemCount=0:  notifyListeners();

  }
  void reset()
  {
    itemCount=totalItems;
    notifyListeners();
  }
}
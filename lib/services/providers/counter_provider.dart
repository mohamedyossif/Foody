import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class CounterProvider extends ChangeNotifier {
  int itemCount = 0;
  void add() {
    itemCount++;
    totalItems++;
    notifyListeners();
  }

  void remove() {
    itemCount--;
    totalItems--;
    itemCount < 0 ? itemCount = 0 : notifyListeners();
  }

  void reset() {
    if (totalItems == 0) {
      itemCount = totalItems;
    }
    notifyListeners();
  }
}

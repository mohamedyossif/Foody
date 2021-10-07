import 'package:flutter/material.dart';

class HeightProvider extends ChangeNotifier {
  double height = 743;

  void moreHeight(context) {
    height = MediaQuery.of(context).size.height * 95 / 100 + 220;
    notifyListeners();
  }

  void lessHeight(context) {
    height = MediaQuery.of(context).size.height * 95 / 100;
    print(height);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class HeightProvider extends ChangeNotifier {
  double height = 575;

  void moreHeight(context) {
    height = MediaQuery.of(context).size.height * 75 / 100 + 290;
    print(height);

    notifyListeners();
  }
  void lessHeight(context) {
    height = MediaQuery.of(context).size.height * 84 / 100;

    print(height);
    notifyListeners();
  }
}

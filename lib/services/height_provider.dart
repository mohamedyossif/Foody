import 'package:flutter/material.dart';

class HeightProvider extends ChangeNotifier {
  double height = 650;

  void moreHeight(context) {
    height = MediaQuery.of(context).size.height * 75 / 100 + 300;
    print(height);

    notifyListeners();
  }

  void lessHeight(context) {
    height = MediaQuery.of(context).size.height * 83 / 100;
    print(height);
    notifyListeners();
  }
}

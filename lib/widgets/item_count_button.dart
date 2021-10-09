import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/constants.dart';

class ItemCountButton extends StatelessWidget {
  ItemCountButton({this.function, this.icon});
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: this.function,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Icon(
              this.icon,
              color: const Color(0xffF54749),
              size: 40,
            ),
          )),
    );
  }
}

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
}

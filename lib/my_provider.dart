import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier{
bool selectedFav = false;
void selectedFavItemFunc(){
  selectedFav =!selectedFav;
 print('hello');
  notifyListeners();
}

bool selectedCategoryIcon = false;
void selectedCategoryFunc(){
  selectedCategoryIcon =!selectedCategoryIcon;
 print('hello');
  notifyListeners();
}
}
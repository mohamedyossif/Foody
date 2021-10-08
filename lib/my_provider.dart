import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/food_list.dart';

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

  List <FoodList> _favoriteList = [];
  List<FoodList> get favoriteList =>_favoriteList;
  void addToFavorite(FoodList food){
    _favoriteList.add(food);
    notifyListeners();
  }
  void removeToFavorite(FoodList food){
    _favoriteList.remove(food);
    notifyListeners();
  }

  int selectedIndex = 2;
  onSelected(int index) {
    selectedIndex = index;
  }
}

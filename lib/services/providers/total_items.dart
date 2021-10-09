import 'package:flutter/material.dart';
class TotalItemsProvider extends ChangeNotifier
{
  int totalItems=0;

  void sumItems (int newItem)
  {
    totalItems+=newItem;
    notifyListeners();
  }
}
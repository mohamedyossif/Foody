import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/NavigatorBar/homeBottom.dart';
import 'package:food_app/screens/cart_Screen.dart';
import 'package:food_app/screens/profile_screen.dart';
import 'package:food_app/services/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../my_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  final bool selected = false;
  getUserName() async {
    usernameId = await SharedPreferencesDatabase.getUserNameKey();
  }

  @override
  Widget build(BuildContext context) {
    getUserName();
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: Scaffold(
          body: screensBar.elementAt(provider.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.currentIndex = index,
          )),
    );
  }

  List screensBar = [HomeBar(), CartScreen(), ProfileScreen()];
}

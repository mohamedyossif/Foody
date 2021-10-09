import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import '../services/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  final width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: searchDecoration,
      padding: EdgeInsets.all(10.0),
      height: 60.0,
      width: width,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            //   hoverColor:Colors.yellow,
            suffixIcon: Icon(
              Icons.search,
              color: basicColor,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'search your food'),
        keyboardType: TextInputType.text,
        autofocus: false,
        cursorColor: basicColor,
        onChanged: (value) {
          if (value.isEmpty) {
            Provider.of<MyProvider>(context, listen: false).isTrue();
          } else {
            Provider.of<MyProvider>(context, listen: false).isFalse();
          }
          searchId = value;
        },
        style: TextStyle(color: basicColor),
      ),
    );
  }
}

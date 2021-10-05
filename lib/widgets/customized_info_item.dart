import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/constants.dart';

class CustomizedInfoItem extends StatelessWidget {
  String label;
  IconData icon;

  CustomizedInfoItem({this.icon, this.label});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListTile(
          dense: false,
          onTap: () {},
          leading: Icon(icon, color: basicColor,),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          title: Text(label),
        ),
      ),
    );
  }
}

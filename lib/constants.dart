
import 'package:flutter/material.dart';
import 'package:food_app/services/dataBase.dart';

///
String usernameId='';
String searchId='';
bool isSearch=true;
FireStoreDatabaseMethods fireStoreDatabaseMethods=FireStoreDatabaseMethods();
Color basicColor = Color(0xffD4361C);
Color secondaryColor = Color(0xfffbbc10);
BoxDecoration searchDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: Colors.grey.shade200,
);

TextStyle kTextTitleDecoration = TextStyle(fontSize: 40.0);
TextStyle kWelcomText =
    TextStyle(color: const Color(0xff040404), fontSize: 50, fontWeight: FontWeight.w700);

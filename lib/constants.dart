import 'package:flutter/material.dart';
import 'package:food_app/services/auth_firebase.dart';
import 'package:food_app/services/dataBase.dart';

String usernameId = '';
String searchId = '';
String addressId='';
int totalItems = 0;
double totalPrice = 0.0;
int count = 0;
FireStoreDatabaseMethods fireStoreDatabaseMethods = FireStoreDatabaseMethods();
AuthFirebaseMethods authFirebaseMethods = AuthFirebaseMethods();
Color basicColor = Color(0xffD4361C);
Color secondaryColor = Color(0xfffbbc10);
Color priceColor= Color(0xff64941b);
BoxDecoration searchDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: Colors.grey.shade200,
);
TextStyle kTextTitleDecoration2 =
    TextStyle(fontWeight: FontWeight.w500, color: basicColor, fontSize: 40.0);
TextStyle kTextTitleDecoration1 = TextStyle(fontSize: 40.0);
TextStyle kWelcomText = TextStyle(
    color: const Color(0xff040404), fontSize: 50, fontWeight: FontWeight.w700);

BoxDecoration kContainerShadow = BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20),
      topLeft: Radius.circular(20),
    ),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0.0, 1.0), //(x,y)
        blurRadius: 6.0,
      ),
    ]);

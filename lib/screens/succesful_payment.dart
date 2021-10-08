import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/payment_screen.dart';

class SuccessPayment extends StatefulWidget {
  static const String id = 'SuccessPayment';

  @override
  _SuccessPaymentState createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, PaymentScreen.id);
              Navigator.pop(context, MaterialPageRoute(builder: (context) => PaymentScreen(total)));
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          'Success',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/images/delig.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Wohoo!, your order is being picked up by the courier',
              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffF54749),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 7), //(x,y)
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                "Track order",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            child: Text(
              'Back to shopping',
              style: TextStyle(
                color: Color(0xffFA9F15),
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

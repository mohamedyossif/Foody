import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/payment_screen.dart';
import 'package:food_app/widgets/custom_button.dart';

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
              Navigator.pop(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
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
          Image(image: AssetImage('assets/images/delir.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Wohoo!, your order is being picked up by the courier',
              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
            SizedBox(
              width: MediaQuery.of(context).size.width /1.5,
                child: CustomButton(text: 'Track Order', function:null )),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
            child: const Text(
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

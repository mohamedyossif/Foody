import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'NavigatoBottomBar/cart_Screen.dart';
import 'package:food_app/screens/succesful_payment.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';


  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  List<Map<String, dynamic>> cards = [
    {"isSelected": true},
    {"isSelected": false},
    {"isSelected": false},
  ];
  int _selectedCard = 0;

  _paymentCard({String img, int index, bool selected}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            cards[_selectedCard]['isSelected'] = false;
            _selectedCard = index;
            cards[_selectedCard]['isSelected'] = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: selected ? Colors.white : Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: selected ? Colors.black : Colors.transparent)),
          height: 40,
          width: 100,
          child: Center(
            child: Image(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
          title: Text(
            'Payment',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        //SingleChildScrollView
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 500,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0.0, 20), //(x,y)
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Image(
                      image: AssetImage("assets/images/myloc.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'My home',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          child: Text(
                            addressId,
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
            child: Text(
              'Payment method',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _paymentCard(
                  img: "assets/images/mastercard.png",
                  index: 0,
                  selected: cards[0]['isSelected'],
                ),
                _paymentCard(
                  img: "assets/images/paypal.png",
                  index: 1,
                  selected: cards[1]['isSelected'],
                ),
                _paymentCard(
                  img: "assets/images/venmo.png",
                  index: 2,
                  selected: cards[2]['isSelected'],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: kContainerShadow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40,
                    child: Center(
                      child: Divider(thickness: 4, color: Colors.grey.shade600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style:
                          TextStyle(fontSize: 30, color:priceColor,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child:  CustomButton(
                      text: "Pay Now",
                      function: () async {
                        fireStoreDatabaseMethods.deleteCartItem(usernameId);
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessPayment()));
                        setState(() {
                 totalPrice=0;
                 totalItems=0;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

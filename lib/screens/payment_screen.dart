import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/cart_Screen.dart';
import 'package:food_app/screens/succesful_payment.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'PaymentScreen';
  double total;

  PaymentScreen(this.total);

  @override
  _PaymentScreenState createState() => _PaymentScreenState(total);
}

class _PaymentScreenState extends State<PaymentScreen> {
  double total;

  _PaymentScreenState(this.total);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              Text(
                'Change',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15,
                ),
              ),
            ],
          ),
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
                            "SGT Miranda McAnderson 6543 N 9th Street APO, AA 33608-1234",
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0.0, -7), //(x,y)
                    blurRadius: 15,
                  ),
                ],
              ),
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
                          "Discount",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "\$ 0",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  //lineeee
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "\$${total.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () async{

                       await fireStoreDatabaseMethods.deleteCartItem(usernameId);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SuccessPayment()));

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        height: 55,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF54749),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0, 15), //(x,y)
                              blurRadius: 25,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "Pay now",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

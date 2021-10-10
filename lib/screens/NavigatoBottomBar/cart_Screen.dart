import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:food_app/screens/payment_screen.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/custom_food_card.dart';

import '../../constants.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int numOfOrder = 1;
  int items = 0;
  double total = 0;
  bool isSelected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
            future: fireStoreDatabaseMethods.getCart(usernameId),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FoodCard(
                        name: snapshot.data[index].data()['title'],
                        price: double.parse(snapshot.data[index].data()['price']),
                        img: snapshot.data[index].data()['image'],
                        countItem: int.parse(snapshot.data[index].data()['count']),
                      );
                    })
                : Center(
                    child: Container(),
                  ),
          )),
          Container(
            height: MediaQuery.of(context).size.height / 2,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total items",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "$totalItems",
                        style:
                            TextStyle(fontSize: 25, color: basicColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            TextStyle(fontSize: 30, color: priceColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: "Pay",
                  function: () async {
                    fireStoreDatabaseMethods.deleteCartItem(usernameId);
                    await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                    setState(() {
                      totalPrice = 0;
                      totalItems = 0;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

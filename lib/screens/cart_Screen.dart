import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';
import 'package:food_app/screens/payment_screen.dart';

import '../constants.dart';

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
  _foodCard({String name, double price, String img,int countItem}) {
//     items=countItem;
// SchedulerBinding.instance.addPostFrameCallback((_){
//   setState(() {
//   });
// });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.check_box_rounded,
            color: isSelected ? Colors.orange : Colors.transparent,
            size: 30,
          ),
          // ),
          // ),
          Container(
            padding: EdgeInsets.all(8.0),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 20), //(x,y)
                  blurRadius: 35,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 40 / 100,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF54749),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " \$$price",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff64941b)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 2 / 100-4,
                          ),
                          Text(
                            "${countItem.toString()} items",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
                      return  _foodCard(
                          name: snapshot.data[index].data()['title'],
                          price: double.parse(snapshot.data[index].data()['price']),
                          img: snapshot.data[index].data()['image'],
                          countItem: int.parse(snapshot.data[index].data()['count']),
                     
                        );
                    }
                        )
                : Center(
                    child: Container(),
                  ),
          )),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
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
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // _coupon(),
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
                      Text(
                        "Total items",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "$totalItems",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                //lineeee
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$ ${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20, color: Color(0xfffa9f15)),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () async {
                        fireStoreDatabaseMethods.deleteCartItem(usernameId);
                        await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => PaymentScreen(total)));
                        setState(() {
                          totalPrice=0;
                          totalItems=0;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 200,
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:food_app/screens/payment_screen.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int numOfOrder;
  double endPrice;
  double subTotal;
  double shipping;
  double total;

  _foodCard({String type, String name, double price, String img}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        type,
                        style: TextStyle(color: Color(0xfff54749)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " \$$price",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (numOfOrder >= 1) {
                                    numOfOrder--;
                                    subTotal = subTotal - price;
                                    total = subTotal + shipping;
                                    // endPrice = endPrice - price ;
                                    // price=endPrice;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: Color(0xffeef1f0),
                                  radius: 13,
                                  child: Center(
                                    child: Icon(Icons.remove, color: Colors.black, size: 13),
                                  )),
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 13,
                                child: Text(
                                  numOfOrder.toString(),
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                )),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (numOfOrder >= 0) {
                                    numOfOrder++;
                                    subTotal = subTotal + price;
                                    total = subTotal + shipping;
                                    // endPrice = endPrice+price;
                                    // price=endPrice;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 13,
                                  child: Center(
                                    child: Icon(Icons.add, color: Colors.white, size: 13),
                                  )),
                            ),
                          ],
                        ),
                      ],
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
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_horiz,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                // _foodCard(name: "Beef burger", type: "Beef burger", price: 9.90 , img: "https://top10cairo.com/wp-content/uploads/2020/01/Good-Stuff-Eatery-Best-Burger-Restaurants-in-Egypt.jpg"),
                _foodCard(
                    name: "Beef burger",
                    type: "combo Beef burger",
                    price: 9.90,
                    img:
                        "https://e7.pngegg.com/pngimages/339/456/png-clipart-mcdonald-s-combo-meal-mcdonald-s-chicken-mcnuggets-fizzy-drinks-mcdonald-s-big-mac-hamburger-coca-cola-mcdonalds-food-breakfast.png"),
                // _foodCard(name: "Beef burger", type: "Beef burger", price: 9.90 , img: "https://top10cairo.com/wp-content/uploads/2020/01/Good-Stuff-Eatery-Best-Burger-Restaurants-in-Egypt.jpg"),
              ],
            ),
          ),
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
                        "Sub total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$ ${subTotal.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20),
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
                        "Shipping",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$ $shipping",
                        style: TextStyle(fontSize: 20),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$ ${total.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20, color: Color(0xfffa9f15)),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => PaymentScreen(total)));
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

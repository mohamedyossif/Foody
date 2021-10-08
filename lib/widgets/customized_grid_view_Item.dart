import 'package:flutter/material.dart';
import 'package:food_app/model/food_list.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:provider/provider.dart';
import 'package:food_app/my_provider.dart';
import 'package:food_app/constants.dart';

class CustomizedGridViewItem extends StatelessWidget {
  String foodName, image;
  String price;
  List<dynamic> data;
  int index;

  CustomizedGridViewItem(
      {this.foodName, this.price, this.image, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Consumer<MyProvider>(
          builder: (_, value, child) => Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            width: Provider.of<MyProvider>(context).chooseWidth(context) / 1.5,
            height:
                Provider.of<MyProvider>(context).chooseHeight(context) /1 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade200,
            ),
            child: Column(

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ItemDetailsScreen.id);
                  },
                  child: Image(
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height/6.5,
                    width: MediaQuery.of(context).size.height/5,
                    image: NetworkImage(image),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(

                  height: MediaQuery.of(context).size.height/15,
                  child: Text(
                    '$foodName',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '20 min',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('⭐ 4.5'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        //=================================== price
        // //==================================================
        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Text(
            '\$$price',
            style: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

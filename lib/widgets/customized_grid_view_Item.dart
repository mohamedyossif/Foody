import 'package:flutter/material.dart';
import 'package:food_app/model/food_list.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:provider/provider.dart';
import 'package:food_app/my_provider.dart';
import 'package:food_app/constants.dart';

class CustomizedGridViewItem extends StatelessWidget {
  // String title;
  // Nutrition nutrition;
  String description;
  String foodName, image;
  String price;

  CustomizedGridViewItem({this.foodName, this.price, this.image, this.description
      // this.title, this.nutrition
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Consumer<MyProvider>(
          builder: (_, value, child) => Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            width: Provider.of<MyProvider>(context).chooseWidth(context) / 1.5,
            height: Provider.of<MyProvider>(context).chooseHeight(context) / 1.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemDetailsScreen(
                              foodName: foodName,
                              image: image,
                              price: price,
                              description: description
                              // title: title,
                              // nutrition: nutrition,
                              )),
                    );
                  },
                  child: Image(
                    fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                    image: NetworkImage(image),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$foodName',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 15.0,
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
        Consumer<MyProvider>(
          builder: (_, value, child) {
            return GestureDetector(
              onTap: () => Provider.of<MyProvider>(context, listen: false).selectedFavItemFunc(),
              child: Provider.of<MyProvider>(context, listen: false).selectedFav
                  ? Icon(
                      Icons.favorite,
                      color: basicColor,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: basicColor,
                    ),
            );
          },
        ),
        //============================================== plus icon
        //====================================================
        Positioned(
          bottom: 6.0,
          right: 1.0,
          child: Container(
            child: Center(
              child: Icon(
                Icons.add,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
              color: secondaryColor,
            ),
            width: 35.0,
            height: 25.0,
          ),
        ),
        //=================================== price
        // //==================================================
        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Text(
            '\$$price',
            style: TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

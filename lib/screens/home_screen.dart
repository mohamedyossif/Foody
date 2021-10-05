import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:food_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../my_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Find The ', style: kTextTitleDecoration),
                  TextSpan(
                    text: 'Best\nFood',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, color: basicColor, fontSize: 40.0),
                  ),
                  TextSpan(text: ' Around You!', style: kTextTitleDecoration),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SearchBar(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Find',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            //=========================================== select category
            //=========================================================
            GestureDetector(
              onTap: () => Provider.of<MyProvider>(context, listen: false).selectedCategoryFunc(),
              child: AnimatedContainer(
                duration: Duration(seconds: 10),
                height: 60.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        Provider.of<MyProvider>(context, listen: false).selectedCategoryFunc(),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(5, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                            color: Provider.of<MyProvider>(context).selectedCategoryIcon
                            ? secondaryColor
                            : Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(5.0),
                      width: width / 3.4,
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image(
                              height: 25.0,
                              width: 25.0,
                              image: AssetImage('assets/images/Icon_taco.png'),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('Burger',
                              style: TextStyle(
                                  color: Provider.of<MyProvider>(context).selectedCategoryIcon
                                      ? Colors.white
                                      : Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //=================================Grid View
            //=============================================
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              height: height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: GridView.builder(
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width / 2,
                      height: height / 1.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        children: [
                          Image(
                            height: 100.0,
                            width: 100.0,
                            image: AssetImage('assets/images/Icon_taco.png'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Beef Burger',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '20 min',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('⭐ 4.5'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<MyProvider>(
                      builder: (_, value, child) {
                        return GestureDetector(
                          onTap: () =>
                              Provider.of<MyProvider>(context, listen: false).selectedFavItemFunc(),
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
                    //==================================================
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: Text(
                        '\$12.00',
                        style: TextStyle(
                            color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

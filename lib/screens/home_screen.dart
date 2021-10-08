import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/model/food_list.dart';
import 'package:food_app/services/networking_api.dart';
import 'package:food_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../my_provider.dart';
import 'package:food_app/widgets/customized_grid_view_Item.dart';
import 'package:food_app/widgets/customized_category_item.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  final bool selected = false;

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.w500, color: basicColor, fontSize: 40.0),
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
          //=============================================== select category
          //=========================================================================
          GestureDetector(
            onTap: () => Provider.of<MyProvider>(context, listen: false).selectedCategoryFunc(),
            child: Container(
              height: 60.0,
              width: 300,
              child: FutureBuilder<List<FoodList>>(
                  future: NetworkingAPI.getData(),
                  builder: (context, snapshot) =>
                      snapshot.hasData ? CustomizedCategoryItem() : CircularProgressIndicator()),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //=================================================Grid View
          //====================================================================

          Consumer<MyProvider>(
            builder: (_, value, child) => Container(
              padding: EdgeInsets.only(bottom: 10.0),
              height: Provider.of<MyProvider>(context).chooseHeight(context),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: FutureBuilder<List<FoodList>>(
                  future: NetworkingAPI.getData(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? GridView.builder(
                          itemBuilder: (context, index) {
                            // String image = snapshot.data[index].image.toString();
                            return CustomizedGridViewItem(
                              foodName: snapshot.data[index].title.toString(),
                              image: snapshot.data[index].image.toString(),
                              price: snapshot.data[index].price.toStringAsFixed(2).toString(),
                              description: snapshot.data[index].description.toString(),
                              veryHealthy: snapshot.data[index].veryHealthy.toString(),
                              vegan: snapshot.data[index].vegan.toString(),
                              readyInMinutes: snapshot.data[index].readyInMinutes.toString(),
                              veryPopular: snapshot.data[index].veryPopular.toString(),
                            );
                          },
                          itemCount: 10,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                        )
                      : CircularProgressIndicator()),
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/model/food_list.dart';
import 'package:food_app/my_provider.dart';
import 'package:food_app/services/networking_api.dart';
import 'package:food_app/widgets/customized_grid_view_Item.dart';
import 'package:food_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Provider.of<MyProvider>(context).isSearch
            ? Consumer<MyProvider>(
                builder: (_, value, child) => Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  height: Provider.of<MyProvider>(context).chooseHeight(context),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: FutureBuilder<List<FoodList>>(
                      future: NetworkingAPI.getData('pizza'),
                      builder: (context, snapshot) => snapshot.hasData
                          ? GridView.builder(
                              shrinkWrap: true,
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
                              itemCount: snapshot.data.length,
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
            : FutureBuilder<List<FoodList>>(
                future: NetworkingAPI.getData(searchId),
                builder: (context, snapshot) => snapshot.hasData
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                      )
                    : CircularProgressIndicator()),
      ],
    );
  }
}

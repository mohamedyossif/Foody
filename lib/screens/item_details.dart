import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/model/food_list.dart';
import 'package:food_app/services/height_provider.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/customized_grid_view_Item.dart';
import 'package:food_app/widgets/details_icon.dart';
import 'package:food_app/widgets/item_count_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:readmore/readmore.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen(
      {@required this.foodName,
      @required this.image,
      @required this.price,
      @required this.description
      // @required this.title,
      // @required this.nutrition
      });

  static const String id = 'ItemDetailsScreen';

  // String title;
  // Nutrition nutrition;
  String description;

  String foodName;
  String image;
  String price;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
        ChangeNotifierProvider<HeightProvider>(create: (_) => HeightProvider()),
      ],
      child: Screen(foodName: foodName, image: image, price: price, description: description),
    );
  }
}

class Screen extends StatelessWidget {
  Screen(
      {@required this.foodName,
      @required this.image,
      @required this.price,
      @required this.description
      // @required this.title,
      // @required this.nutrition
      });

  // String title;
  // Nutrition nutrition;
  String description;

  String foodName;
  String image;
  String price;

  // String description = 'bla' * 50;
  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 95 / 100;
    return Scaffold(
      backgroundColor: Color(0xffffd04e),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            text: 'Add To Cart',
                            function: () {},
                          )
                        ],
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 30 / 100,
                    ),
                    height: Provider.of<HeightProvider>(context).height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.elliptical(100, 100))))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 10 / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                    child: CircleAvatar(
                      radius: 140,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                  Consumer<CounterProvider>(builder: (_, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemCountButton(
                                icon: Icons.indeterminate_check_box,
                                function: () =>
                                    Provider.of<CounterProvider>(context, listen: false).remove()),
                            Text(
                              Provider.of<CounterProvider>(context).itemCount.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            ItemCountButton(
                              icon: Icons.add_box,
                              function: () =>
                                  Provider.of<CounterProvider>(context, listen: false).add(),
                            ),
                          ],
                        ),
                        Center(
                            child: Text('\$ $price',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        const SizedBox(height: 10),
                        Text(
                          foodName,
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<HeightProvider>(builder: (_, value, child) {
                          return ReadMoreText(
                            description
                                .replaceAll('<b>', '')
                                .replaceAll('</b>', '')
                                .substring(0, 500),
                            trimMode: TrimMode.Line,
                            trimLines: 3,
                            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                            colorClickableText: Colors.black,
                            lessStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                            moreStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                            callback: (value) {
                              value
                                  ? Provider.of<HeightProvider>(context, listen: false)
                                      .lessHeight(context)
                                  : Provider.of<HeightProvider>(context, listen: false)
                                      .moreHeight(context);
                              print(value);
                            },
                          );
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 12 / 100,
                          width: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                                text: 'beef',
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Ingredients',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 9 / 100,
                          width: 60,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'NavigatoBottomBar/cart_Screen.dart';
import 'package:food_app/services/providers/counter_provider.dart';
import '../services/providers/height_provider.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/details_icon.dart';
import 'package:food_app/widgets/item_count_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:readmore/readmore.dart';
import 'package:food_app/constants.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen(
      {@required this.foodName,
      @required this.image,
      @required this.price,
      @required this.description,
      @required this.vegan,
      @required this.veryHealthy,
      @required this.readyInMinutes,
      @required this.veryPopular});

  static const String id = 'ItemDetailsScreen';

  final String description;
  final String foodName;
  final String image;
  final String price;
  final String veryHealthy;
  final String vegan;
  final String veryPopular;
  final String readyInMinutes;
  DetailsIcon IsVegan;
  DetailsIcon IsHealthy;
  DetailsIcon IsPopular;
  DetailsIcon ReadyInMinutes;

  void isVegan() {
    if (vegan == 'true') {
      IsVegan = DetailsIcon(
        icon: 'assets/images/vegan.png',
      );
    }

    IsVegan = DetailsIcon(
      icon: 'assets/images/meat.png',
    );
  }

  void healthy() {
    if (veryHealthy == 'true') {
      IsHealthy = DetailsIcon(
        icon: 'assets/images/healthy-food.png',
      );
    }

    IsHealthy = DetailsIcon(
      icon: 'assets/images/fast-food.png',
    );
  }

  void popular() {
    if (veryPopular == 'true') {
      IsPopular = DetailsIcon(
        icon: 'assets/images/fire.png',
      );
    }

    IsPopular = DetailsIcon(icon: 'assets/images/smile.png');
  }

  void readyInMins() {
    ReadyInMinutes = DetailsIcon(
      icon: 'assets/images/pot.png',
      text: '$readyInMinutes mins',
    );
  }

  @override
  Widget build(BuildContext context) {
    readyInMins();
    isVegan();
    popular();
    healthy();
    if (totalItems == 0 && count > 0) {
      Provider.of<CounterProvider>(context, listen: false).reset();
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
        ChangeNotifierProvider<HeightProvider>(create: (_) => HeightProvider()),
      ],
      child: Screen(
        foodName: foodName,
        image: image,
        price: price,
        description: description,
        vegan: IsVegan,
        readyInMinutes: ReadyInMinutes,
        veryHealthy: IsHealthy,
        veryPopular: IsPopular,
      ),
    );
  }
}

class Screen extends StatelessWidget {
  Screen(
      {@required this.foodName,
      @required this.image,
      @required this.price,
      @required this.description,
      @required this.vegan,
      @required this.veryHealthy,
      @required this.readyInMinutes,
      @required this.veryPopular});

  final String description;
  final String foodName;
  final String image;
  final String price;
  final DetailsIcon veryHealthy;
  final DetailsIcon vegan;
  final DetailsIcon veryPopular;
  final DetailsIcon readyInMinutes;

  @override
  Widget build(BuildContext context) {
    count = Provider.of<CounterProvider>(context).itemCount;
    print(count);
    print(totalItems);
    return Scaffold(
      backgroundColor: Color(0xffffd04e),
      body: GestureDetector(
        onTap: () {
          Provider.of<CounterProvider>(context, listen: false).reset();
        },
        child: SingleChildScrollView(
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
                              function: () async {
                                Map<String, dynamic> cartInfo = {
                                  'title': foodName,
                                  'price': price,
                                  'image': image,
                                  'count': count.toString()
                                };
                                await fireStoreDatabaseMethods
                                    .storeCart(usernameId, cartInfo, foodName)
                                    .then((value) {
                                  if (totalItems != 0) {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (c) => CartScreen()));
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 30 / 100,
                      ),
                      height: Provider.of<HeightProvider>(context).height + foodName.length * 3.5,
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
                                  function: () {
                                    Provider.of<CounterProvider>(context, listen: false).remove();
                                    totalPrice -= double.parse(price);
                                  }),
                              Text(
                                count.toString(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              ItemCountButton(
                                  icon: Icons.add_box,
                                  function: () {
                                    Provider.of<CounterProvider>(context, listen: false).add();

                                    totalPrice += double.parse(price);
                                  }),
                            ],
                          ),
                          Center(
                              child: Text('\$ $price',
                                  style: TextStyle(
                                      color: priceColor,
                                      fontSize: 22,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Highlights:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff040404),
                                  fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 9 / 100,
                              width: MediaQuery.of(context).size.height * 9 / 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  readyInMinutes,
                                  veryPopular,
                                  veryHealthy,
                                  vegan,
                                ],
                              ),
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
      ),
    );
  }
}

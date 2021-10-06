import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/details_icon.dart';
import 'package:food_app/widgets/item_count_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:readmore/readmore.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const String id = 'ItemDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (_) => CounterProvider(),
      child: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  String description = 'beef burger' * 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffd04e),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          text: 'Add To Cart',
                          function: () {},
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 30 / 100,
                    ),
                    height: MediaQuery.of(context).size.height * 60 / 100 + description.length,
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
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/chicken.jpg',
                        height: MediaQuery.of(context).size.height * 30 / 100,
                        width: MediaQuery.of(context).size.width * 30 / 100,
                      ),
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
                                icon: Icons.add_box,
                                function: () =>
                                    Provider.of<CounterProvider>(context, listen: false).add()),
                            Text(
                              Provider.of<CounterProvider>(context).itemCount.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            ItemCountButton(
                              icon: Icons.indeterminate_check_box,
                              function: () =>
                                  Provider.of<CounterProvider>(context, listen: false).remove(),
                            ),
                          ],
                        ),
                        Center(
                            child: Text('\$ 24.99',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))),
                        const SizedBox(height: 10),
                        Text(
                          'Beef Burger',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          description,
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                          colorClickableText: Colors.black,
                          lessStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                          moreStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                          callback: (value) {},
                        ),
                        SizedBox(
                          height: 90,
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
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                                text: 'beef',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Ingredients',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 60,
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
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              ),
                              DetailsIcon(
                                icon: 'assets/images/Icon_taco.png',
                              )
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

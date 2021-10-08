import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_in.dart';
import 'package:food_app/screens/sign_up.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:delayed_display/delayed_display.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              items: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/images/assets/pizza.jpg',
                  ),
                ),
                Image.asset('assets/images/assets/frenchFries.jpg'),
                Image.asset('assets/images/assets/burger.jpg'),
              ],
              options: CarouselOptions(
                  enlargeCenterPage: true, height: MediaQuery.of(context).size.height * 40 / 100),
            ),
            Column(children: [
              DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Text(
                  'Enjoy',
                  style: kWelcomText,
                ),
              ),
              DelayedDisplay(
                  delay: Duration(seconds: 2),
                  child: Text(
                    '\t\t\tTasty',
                    style: kWelcomText,
                  )),
              DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: Text(
                    '\t\t\t\t\t\tFood',
                    style: kWelcomText,
                  ))
            ]),
            DelayedDisplay(
              delay: Duration(seconds: 4),
              child: CustomButton(
                  text: 'Get Started',
                  function: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  }),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        color: const Color(0xff040404), fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: const Color(0xff040404),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

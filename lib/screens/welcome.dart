import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/sign_in.dart';
import 'package:food_app/screens/sign_up.dart';
import 'package:food_app/custom_button.dart';

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
                    'assets/images/pizza.jpg',
                  ),
                ),
                Image.asset('assets/images/frenchFries.jpg'),
                Image.asset('assets/images/burger.jpg'),
              ],
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 40 / 100),
            ),
            Center(
              child: Text(
                'Enjoy\n\t\tTasty\n\t\t\t\tFood',
                style: TextStyle(
                    color: Color(0xff040404),
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
            ),
            CustomButton(
                text: 'Get Started',
                function: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      color: Color(0xff040404),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xff040404),
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
          ],
        ),
      ),
    );
  }
}

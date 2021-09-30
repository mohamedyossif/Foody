import 'package:flutter/material.dart';
import 'package:food_app/custom_button.dart';

import '../custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome!',
            style: TextStyle(
                color: Color(0xffd8434d),
                fontSize: 50,
                fontWeight: FontWeight.w700),
          ),
          Image.asset('assets/images/deliveryman.jpg'),
          CustomTextField(
            icon: Icons.person,
            labelText: 'Username',
            function: (value) {
              //TODO: implement firebase auth
            },
          ),
          CustomTextField(
            icon: Icons.email,
            labelText: 'Email',
            function: (value) {
              //TODO: implement firebase auth
            },
          ),
          CustomTextField(
            icon: Icons.lock,
            labelText:'Password',
            obscure: true,
            function: (value) {
              //TODO: implement firebase auth
            },
          ),
          CustomButton(
              text: 'Sign Up',
              function: () {
                //TODO: Navigate to home screen
              })
        ],
      )),
    );
  }
}

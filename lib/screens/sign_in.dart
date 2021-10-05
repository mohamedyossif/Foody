import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  static const String id = 'SignInScreen';
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
            'Welcome Back!',
            style: TextStyle(
                color: Color(0xffd8434d),
                fontSize: 50,
                fontWeight: FontWeight.w700),
          ),
          Image.asset('assets/images/salad.png'),
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
              text: 'Sign In',
              function: () {
                //TODO: Navigate to home screen
              })
        ],
      )),
    );
  }
}

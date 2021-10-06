import 'package:flutter/material.dart';
import 'package:food_app/services/sign_provider.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/custom_text_field.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:food_app/services/auth_firebase.dart';
import 'home_screen.dart';
import 'package:flutter/rendering.dart';

import 'item_details.dart';

class SignInScreen extends StatelessWidget {
  static const String id = 'SignInScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => SignInProvider(), child: Screen());
  }
}

class Screen extends StatelessWidget {
  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: Provider.of<SignInProvider>(context).isLoading,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                    color: const Color(0xffD4361C), fontSize: 50, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/salad.png'),
              ),
              CustomTextField(
                icon: Icons.email,
                labelText: 'Email',
                function: (value) {
                  email = value;
                },
              ),
              CustomTextField(
                icon: Icons.lock,
                labelText: 'Password',
                obscure: true,
                function: (value) {
                  password = value;
                },
              ),
              Consumer<SignInProvider>(builder: (_, value, child) {
                return CustomButton(
                    text: 'Sign In',
                    function: () async {
                      Provider.of<SignInProvider>(context, listen: false).loading();
                      await AuthFirebaseMethods()
                          .signInWithEmailAndPassword(context, email, password);
                      Navigator.pushNamed(context, ItemDetailsScreen.id);
                      Provider.of<SignInProvider>(context, listen: false).signed();
                    });
              })
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/custom_text_field.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:food_app/services/auth_firebase.dart';
import 'home_screen.dart';
import 'package:flutter/rendering.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  String email = '';

  String password = '';

  bool isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: isLoading,
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
              CustomButton(
                  text: 'Sign In',
                  function: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await AuthFirebaseMethods()
                        .signInWithEmailAndPassword(context, email, password);
                    Navigator.pushNamed(context, HomeScreen.id);
                    setState(() {
                      isLoading = false;
                    });
                  })
            ],
          ),
        )),
      ),
    );
  }
}

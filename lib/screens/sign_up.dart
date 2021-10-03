import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/screens/home_screen.dart';
import '../widgets/custom_text_field.dart';
import 'package:food_app/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:food_app/services/sign_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/rendering.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider(), child: Screen());
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
        isLoading: Provider.of<SignUpProvider>(context).isLoading,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                      color: const Color(0xffD4361C), fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset('assets/images/deliveryman.jpg')),
                CustomTextField(
                  icon: Icons.person,
                  labelText: 'Username',
                  function: (value) {
                    //TODO: implement firebase auth
                  },
                ),
                CustomTextField(
                  icon: Icons.home,
                  labelText: 'Address',
                  function: (value) {
                    //TODO: implement firebase auth
                  },
                ),
                CustomTextField(
                  icon: Icons.phone,
                  labelText: 'Mobile number',
                  function: (value) {
                    //TODO: implement firebase auth
                  },
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
                Consumer<SignUpProvider>(builder: (_, value, child) {
                  return CustomButton(
                      text: 'Sign Up',
                      function: () async {
                        Provider.of<SignUpProvider>(context, listen: false).loading();
                        await AuthFirebaseMethods()
                            .signUpWithEmailAndPassword(context, email, password);
                        Navigator.pushNamed(context, HomeScreen.id);
                        Provider.of<SignUpProvider>(context, listen: false).signed();
                      });
                })
              ],
            ),
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, WelcomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Image.asset(
        'assets/splashimage.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

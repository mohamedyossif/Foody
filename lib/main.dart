import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'screens/splash.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'screens/sign_in.dart';
import 'screens/item_details.dart';

import 'package:food_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (BuildContext ctx) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ItemDetailsScreen.id: (context) => ItemDetailsScreen(),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}

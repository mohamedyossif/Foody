import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'screens/sign_in.dart';
import 'screens/item_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        ItemDetailsScreen.id: (context) => ItemDetailsScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}

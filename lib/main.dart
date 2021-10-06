import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/screens/profile_screen.dart';
import 'package:food_app/services/auth_firebase.dart';
import 'package:food_app/services/shared_preferences.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'screens/sign_in.dart';
import 'screens/item_details.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';
bool isCkeck =false;
 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// check state of screen                           
  await SharedPreferencesDatabase.getUserLoggedInKey()
              /// first case ,isCkeck is false
  .then((value) => isCkeck = value ?? false);
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (BuildContext ctx) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ItemDetailsScreen.id: (context) => ItemDetailsScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
        },
        initialRoute: isCkeck?HomeScreen.id:WelcomeScreen.id,
      ),
    );
  }
}

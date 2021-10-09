import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/screens/home_screen.dart';
import 'screens/NavigatoBottomBar/cart_Screen.dart';
import 'screens/NavigatoBottomBar/profile_screen.dart';
import 'package:food_app/screens/succesful_payment.dart';
import 'package:food_app/services/shared_preferences.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'screens/sign_in.dart';
import 'screens/item_details.dart';
import 'package:provider/provider.dart';
import 'services/providers/my_provider.dart';

bool isCheck = false;

main() async {
  /// connection with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /// check state of screen
  await SharedPreferencesDatabase.getUserLoggedInKey()
      /// first case ,isCheck is false
      .then((value) => isCheck = value ?? false);
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
          CartScreen.id: (context) => CartScreen(),
          SuccessPayment.id: (context) => SuccessPayment()
        },
        initialRoute: isCheck ? HomeScreen.id : WelcomeScreen.id,

      ),
    );
  }
}

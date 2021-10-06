import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';
import 'package:flutter/services.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'screens/sign_in.dart';
import 'screens/item_details.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MyApp());
/*void main()async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //runApp(MyApp());
}*/
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<MyProvider>(
      create: (BuildContext ctx) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       // home: HomeScreen(),
    routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        ItemDetailsScreen.id: (context) => ItemDetailsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
      initialRoute: HomeScreen.id,
      ),);
  }
}



import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesDatabase {
  static String _sharedPreferencesIsLoggedInKey = 'IsLoggedIn';
   static String _sharedPreferencesUserNameKey = 'UserNameKey';
    // Save data To SharedPreferences
  static Future<bool> saveUserLoggedInKey(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(_sharedPreferencesIsLoggedInKey, isLoggedIn);
  }
   static Future<bool> saveUserNameKey(String isUserName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(_sharedPreferencesUserNameKey, isUserName);
  }

  // getting data from SharedPreferences
  static Future<bool> getUserLoggedInKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getBool(_sharedPreferencesIsLoggedInKey);
  }
   static Future<String> getUserNameKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_sharedPreferencesUserNameKey);
  }
 
}

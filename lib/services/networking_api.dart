import 'dart:convert';
import 'package:food_app/model/food_list.dart';
import 'package:http/http.dart';

class NetworkingAPI {
  static const int numberOfList = 14;
  static Future<List<FoodList>> getData(String query) async {
    // String foodName = 'pizza';
  //   String apiKey = '65d9525b0c4a44a4b5b619199fe14ab3';
    // String apiKey = 'e0a1fd4d9022476597383631e024d695';
   //  String apiKey = 'f3138f6b49444c6abc42bad95e736920';
    // String apiKey = 'dcade6d44026424dbef056811ce40bc5';
    //  String apiKey = 'c3d9f1e959f9466cbd1ae7c18d28901c';
   // String apiKey = '60bd907be99a482fa12720c4e6e89924';
    // String apiKey = '5819d3a5ce6c4f0395cb684e5b8d68ac‏';
  //  String apiKey='8a102ef818b64c3ab5c39aa0aefcbcf3‏';
   // String apiKey='0dd551eef8e2411bb2579e2be36d68a8‏';
   // String apiKey='9f614156175348bc91baf1f3d53ac099‏';
   // String apiKey='82cfbdbfb0a34ea3a047bf5fcc61ae78‏‏';
   // String apiKey='f89737962fa04c01b2353d0748778186‏';
   // String apiKey='0dd551eef8e2411bb2579e2be36d68a8‏';
    String apiKey='65d9525b0c4a44a4b5b619199fe14ab3';
    String uri =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$query&addRecipeInformation=true&addRecipeNutrition=true&number=$numberOfList';
    try {
      var response = await get(Uri.parse(uri));
      if (response.statusCode == 200) {
        print(response.statusCode);
        final dataDecode = json.decode(response.body)['results'];
        return dataDecode.map<FoodList>((item) {
          return FoodList.fromJson(item);
        }).toList();
      } else {
        return throw 'can`t access';
      }
    } catch (e) {
      return throw 'can`t access';
    }
  }
}

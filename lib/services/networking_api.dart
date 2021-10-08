import 'dart:convert';
import 'package:food_app/model/food_list.dart';
import 'package:http/http.dart';

class NetworkingAPI {
  static const int numberOfList = 10;
  static Future<List<FoodList>> getData() async {
    String foodName = 'pizza';
    // String apiKey = '65d9525b0c4a44a4b5b619199fe14ab3';
    // String apiKey = 'e0a1fd4d9022476597383631e024d695';
    String apiKey = 'f3138f6b49444c6abc42bad95e736920';
    // String apiKey = 'dcade6d44026424dbef056811ce40bc5';
    // String apiKey = 'c3d9f1e959f9466cbd1ae7c18d28901c';
    // String apiKey = '60bd907be99a482fa12720c4e6e89924';
    String uri =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$foodName&addRecipeInformation=true&addRecipeNutrition=true&number=$numberOfList';
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

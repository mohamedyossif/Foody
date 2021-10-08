import 'dart:convert';
import 'package:food_app/model/food_list.dart';
import 'package:http/http.dart';
class NetworkingAPI {
  static const int numberOfList = 10;
  static Future<List<FoodList>> getData() async {
    String foodName='pizza';
   // String apiKey = '65d9525b0c4a44a4b5b619199fe14ab3';
   // String apiKey = 'e0a1fd4d9022476597383631e024d695';
   // String apiKey = '21753cd025024eec9f698b3ec1205acc';
   //  String apiKey = 'f3138f6b49444c6abc42bad95e736920';
    String apiKey = '0dd551eef8e2411bb2579e2be36d68a8';
   //  String apiKey = '8a102ef818b64c3ab5c39aa0aefcbcf3';
    String uri =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$foodName&addRecipeInformation=true&addRecipeNutrition=true&number=$numberOfList';
  try{
    var response = await get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final dataDecode =
          json.decode(response.body)['results'];
      return dataDecode.map<FoodList>((item) {
        return FoodList.fromJson(item);
      }).toList();
    }
    else
    {
       return throw 'can`t access';
    }
  }
  catch(e)
  {
     return throw 'can`t access';
  }

}
}

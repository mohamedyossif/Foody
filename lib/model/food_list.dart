class FoodList {
  final String image;
  final String title;
  final int id;
  final double price;
  Nutrition nutrition;
  FoodList({this.title, this.image, this.id, this.price, this.nutrition});
  factory FoodList.fromJson(Map<String, dynamic> json) {
    return FoodList(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['pricePerServing'],
      nutrition: Nutrition.fromJson(json['nutrition']),
    );
  }
}

class Nutrition {
  Nutrients nutrients;
  Ingredients ingredients;
  Nutrition({this.nutrients, this.ingredients});
  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
        nutrients: Nutrients.fromJson(json['nutrients']),
        ingredients: Ingredients.fromJson(json['ingredients']));
  }
}

class Nutrients {
  double calories;
  Nutrients({ this.calories});
  factory Nutrients.fromJson(json) {
    return Nutrients(calories: json[0]['amount']);
  }
}

class Ingredients {
  List<String> ingredient = [];
  Ingredients({this.ingredient});
  factory Ingredients.fromJson(json) {
    return Ingredients(ingredient: [
      json[0]['name'],
      json[1]['name'],
      json[2]['name'],
      json[3]['name'],
      json[4]['name']
    ]);
  }
}

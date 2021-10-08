class FoodList {
  final String description;
  final String image;
  final String title;
  final int id;
  final double price;
  final bool veryHealthy;
  final bool vegan;
  final bool veryPopular;
  final int readyInMinutes;
  Nutrition nutrition;

  FoodList(
      {this.veryHealthy,
      this.readyInMinutes,
      this.vegan,
      this.title,
      this.image,
      this.id,
      this.price,
      this.nutrition,
      this.veryPopular,
      this.description});

  factory FoodList.fromJson(Map<String, dynamic> json) {
    return FoodList(
      description: json['summary'],
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['pricePerServing'],
      veryHealthy: json['veryHealthy'],
      vegan: json['vegan'],
      veryPopular: json['veryPopular'],
      readyInMinutes: json['readyInMinutes'],
      nutrition: Nutrition.fromJson(
        json['nutrition'],
      ),
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

  Nutrients({this.calories});
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

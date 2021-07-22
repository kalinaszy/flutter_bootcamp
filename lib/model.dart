class Recipes {
  final List<Recipe> dataModel;

  Recipes({required this.dataModel});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    var list = json['meals'] as List;

    List<Recipe> dataList =
        list.map((dataModel) => Recipe.fromJson(dataModel)).toList();

    return Recipes(dataModel: dataList);
  }
}

class Recipe {
  final String name;
  final String meal;
  final String desc;
  final String thumbnail;

  Recipe(
      {required this.name,
      required this.desc,
      required this.meal,
      required this.thumbnail});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['strMeal'],
        desc: json['strInstructions'],
        meal: json['strMeal'],
        thumbnail: json['strMealThumb']);
  }
}

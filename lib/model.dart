class Recipe {
  final String name;
  final String desc;

  Recipe({required this.name, required this.desc});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(name: json['strMeal'], desc: json['strInstructions']);
  }
}

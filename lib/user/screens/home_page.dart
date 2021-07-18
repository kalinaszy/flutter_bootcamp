import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

import 'package:http/http.dart' as http;

Future<String> fetchRecipe() async {
  final response = await http
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load a recipe');
  }
}

//model start:
class DataSeries {
  final List<Recipe> dataModel;

  DataSeries({required this.dataModel});

  factory DataSeries.fromJson(Map<String, dynamic> json) {
    var list = json['meals'] as List;

    List<Recipe> dataList =
        list.map((dataModel) => Recipe.fromJson(dataModel)).toList();

    return DataSeries(dataModel: dataList);
  }
}

class Recipe {
  final String name;
  final String desc;

  Recipe({required this.name, required this.desc});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(name: json['strMeal'], desc: json['strInstructions']);
  }
}
//model end

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> futureRecipe;

  @override
  void initState() {
    super.initState();
    futureRecipe = fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Recipes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Recipe'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: futureRecipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Bon apetit');
                //(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

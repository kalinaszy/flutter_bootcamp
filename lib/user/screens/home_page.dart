import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/details.dart';
import 'package:http/http.dart' as http;

Future<String> fetchRecipe() async {
  final response = await http
      // .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=a'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load a recipe');
  }
}

//model start:
// class DataSeries {
//   final List<Recipe> dataModel;

//   DataSeries({required this.dataModel});

//   factory DataSeries.fromJson(Map<String, dynamic> json) {
//     var list = json['meals'] as List;

//     List<Recipe> dataList =
//         list.map((dataModel) => Recipe.fromJson(dataModel)).toList();

//     return DataSeries(dataModel: dataList);
//   }
// }

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

Future<String> _loadRemoteData() async {
  final response = await (http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=a')));
  if (response.statusCode == 200) {
    print('response statusCode is 200');
    return response.body;
  } else {
    print('Http Error: ${response.statusCode}!');
    throw Exception('Invalid data source.');
  }
}

class _HomePageState extends State<HomePage> {
  late Future<Recipes> dataSeries;

  Future<Recipes> fetchRecipes() async {
    String jsonString = await _loadRemoteData();
    print('jsonString: $jsonString');

    final jsonResponse = json.decode(jsonString);
    print('jsonResponse: $jsonResponse');

    Recipes dataSeries = new Recipes.fromJson(jsonResponse);

    return dataSeries;
  }

  @override
  void initState() {
    super.initState();
    dataSeries = fetchRecipes();
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
          child: FutureBuilder<Recipes>(
            future: dataSeries,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text('Bon apetit');
                // //(snapshot.data.toString());
                return ListView.builder(
                  itemCount: snapshot.data!.dataModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data!.dataModel[index].meal),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyDetails(
                                    snapshot.data!.dataModel[index])));
                      },
                    );
                  },
                );
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


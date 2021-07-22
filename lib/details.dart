import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class MyDetails extends StatelessWidget {
  final Recipe myRecipe;

  MyDetails(this.myRecipe);

  @override
  Widget build(BuildContext context) {
    final title = 'Details Page';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 800.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 284.0,
                            width: 400.0,
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Image.network(myRecipe.thumbnail),
                                ),
                              ],
                            ),
                          ),
                          // Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(myRecipe.meal),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(myRecipe.desc),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}


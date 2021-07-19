// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/home_page.dart';
import 'package:flutter_application_1/user/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/recipe',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/recipe': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
      title: 'Recipes App',

      //todo kalina: tu login?
      theme: ThemeData(
        fontFamily: 'Uchen',
        primarySwatch: Colors.lightGreen,
      ),
      //todo kalina: stworzyć hp
    );
  }
}

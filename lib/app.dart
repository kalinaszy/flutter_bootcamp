// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
      title: 'Recipes App',

      //todo kalina: tu login?
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Uchen',
        primarySwatch: Colors.lightGreen,
      ),
      //todo kalina: stworzyć hp
      //home: MyHomePage(title: 'Recipes App Home Page'),
    );
  }
}

class MyHomePage {}

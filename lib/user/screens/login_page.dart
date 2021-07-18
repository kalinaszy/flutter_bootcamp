import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration buildBck() {
      return BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bckphoto.jpg"), fit: BoxFit.contain),
      );
    }

    Text buildText() {
      return Text(
        'Recipes',
        style: TextStyle(
          fontSize: 50,
          color: const Color(0xFF807A6B),
          backgroundColor: Colors.amber,
        ),
        textAlign: TextAlign.right,
      );
    }
    //  return Container(

    //  );
    return Scaffold(
      //bck colo
      body: Container(
        decoration: buildBck(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildText(),
              SizedBox(height: 50.0),
              MaterialButton(
                color: Colors.white,
                child: Text(
                  "Sign In with Google",
                  style: TextStyle(fontFamily: 'Schyler'),
                ),
                onPressed: () => print("Still working on it..."),
              )
            ],
          ),
        ),
      ),
    );
  }
}

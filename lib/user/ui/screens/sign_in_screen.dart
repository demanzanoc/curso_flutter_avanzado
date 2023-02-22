import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUi();
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome \nThis is your Travel App",
                style: TextStyle(
                  fontSize: 29.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonGreen(
                text: "Sign in with Google",
                onPressed: () {},
                width: 300.0,
                height: 50.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}

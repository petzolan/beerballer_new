import 'package:beerballer_new/Screens/Authenticate/registerScreen.dart';
import 'package:beerballer_new/Screens/Authenticate/signInScreen.dart';
import 'package:flutter/material.dart';

class ToggleAuthenticateScreens extends StatefulWidget {
  @override
  _ToggleAuthenticateScreensState createState() =>
      _ToggleAuthenticateScreensState();
}

class _ToggleAuthenticateScreensState extends State<ToggleAuthenticateScreens> {
 
  bool showSignIn = true;

  void toggleView() {
    setState(
      () {
        showSignIn = !showSignIn;
        print("changed view");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(
        toggleView: toggleView,
      );
    } else {
      return RegisterScreen(
        toggleView: toggleView,
      );
    }
  }
}

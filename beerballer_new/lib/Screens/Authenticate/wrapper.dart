import 'package:beerballer_new/Screens/Authenticate/toggleAuthenticateScreens.dart';
import 'package:beerballer_new/Screens/ScreenController/screenController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // is user logged in?
    final user = Provider.of<User?>(
      context,
    );

    // return either Home or Authenticate Widget
    // if user is logged in
    if (user != null) {
      // return home
      return SafeArea(
        child: ScreenController(),
      );
    }
    // else return sign in/register Screen
    return SafeArea(
      child: ToggleAuthenticateScreens(),
    );
  }
}

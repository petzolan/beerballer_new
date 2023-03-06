import 'package:flutter/material.dart';

class AppVariables {
  // Colors ___________________________________________
  static final Map<int, Color> darkAccentColor = {
    50: Color.fromRGBO(137, 137, 137, .1),
    100: Color.fromRGBO(137, 137, 137, .2),
    200: Color.fromRGBO(137, 137, 137, .3),
    300: Color.fromRGBO(137, 137, 137, .4),
    400: Color.fromRGBO(137, 137, 137, .5),
    500: Color.fromRGBO(137, 137, 137, .6),
    600: Color.fromRGBO(137, 137, 137, .7),
    700: Color.fromRGBO(137, 137, 137, .8),
    800: Color.fromRGBO(137, 137, 137, .9),
    900: Color.fromRGBO(137, 137, 137, 1),
  };

  static const Map<int, Color> brightAccentColor = {
    50: Color.fromRGBO(217, 218, 218, .1),
    100: Color.fromRGBO(217, 218, 218, .2),
    200: Color.fromRGBO(217, 218, 218, .3),
    300: Color.fromRGBO(217, 218, 218, .4),
    400: Color.fromRGBO(217, 218, 218, .5),
    500: Color.fromRGBO(217, 218, 218, .6),
    600: Color.fromRGBO(217, 218, 218, .7),
    700: Color.fromRGBO(217, 218, 218, .8),
    800: Color.fromRGBO(217, 218, 218, .9),
    900: Color.fromRGBO(217, 218, 218, 1),
  };

  static const Color darkAccent = Color.fromRGBO(137, 137, 137, 1);
  static const Color brightAccent = Color.fromRGBO(217, 218, 218, 1);
  static const Color buttonColor = Color.fromRGBO(249, 149, 0, 1);

  static const Color textColor1 = Color.fromRGBO(113, 105, 105, 1);
  static const Color backgroundGrey = Color.fromRGBO(60, 60, 60, 1);
  static const Color backgroundCol = Color.fromRGBO(25, 25, 25, 1);
  static const Color greyedOutText = Colors.white24;
  static const Color favoriteBoxes = Color.fromRGBO(75, 70, 66, 1);
  // Border ___________________________________________
  static final BorderRadius borderRadius = BorderRadius.circular(20.0);

  // Card sizes
  static final double cardPictureHeightStandard = 0.175;
  static final double cardPictureHeightTinder = 0.4;
  static final double paddingHeight = 8.0;

  // back Icon
  static final Icon backArrow = Icon(
    Icons.arrow_back,
    color: Colors.white,
  );
  // Shadow
  static final BoxShadow boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
  );

  // Sized boxes
  static const SizedBox heightTwentyBox = SizedBox(
    height: 20,
  );
}

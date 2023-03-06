import 'dart:io';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:flutter/material.dart';
import '../../utils/appVariables.dart';

// This class is the popup that comes right after starting the app - "Dont drink too much"
class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return AlertDialog(
      // Abstände
      insetPadding: const EdgeInsets.all(20.0),
      contentPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      backgroundColor: AppVariables.backgroundGrey,
      // Inhalt
      title: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Warte mal!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      content: Container(
        width: queryData.size.width * 0.8,
        height: queryData.size.width * 0.4,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text
                Container(
                  child: Text(
                    "\nWir bitten dich um einen moderaten und verantwortungsbewussten Alkoholkonsum." +
                        "\n\n" +
                        "BeerBaller übernimmt keine Haftung für Schäden, die durch die Nutzung dieser App enstanden sind." +
                        "\n\n" +
                        "Und damit, Prost!",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: queryData.textScaleFactor * 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // OK Button
      actions: <Widget>[
        Center(
          child: new ElevatedButton(
            onPressed: () async {
              DatabaseService.instance.addUserToSeen();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              backgroundColor: AppVariables.buttonColor,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Alles klar",
              style: TextStyle(
                color: Colors.white,
                fontSize: queryData.textScaleFactor * 20,
              ),
            ),
          ),
        ),
        // Closes the whole App
        Center(
          child: GestureDetector(
            onTap: () {
              exit(0);
            },
            child: Text(
              "Beenden",
              style: TextStyle(
                color: AppVariables.greyedOutText,
                fontSize: queryData.textScaleFactor * 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

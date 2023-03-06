import 'dart:io';
import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/appVariables.dart';

// This class is the popup that comes right after starting the app - "Dont drink too much"
class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final AuthService _authService = AuthService.instance;
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return AlertDialog(
      // Abstände
      shape: RoundedRectangleBorder(
        borderRadius: AppVariables.borderRadius,
      ),

      backgroundColor: AppVariables.backgroundGrey,
      // Inhalt
      title: Column(
        children: [
          const Text(
            "Password wiederherstellen",
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
        height: queryData.size.height * 0.15,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 20,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(
                        fontSize: queryData.textScaleFactor * 17,
                        color: Colors.white),
                  ),
                  validator: (val) =>
                      val!.isEmpty ? 'Gib eine E-Mail ein' : null,
                  onChanged: (val) {
                    setState(
                      () => {
                        email = val,
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                error,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: queryData.textScaleFactor * 12,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      // OK Button
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (await _emailExsistsInFirestore(email).asStream().length >
                    1) {
                  print("email exsists");
                  dynamic result = await _authService.resetPassword(email);
                  _showEmailSendDialog(context, email);
                  if (result == null) {
                    setState(
                      () {
                        error = "Bitte überprüfe deine E-Mail.";
                      },
                    );
                  }
                } else {
                  print("email  doesnt exsist");
                  setState(
                    () {
                      error = "Mit dieser E-Mail ist kein Konto verknüpft.";
                    },
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              primary: AppVariables.buttonColor,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Passwort zurücksetzen ",
              style: TextStyle(
                color: Colors.white,
                fontSize: queryData.textScaleFactor * 15,
              ),
            ),
          ),
        ),
        // Closes the whole App
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Zurück",
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

  void _showEmailSendDialog(context, userEmail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Super!'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Text("Dir wurde eine E-Mail an " +
              userEmail +
              " gesendet. Folge dem Link um dein Passwort zu ändern und logge dich dann in dein Konto ein."),
          actions: <Widget>[
            GestureDetector(
              child: Text('Auf zum Login!'),
              onTap: () {
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> _emailExsistsInFirestore(
      String email) async {
    print("let's check if email exists");
    return (FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email.toLowerCase())
        .snapshots());
  }
}

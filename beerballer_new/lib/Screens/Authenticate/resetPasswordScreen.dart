import 'package:beerballer_new/Services/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/appVariables.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthService _authService = AuthService.instance;
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          // Background
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/signIn.png"),
              fit: BoxFit.cover,
            ),
          ),
          // Content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppVariables.borderRadius,
                  boxShadow: [
                    AppVariables.boxShadow,
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => {Navigator.of(context).pop()},
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      // sign in with e-Mail & password
                      Container(
                        padding: EdgeInsets.only(
                          right: queryData.size.width * 0.1,
                          left: queryData.size.width * 0.1,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Passwort wiederherstellen",
                                    style: TextStyle(
                                      fontFamily: "Caveat",
                                      letterSpacing: 2,
                                      fontSize: queryData.textScaleFactor * 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    size: 20,
                                  ),
                                  hintText: "E-Mail",
                                  hintStyle: TextStyle(
                                    fontSize: queryData.textScaleFactor * 17,
                                  ),
                                  border: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                  ),
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
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (await _emailExsistsInFirestore(email)
                                            .asStream()
                                            .length >
                                        1) {
                                      print("email exsists");
                                      dynamic result = await _authService
                                          .resetPassword(email);
                                      _showEmailSendDialog(context, email);
                                      if (result == null) {
                                        setState(
                                          () {
                                            error =
                                                "Bitte überprüfe deine E-Mail.";
                                          },
                                        );
                                      }
                                    } else {
                                      print("email  doesnt exsist");
                                      setState(
                                        () {
                                          error =
                                              "Mit dieser E-Mail ist kein Konto verknüpft.";
                                        },
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  primary: AppVariables.darkAccent,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/Widgets/textWithDivider.dart';
import 'package:flutter/material.dart';

import '../../utils/appVariables.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;

  RegisterScreen({
    required this.toggleView,
  });

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService.instance;
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  // text field state
  String email = '';
  String username = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

// Toggles the password show status
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppVariables.backgroundGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      //Abstand oben
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Registrieren",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Infotext
                      Text(
                        "Bitte registriere dich um fortzufahren.",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppVariables.greyedOutText,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          left: 15.0,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              size: 20,
                              color: AppVariables.backgroundGrey,
                            ),
                            hintText: "E-Mail",
                            hintStyle: TextStyle(
                              fontSize: queryData.textScaleFactor * 17,
                              color: AppVariables.backgroundGrey,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: AppVariables.borderRadius,
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Gib eine E-Mail ein' : null,
                          onChanged: (val) {
                            setState(
                              () => {
                                email = val.toLowerCase(),
                              },
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      //   child: TextFormField(
                      //     style: TextStyle(color: Colors.black),
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       prefixIcon: Icon(
                      //         Icons.person_outline,
                      //         size: 20,
                      //         color: AppVariables.backgroundGrey,
                      //       ),
                      //       hintText: "Vorname",
                      //       hintStyle: TextStyle(
                      //         fontSize: queryData.textScaleFactor * 17,
                      //         color: AppVariables.backgroundGrey,
                      //       ),
                      //       fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //         borderRadius: AppVariables.borderRadius,
                      //         borderSide: BorderSide.none,
                      //       ),
                      //     ),
                      //     validator: (val) =>
                      //         val!.isEmpty ? 'Gib deinen Vornamen an' : null,
                      //     onChanged: (val) {
                      //       setState(
                      //         () => {
                      //           username = val,
                      //         },
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              size: 20,
                              color: AppVariables.backgroundGrey,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: _toggle,
                                child: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                            hintText: "Passwort",
                            hintStyle: TextStyle(
                              fontSize: queryData.textScaleFactor * 17,
                              color: AppVariables.backgroundGrey,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: AppVariables.borderRadius,
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: _passwordVisible,
                          validator: (val) => val!.length < 8
                              ? 'Gib ein Passwort mit mindestens 8 Zeichen an'
                              : null,
                          onChanged: (val) {
                            setState(
                              () => {
                                password = val.trim(),
                              },
                            );
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              size: 20,
                              color: AppVariables.backgroundGrey,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: _toggle,
                                child: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                            hintText: "Passwort bestätigen",
                            hintStyle: TextStyle(
                              fontSize: queryData.textScaleFactor * 17,
                              color: AppVariables.backgroundGrey,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: AppVariables.borderRadius,
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: _passwordVisible,
                          validator: (val) =>
                              val.toString() != password.toString()
                                  ? 'Passwörter stimmen nicht überein'
                                  : null,
                          onChanged: (val) {
                            setState(
                              () => {
                                confirmPassword = val,
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      ),
                      // login Button
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result =
                                await _authService.registerWithEmailAndPassword(
                                    email, password, username);
                            if (result == null) {
                              setState(
                                () {
                                  error =
                                      'Diese E-Mail-Adresse ist bereits mit einem anderen Konto verknüpft.';
                                },
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.0,
                          ),
                          primary: AppVariables.buttonColor,
                          shape: StadiumBorder(),
                        ),
                        child: Text(
                          "Registrieren",
                          style: TextStyle(
                            fontSize: queryData.textScaleFactor * 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // other login options
              TextWithDivider("ANMELDEN MIT", 0.7),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _authService.loginWithGoogle(),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppVariables.buttonColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "lib/assets/images/googlePng.png",
                        color: Colors.white,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Du hast schon einen Account? ",
                    style: TextStyle(
                      fontSize: queryData.textScaleFactor * 13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      this.widget.toggleView(),
                    },
                    child: Container(
                      child: Text(
                        "Jetzt einloggen",
                        style: TextStyle(
                          fontSize: queryData.textScaleFactor * 12,
                          color: AppVariables.buttonColor,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1, color: AppVariables.buttonColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

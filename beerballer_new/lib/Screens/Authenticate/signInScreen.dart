import 'package:beerballer_new/Screens/Authenticate/resetPasswordScreen.dart';
import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/passwordReset.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Widgets/HomeScreenWidgets/popUp.dart';
import '../../utils/appVariables.dart';
import '../../Widgets/textWithDivider.dart';

class SignInScreen extends StatefulWidget {
  final Function toggleView;

  SignInScreen({
    required this.toggleView,
  });

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService.instance;
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  // text field state
  String email = '';
  String password = '';
  String error = '';

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
            children: <Widget>[
              Container(
                child: Column(children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 15.0,
                    ),
                    child: Image.asset(
                      "lib/assets/images/schriftzugWeiß.png",
                      width: 150,
                    ),
                  ),
                  // Name der App
                  Text(
                    "Best of Trinkspiele",
                    style: TextStyle(
                      fontSize: 40,
                      color: AppVariables.buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppVariables.heightTwentyBox,
                  // Einloggen in die App
                  Text(
                    "Einloggen",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Infotext
                  Text(
                    "Bitte logge dich ein um fortzufahren.",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppVariables.greyedOutText,
                    ),
                  ),
                  // sign in with e-Mail & password
                  Container(
                    padding: EdgeInsets.only(
                      right: queryData.size.width * 0.1,
                      left: queryData.size.width * 0.1,
                    ),
                    child: Form(
                      // key
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Abstand oben
                          const SizedBox(
                            height: 10,
                          ),
                          // E-MAIL Eingabe
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 15.0),
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
                                    email = val,
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // PASSWORD Eingabe
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 15.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.password,
                                  size: 20,
                                  color: AppVariables.backgroundGrey,
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: AppVariables.borderRadius,
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
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
                          // Passwort vergessen
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => PasswordReset(),
                                    );
                                  },
                                  child: Text(
                                    "Passwort vergessen?",
                                    style: TextStyle(
                                      fontSize: queryData.textScaleFactor * 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // error msg when sth on Firebase happens
                          Text(
                            error,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: queryData.textScaleFactor * 10,
                              color: AppVariables.buttonColor,
                            ),
                          ),

                          // login Button
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                dynamic result = await _authService
                                    .signInWithEmailAndPassword(
                                        email.toLowerCase(), password, '');
                                if (result == null) {
                                  setState(
                                    () {
                                      error =
                                          "Bitte überprüfe deine E-Mail und dein Passwort.";
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
                              "Einloggen",
                              style: TextStyle(
                                fontSize: queryData.textScaleFactor * 15,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          // other login options
                          TextWithDivider("EINLOGGEN MIT", 0.7),
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
                          // register (noch kein Konto)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Du hast noch kein Konto? ",
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
                                    "Jetzt registrieren",
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
                                        width: 1,
                                        color: AppVariables.buttonColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

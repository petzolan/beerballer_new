import 'package:beerballer_new/Models/currentUserModel.dart';
import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// In this class the Option-Tab is created
class OptionTab extends StatefulWidget {
  final Function callback;
  OptionTab(this.callback);

  @override
  _OptionTabState createState() => _OptionTabState();
}

class _OptionTabState extends State<OptionTab> {
  // to logout & change password
  final AuthService _authService = AuthService.instance;
  final DatabaseService _databaseService = DatabaseService.instance;

  // decide if password is visible or not
  bool _passwordVisible = true;

  // the form key
  final _formKey = GlobalKey<FormState>();

  // text inputs for the forms (Change username/password)
  String username = "";
  String passwordChanged = "";
  String passwordConfirm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.backgroundCol,
      //Appbar to get back to HomeTab()
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: MediaQuery.of(context).size.height * 0.075,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Image.asset(
          "lib/assets/images/schriftzugWeiß.png",
          width: 150,
        ),
        backgroundColor: AppVariables.backgroundCol,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      // Body, showing the selected GameList
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            // Account Settings
            Text(
              "Accounteinstellungen",
              style: TextStyle(
                  color: AppVariables.buttonColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            // Change ur username
            // GestureDetector(
            //   onTap: () {
            //     _changeUserName(context);
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Text(
            //         "Nutzernamen ändern",
            //         style: TextStyle(
            //           fontSize: 12,
            //         ),
            //       ),
            //       const Icon(
            //         Icons.keyboard_arrow_right,
            //         size: 20,
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 5),
            // Change your password
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppVariables.backgroundGrey,
                      title: const Text(
                        'Passwort ändern',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      content: Container(
                        child: Form(
                          key: _formKey,
                          child: Wrap(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: const Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  ),
                                  hintText: "Passwort",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            10,
                                  ),
                                ),
                                obscureText: _passwordVisible,
                                // check if password has more than 8 elements
                                validator: (val) => val!.length < 8
                                    ? 'Gib ein Passwort mit mindestens 8 Zeichen an'
                                    : null,
                                onChanged: (val) {
                                  setState(
                                    () => {
                                      passwordChanged = val.trim(),
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: const Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  ),
                                  hintText: "Passwort bestätigen",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            10,
                                  ),
                                ),
                                obscureText: _passwordVisible,
                                // check if both passwords are equal
                                validator: (val) =>
                                    val.toString() != passwordChanged.toString()
                                        ? 'Passwörter stimmen nicht überein'
                                        : null,
                                onChanged: (val) {
                                  setState(
                                    () => {
                                      passwordConfirm = val.trim(),
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        GestureDetector(
                          child: const Text(
                            'Abbrechen',
                          ),
                          onTap: () {
                            // Abort
                            Navigator.of(context).pop();
                          },
                        ),
                        GestureDetector(
                          child: const Text(
                            'Ändern',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // change Password database action
                              _databaseService.changePassword(username);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Passwort ändern",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            // delete your Account
            GestureDetector(
              onTap: () {
                _deleteAccount(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Account löschen",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            // logout
            Consumer<CurrentUserModel>(builder: (context, value, child) {
              return GestureDetector(
                onTap: () async {
                  value.setCurrUser();
                  await _authService.signOut().then((value) => {
                        Navigator.of(context).pop(),
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ausloggen",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 20,
                    )
                  ],
                ),
              );
            }),

            // // show own games
            // TextWithDivider("Deine Kreationen", 0.9),
            // const SizedBox(
            //   height: 5,
            // ),
            // // CreatedByUserListView(this.widget.service, this.widget.callback)
          ],
        ),
      ),
    );
  }

  // Action to change the user_name field
  void _changeUserName(context) {
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppVariables.backgroundGrey,
          title: Text('Nutzername ändern'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Gib hier deinen Wunschnamen ein.",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).textScaleFactor * 10,
                ),
              ),
              validator: (val) =>
                  val.toString().isEmpty ? 'Gib einen Namen ein' : null,
              onChanged: (val) {
                this.username = val;
              },
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Text(
                'Abbrechen',
                style: TextStyle(),
              ),
              onTap: () {
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
              },
            ),
            Consumer<CurrentUserModel>(builder: (context, value, child) {
              return GestureDetector(
                child: Text(
                  'Ändern',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Hier passiert etwas anderes
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _databaseService.changeUserName(this.username);
                    });
                    value.updateCurrentUser();
                    Navigator.of(context).pop();
                  }
                },
              );
            }),
          ],
        );
      },
    );
  }

  // Action to delete the whole user Account
  void _deleteAccount(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppVariables.backgroundGrey,
          title: Text('Account löschen'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Text(
              "Bist du sicher, dass du deinen Account löschen möchtest? Diese Aktion kann nicht rückgängig gemacht werden."),
          actions: <Widget>[
            GestureDetector(
              child: Text(
                'Abbrechen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Consumer<CurrentUserModel>(builder: (context, value, child) {
              return GestureDetector(
                child: Text('Bestätigen'),
                onTap: () async {
                  value.setCurrUser();
                  await _databaseService.deleteAccount(context);
                },
              );
            }),
          ],
        );
      },
    );
  }
}

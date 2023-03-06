import 'dart:convert';

import 'package:beerballer_new/utils/appVariables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emailjs/emailjs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:http/http.dart' as http;

class OwnGameForm extends StatefulWidget {
  OwnGameForm();
  @override
  _OwnGameFormState createState() => _OwnGameFormState();
}

class _OwnGameFormState extends State<OwnGameForm> {
  String colText = '';
  bool messageLoading = false;

  void initState() {
    Future.delayed(
      Duration.zero,
      () => {
        _showExplainDialog(context),
      },
    );
    super.initState();
  }

  late XFile? _imageFile;
  bool _load = false;
  int _index = 0;
  final gameNameController = TextEditingController();
  final playerNumberController = TextEditingController();
  final gameDurationController = TextEditingController();
  final materialsController = TextEditingController();
  final funFactorController = TextEditingController();
  final drunknessFactorController = TextEditingController();
  final difficultyController = TextEditingController();
  final explanationsController = TextEditingController();
  final imagePathController = TextEditingController();
  final dirtyFactorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GameForm(context),
    );
  }

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    XFile pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = (await picker.pickImage(
        source: ImageSource.gallery,
      ))!;
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = (await picker.pickImage(
        source: ImageSource.camera,
      ))!;
    }

    setState(() {
      // ignore: unnecessary_null_comparison
      if (pickedFile != null) {
        _imageFile = pickedFile; // Use if you only need a single picture
        _load = true;
      } else {
        print('No image selected.');
      }
    });
  }

  // ignore: non_constant_identifier_names
  Widget GameForm(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          "Erstelle dein eigenes Spiel",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildStepper(context),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Theme _buildStepper(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.orange,
        secondaryHeaderColor: Colors.white,
      ),
      child: Stepper(
        margin: EdgeInsets.only(left: 64, right: 24, top: 0, bottom: 0),
        physics: ScrollPhysics(),
        currentStep: _index,
        onStepContinue: () {
          if (_index < 4) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: controls.onStepCancel,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: AppVariables.buttonColor,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  "Zurück",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: controls.onStepContinue,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppVariables.buttonColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Text("Weiter",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ],
          );
        },
        steps: <Step>[
          Step(
            title: const Text("Name deines Spieles",
                style: TextStyle(color: Colors.white)),
            content: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.gamepad,
                    color: Colors.white,
                  ),
                  labelText: 'Spielname',
                  labelStyle: TextStyle(color: Colors.white)),
              controller: gameNameController,
            ),
            isActive: _index >= 0,
            state: _index >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text("Spieleranzahl und Spieldauer",
                style: TextStyle(color: Colors.white)),
            content: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.people, color: Colors.white),
                    labelText: 'Spieleranzahl',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: playerNumberController,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.timelapse, color: Colors.white),
                      labelText: 'Spieledauer (in Minuten)',
                      labelStyle: TextStyle(color: Colors.white)),
                  controller: gameDurationController,
                )
              ],
            ),
            isActive: _index >= 0,
            state: _index >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text("Action, Betrinkskala und Flirtfaktor",
                style: TextStyle(color: Colors.white)),
            content: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.sentiment_satisfied_alt_outlined,
                        color: Colors.white),
                    labelText: 'Action (in %)',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: funFactorController,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.local_drink_rounded,
                        color: Colors.white),
                    labelText: 'Betrinkskala (in %)',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: drunknessFactorController,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.directions_run_sharp,
                        color: Colors.white),
                    labelText: 'Flirtfaktor (in %)',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: dirtyFactorController,
                ),
              ],
            ),
            isActive: _index >= 0,
            state: _index >= 2 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text("Spielerklärung",
                style: TextStyle(color: Colors.white)),
            content: TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: const InputDecoration(
                icon: const Icon(Icons.text_snippet_outlined,
                    color: Colors.white),
                labelText: 'Schreibe eine Spielerklärung',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: explanationsController,
            ),
            isActive: _index >= 0,
            state: _index >= 3 ? StepState.complete : StepState.disabled,
          ),
          // Step(
          //   title: const Text("Ein Bild für dein Spiel",
          //       style: TextStyle(color: Colors.white)),
          //   content: Column(
          //     children: [
          //       Center(
          //         child: _load
          //             ? Container(
          //                 width: MediaQuery.of(context).size.width * 0.75,
          //                 height: MediaQuery.of(context).size.width * 0.75,
          //                 child: Image.file(
          //                   File(_imageFile!.path),
          //                   fit: BoxFit.cover,
          //                 ),
          //               )
          //             : Text(
          //                 "Hier kannst du ein Bild deines Spiels hinzufügen.",
          //                 style: TextStyle(fontSize: 14, color: Colors.white)),
          //       ),
          //       Center(
          //         child: Container(
          //           width: MediaQuery.of(context).size.width * 0.12,
          //           height: MediaQuery.of(context).size.width * 0.12,
          //           child: Center(
          //             child: IconButton(
          //               icon: Icon(
          //                 _load
          //                     ? Icons.change_circle
          //                     : Icons.add_photo_alternate_outlined,
          //                 color: Colors.white,
          //               ),
          //               onPressed: () => {
          //                 getImage(true),
          //               },
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          //   isActive: _index >= 0,
          //   state: _index >= 4 ? StepState.complete : StepState.disabled,
          // ),
          Step(
            title:
                const Text("Abschicken", style: TextStyle(color: Colors.white)),
            content: new Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      new ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: AppVariables.buttonColor,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Abschicken!',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (checkController()) {
                            setState(() {
                              this.colText = "";
                              messageLoading = true;
                            });
                            sendEMail();
                          } else {
                            setState(() {
                              this.colText =
                                  "Bitte überprüfe, ob du überall etwas eingegeben hast! 😉";
                              messageLoading = false;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      messageLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Text(
                    this.colText,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            isActive: _index >= 0,
            state: _index == 5 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }

  bool checkController() {
    if (this.gameNameController.value.text.isNotEmpty &&
        this.playerNumberController.value.text.isNotEmpty &&
        this.gameDurationController.value.text.isNotEmpty &&
        this.funFactorController.value.text.isNotEmpty &&
        this.drunknessFactorController.value.text.isNotEmpty &&
        this.dirtyFactorController.value.text.isNotEmpty &&
        this.explanationsController.value.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void _showExplainDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Du kennst ein geiles Trinkspiel, das unbedingt noch in diese App sollte?!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppVariables.backgroundCol,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Text(
            "Hier hast du die Möglichkeit dein eigenes Spiel zu erstellen. Trage dafür alle notwendigen Informationen ein und klicke auf den"
            "''Abschicken!''"
            "-Button.\n\nWir kümmern uns dann darum, dass dein Spiel schon bald für alle sichtbar ist!",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Text(
                'Ok!',
                style: TextStyle(color: AppVariables.darkAccent),
              ),
              onTap: () {
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  sendEMail() async {
    final serviceID = "service_x8mry0k";
    final templateID = "template_vtqb6zr";
    String msg = 'Name des Spiels:' +
        this.gameNameController.value.text +
        "\n" +
        "Spieleranzahl: " +
        this.playerNumberController.value.text +
        "\n" +
        "Spieledauer: " +
        this.gameDurationController.value.text +
        "\n" +
        "Spaßfaktor: " +
        this.funFactorController.value.text +
        "\n" +
        "Betrinkskala: " +
        this.drunknessFactorController.value.text +
        "\n" +
        "Dirtyfaktor: " +
        this.dirtyFactorController.value.text +
        "\n" +
        "Erklärung: " +
        this.explanationsController.value.text;
    // final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    try {
      await EmailJS.send(
        serviceID,
        templateID,
        {
          'user_name': FirebaseAuth.instance.currentUser!.uid,
          'user_message': msg.toString(),
        },
        const Options(
            publicKey: 'ezpFPEOMfzKwo8atT',
            privateKey: 'ZsTU_wZP4Wltbmw_LTWwG'),
      );
      print('SUCCESS!');
      setState(() {
        messageLoading = false;
      });
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text('Da ist leider etwas schief gelaufen. Versuche es am Besten nach einem Neustart der App nochmal!'),
      ));
      print(error.toString());
    }
  }

  void _showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Klasse!'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Text(
              'Danke! Wir überprüfen das Spiel, sobald es von uns bearbeitet und hinzugefügt wurde, wirst du es im "Spiele der Community"-Tab sehen! '),
          actions: <Widget>[
            GestureDetector(
              child: Text('Ok!'),
              onTap: () {
                // Hier passiert etwas anderes
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

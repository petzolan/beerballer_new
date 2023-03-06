import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';

class PopupEmoji extends StatefulWidget {
  PopupEmoji();

  @override
  _PopupEmojiState createState() => _PopupEmojiState();
}

class _PopupEmojiState extends State<PopupEmoji> {
  final _formKey = GlobalKey<FormState>();
  String sammlungName = '';
  Icon _selected = Icon(
    Icons.emoji_emotions,
    color: Colors.white,
  );

  _changeIcon(Icon icon) {
    setState(() {
      _selected = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: AppVariables.backgroundGrey,
        title: Text(
          'Neue Sammlung erstellen',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        content: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Gib hier den Namen der Sammlung ein.",
                fillColor: Colors.white,
                hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor * 13,
                    color: Colors.white),
              ),
              validator: (val) =>
                  val.toString().isEmpty ? 'Gib einen Namen ein' : null,
              onChanged: (val) {
                this.sammlungName = val;
              },
            ),
            // ],
            // ),
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
          GestureDetector(
              child: Text(
                'Bestätigen',
                style: TextStyle(color: AppVariables.buttonColor),
              ),
              onTap: () {
                // Hier passiert etwas anderes

                if (_formKey.currentState!.validate()) {
                  setState(() {
                    DatabaseService.instance.addToUserCollections(sammlungName);
                  });
                  Navigator.of(context).pop();
                }
              })
        ]);
  }
}

enum MenuItem { item1, item2, item3, item4 }

import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';

import 'piccolo.dart';

class AddPlayersScreen extends StatefulWidget {
  @override
  _AddPlayersScreenState createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<String> players = <String>[];

  final List<String> playerIcons = [
    "😛",
    "😘",
    "😎",
    "🥳",
    "😏",
    "🤠",
    "😉",
    "🤗",
    "🤬",
    "🤩",
    "🤓",
    "🤣",
    "😃",
    "🐵",
    "😴",
    "🥴",
  ];

  @override
  void initState() {
    // Future.delayed(
    //   Duration.zero,
    //   () => {
    //     _showExplainDialog(context),
    //   },
    // );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.backgroundCol,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
        title: Column(
          children: [
            Image.asset(
              "lib/assets/images/schriftzugWeiß.png",
              width: 150,
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: Text(
                "Trinkolo",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Hubballi",
                    fontSize: 25.0),
              ),
            ),
          ],
        ),
        leading: InkWell(
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppVariables.darkAccent),
            onPressed: () => Navigator.of(context).pop(),
            iconSize: 30,
          ),
        ),
      ),
      body: players.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    "Klicke auf das + um Spieler hinzuzufügen und auf den -> um mit dem Spielen zu beginnen.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : ListView(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              children: players.map((e) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, right: 100.0, left: 100.0, bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppVariables.buttonColor,
                      shape: StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          playerIcons[players.indexOf(e) % players.length] +
                              "   " +
                              e,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              players.remove(e);
                            });
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => {_displayDialog(), print(players.length)},
              tooltip: 'Spieler hinzufügen',
              child: Icon(Icons.add)),
          SizedBox(width: 25),
          FloatingActionButton(
              onPressed: () {
                this.players.length > 0
                    ? showDialog(
                        context: context,
                        builder: (_) => Piccolo(this.players),
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 5),
                        content:
                            Text('Füge bitte mindestens einen Spieler hinzu'),
                      ));
              },
              tooltip: 'Weiter',
              child: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppVariables.backgroundGrey,
          title: const Text('Neuen Spieler hinzufügen'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: 'Spielername',
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: const Text('Abbrechen'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              child: const Text(
                'Hinzufügen',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void _addTodoItem(String name) {
    setState(() {
      players.add(name);
    });
    _textFieldController.clear();
  }
}

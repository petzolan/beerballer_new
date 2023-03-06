import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/jokes.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Picolo/aufgabe.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Picolo/virus.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Picolo/virusQuestion.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';

import 'players.dart';

class Piccolo extends StatefulWidget {
  List<String> players;
  Piccolo(this.players);

  @override
  _PiccoloState createState() => _PiccoloState();
}

class _PiccoloState extends State<Piccolo> {
  Players listOfPlayers = new Players();
  Map<String, String> virusMap = new Map();
  List<Virus> virusListe = virus;
  List<Jokes> aufgabenListe = piccoloAufgaben;
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    _addPlayersToMap();
    virusListe.shuffle();
    aufgabenListe.shuffle();
    // Future.delayed(
    //   Duration.zero,
    //   () => {
    //     _showExplainDialog(context),
    //   },
    // );
    super.initState();
  }

  // void _showExplainDialog(context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SwipeExplainOverlay(
  //         "Klicke auf "
  //             "Wahrheit"
  //             " um deine Frage oder auf "
  //             "Pflicht"
  //             " um deine Aufgabe zu erfahren",
  //         "Wische nach rechts, um zur nächsten Karte zu gelangen.",
  //       );
  //     },
  //   );
  // }

  String getRandomPlayer() {
    this.widget.players.shuffle();
    return this.widget.players.first;
  }

  String getRandomZahl() {
    Random rnd;
    int min = 2;
    int max = 6;
    rnd = new Random();
    int zahl = min + rnd.nextInt(max - min);
    return zahl.toString();
  }

  List<Widget> createCard() {
    List<Widget> cards = [];

    virusListe.forEach((virus) {
      cards.add(Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: AppVariables.backgroundGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.25, color: Colors.black),
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Virus",
              style: TextStyle(
                  color: AppVariables.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              virus.text.contains("PLAYER")
                  ? virus.text.replaceAll("PLAYER", getRandomPlayer()) +
                      "\n\nHöre in " +
                      getRandomZahl() +
                      " Runden auf"
                  : virus.text +
                      "\n\nHöre in " +
                      getRandomZahl() +
                      " Runden auf.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ));
    });

    aufgabenListe.forEach((aufgabe) {
      cards.add(Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: AppVariables.backgroundGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.25, color: Colors.black),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Aufgabe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              aufgabe.text.contains("PLAYER")
                  ? aufgabe.text.replaceAll("PLAYER", getRandomPlayer())
                  : aufgabe.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ));
    });
    cards.shuffle();
    // cards = whoWouldQuestions
    //     .map((e) => Container(
    //         // Background
    //         padding: EdgeInsets.only(
    //           left: 20,
    //           right: 20,
    //         ),
    //         decoration: BoxDecoration(
    //           color: AppVariables.backgroundGrey,
    //           borderRadius: BorderRadius.circular(20),
    //           border: Border.all(width: 0.25, color: Colors.black),
    //         ),
    //         width: MediaQuery.of(context).size.width * 0.8,
    //         child: Stack(children: [
    //           Padding(
    //             padding: const EdgeInsets.only(top: 20.0),
    //             child: Align(
    //               alignment: Alignment.topCenter,
    //               child: FittedBox(
    //                 fit: BoxFit.fitWidth,
    //                 child: Center(
    //                   child: Text(
    //                     "Würdest du eher ...",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               ElevatedButton(
    //                 onPressed: (() => controller.swipe()),
    //                 style: ElevatedButton.styleFrom(
    //                   padding: EdgeInsets.only(
    //                       left: 40, right: 40, top: 25, bottom: 25),
    //                   primary: AppVariables.buttonColor,
    //                 ),
    //                 child: Text(
    //                   e.text.split("oder")[0],
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               Text(
    //                 "oder",
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               ElevatedButton(
    //                 onPressed: (() => controller.swipe()),
    //                 style: ElevatedButton.styleFrom(
    //                   padding: EdgeInsets.only(
    //                       left: 40, right: 40, top: 25, bottom: 25),
    //                   primary: AppVariables.buttonColor,
    //                 ),
    //                 child: Text(
    //                   e.text.split("oder")[1],
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           )
    //         ])))
    //     .toList();
    return cards;
  }

  _addPlayersToMap() {
    this.widget.players.forEach(
      (element) {
        virusMap[element] = "";
      },
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppVariables.backgroundCol,
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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.95,
          child: AppinioSwiper(
            unswipe: _unswipe,
            onSwipe: _swipe,
            controller: controller,
            cards: createCard(),
          ),
        ),
      ),
    );
  }
}

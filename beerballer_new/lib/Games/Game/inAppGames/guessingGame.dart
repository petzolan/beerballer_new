import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Sch%C3%A4tzen/guessingQuestion.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Sch%C3%A4tzen/guessingQuestions.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/swipeExplainOverlay.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class GuessingGame extends StatefulWidget {
  @override
  _GuessingGameState createState() => _GuessingGameState();
}

class _GuessingGameState extends State<GuessingGame> {
  final AppinioSwiperController controller = AppinioSwiperController();

  List<GuessingQuestion> questions = guessingQuestions;
  List<GlobalKey<FlipCardState>> flipKeys = [];

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => {
        _showExplainDialog(context),
      },
    );
    questions.shuffle();
    super.initState();
  }

  void _showExplainDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SwipeExplainOverlay(
          "Klicke auf die Karte, um die Antwort der Frage zu erfahren.",
          "Wische nach rechts, um zur nächsten Karte zu gelangen.",
        );
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

  _buildPopupDialog(BuildContext context) {
    return AlertDialog(
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
            "Und, richtig gelegen?",
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
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.1,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text
                Container(
                  child: Text(
                    "\nDas war unsere Schätzen-Challenge.",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).textScaleFactor * 13,
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
              Navigator.of(context).pop();
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              primary: AppVariables.buttonColor,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Nochmal Spielen",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).textScaleFactor * 20,
              ),
            ),
          ),
        ),
        // Closes the whole App
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              "Beenden",
              style: TextStyle(
                color: AppVariables.greyedOutText,
                fontSize: MediaQuery.of(context).textScaleFactor * 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _end() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context));
  }

  List<Widget> createCard() {
    List<Widget> cards = [];
    questions.forEach((element) {
      flipKeys.add(new GlobalKey<FlipCardState>());
    });
    for (int i = 0; i < questions.length; i++) {
      cards.add(
        Container(
          // Background
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          key: flipKeys[i],
          decoration: BoxDecoration(
            color: AppVariables.backgroundGrey,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 300,
          child: Stack(
            children: [
              const Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01),
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: FlipCard(
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.VERTICAL, // default
                            front: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                // Background
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Schätz doch mal, ...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "🤔",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      questions[i].text,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            back: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                // Background
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Wahnsinn!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "😱",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      questions[i].answer,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    };

    return cards;
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
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.95,
          child: AppinioSwiper(
            unswipe: _unswipe,
            onSwipe: _swipe,
            onEnd: _end,
            controller: controller,
            cards: createCard(),
          ),
        ),
      ),
    );
  }
}

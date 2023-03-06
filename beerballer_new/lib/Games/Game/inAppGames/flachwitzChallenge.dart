
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/flachwitzWitze.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/jokes.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/swipeExplainOverlay.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';

class FlachwitzChallenge extends StatefulWidget {
  @override
  _FlachwitzChallengeState createState() => _FlachwitzChallengeState();
}

class _FlachwitzChallengeState extends State<FlachwitzChallenge> {
  List<Jokes> joke = jokes;
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => {
        _showExplainDialog(context),
      },
    );
    jokes.shuffle();
    super.initState();
  }

  void _showExplainDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SwipeExplainOverlay(
          "",
          "Wische, um zur nächsten Karte zu gelangen.",
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
            "Genug gelacht?",
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
                    "\nDas war unsere Flachwitz-Challenge.",
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
    cards = jokes
        .map((e) => Container(
            // Background
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
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
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: [
                const Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Center(
                        child: Text(
                          "Achtung, der kommt flach! ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 5.0, color: AppVariables.buttonColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15.0,
                          ),
                        ),
                      ),
                      child: Text(
                        e.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Center(
                            child: Text(
                              "😂",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )))
        .toList();
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

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wer%20w%C3%BCrde%20eher/whoWoulQuestion.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wer%20w%C3%BCrde%20eher/whoWould.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/swipeExplainOverlay.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';


class WhoWouldGame extends StatefulWidget {
  @override
  _WhoWouldGameState createState() => _WhoWouldGameState();
}

class _WhoWouldGameState extends State<WhoWouldGame> {
  List<WhoWoulQuestion> whoWouldQuestions = whoWould;
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => {
        _showExplainDialog(context),
      },
    );
    whoWouldQuestions.shuffle();
    print(whoWouldQuestions.length);
    super.initState();
  }

  void _showExplainDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SwipeExplainOverlay(
          "",
          "Wische, um zur nächsten Entscheidung zu gelangen.",
        );
      },
    );
  }

  List<Widget> createCard() {
    List<Widget> cards = [];
    cards = whoWouldQuestions
        .map((e) => Container(
            // Background
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
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Center(
                      child: Text(
                        "Würdest du eher ...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (() => controller.swipe()),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 25, bottom: 25),
                        primary: AppVariables.buttonColor,
                      ),
                      child: Text(
                        e.text.split("oder")[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "oder",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: (() => controller.swipe()),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 25, bottom: 25),
                        primary: AppVariables.buttonColor,
                      ),
                      child: Text(
                        e.text.split("oder")[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])))
        .toList();
    return cards;
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
    return SafeArea(
      child: Scaffold(
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.95,
            child: AppinioSwiper(
              unswipe: _unswipe,
              onSwipe: _swipe,
              controller: controller,
              cards: createCard(),
            ),
          ),
        ),
      ),
    );
  }
}

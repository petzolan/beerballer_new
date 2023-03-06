import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/truthOrDareQuestion.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/truthOrDareQuestions.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/typeOfQuestion.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/swipeExplainOverlay.dart';
import 'package:beerballer_new/Widgets/textWithDivider.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../Models/InGameApp-Models/Schätzen/guessingQuestions.dart';

class TruthOrDareGame extends StatefulWidget {
  @override
  _TruthOrDareGameState createState() => _TruthOrDareGameState();
}

class _TruthOrDareGameState extends State<TruthOrDareGame> {
  int _focusedIndex = 0;
  String chosenQuestion = "";

  var cardKeys = Map<int, GlobalKey<FlipCardState>>();
  GlobalKey<FlipCardState> lastFlipped = GlobalKey<FlipCardState>();

  final AppinioSwiperController controller = AppinioSwiperController();

  // method to get correct questions
  List<TruthOrDareQuestion> dareQuestionList = _getTruthOrDareLists(
    TypeOfQuestion.dare,
  );

  List<TruthOrDareQuestion> truthQuestionList = _getTruthOrDareLists(
    TypeOfQuestion.truth,
  );

  @override
  void initState() {
    this.chosenQuestion = "truth";
    Future.delayed(
      Duration.zero,
      () => {
        _showExplainDialog(context),
      },
    );
    dareQuestionList.shuffle();
    truthQuestionList.shuffle();
    super.initState();
  }

  void _showExplainDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SwipeExplainOverlay(
          "Klicke auf "
              "Wahrheit"
              " um deine Frage oder auf "
              "Pflicht"
              " um deine Aufgabe zu erfahren",
          "Wische nach rechts, um zur nächsten Karte zu gelangen.",
        );
      },
    );
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  static List<TruthOrDareQuestion> _getTruthOrDareLists(TypeOfQuestion type) {
    // get all tasks shuffled
    List<TruthOrDareQuestion> allQuestionsList = truthOrDareQuestions;
    allQuestionsList.shuffle();

    // two empty lists
    List<TruthOrDareQuestion> dareQuestionList = [];
    List<TruthOrDareQuestion> truthQuestionList = [];

    // sort all tasks per question Type
    for (final element in allQuestionsList) {
      if (element.questiontype == TypeOfQuestion.truth) {
        truthQuestionList.add(element);
      } else if (element.questiontype == TypeOfQuestion.dare) {
        dareQuestionList.add(element);
      } else {
        print("Error CardType: " +
            element.questiontype.toString()); //TODO Here real logging
      }
    }

    if (type == TypeOfQuestion.truth) {
      return truthQuestionList;
    } else if (type == TypeOfQuestion.dare) {
      return dareQuestionList;
    } else {
      print("No type assigned"); //TODO Here log
      return allQuestionsList;
    }
  }

  List<Widget> createCard() {
    List<Widget> cards = [];
    for (var i = 0; i < 83; i++) {
      cards.add(Container(
              // Background
              // padding: EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              // decoration: BoxDecoration(
              //   color: AppVariables.backgroundGrey,
              //   borderRadius: BorderRadius.circular(20),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.5),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3), // changes position of shadow
              //     ),
              //   ],
              // ),
              // width: MediaQuery.of(context).size.width * 0.8,
              // child: Stack(
              //   children: [
              //     const Padding(
              //       padding: const EdgeInsets.only(top: 20.0),
              //       child: Align(
              //         alignment: Alignment.topCenter,
              //         child: FittedBox(
              //           fit: BoxFit.fitWidth,
              //         ),
              //       ),
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 padding: EdgeInsets.all(
              //                     MediaQuery.of(context).size.width * 0.01),
              //                 height: MediaQuery.of(context).size.height * 0.5,
              //                 child: FlipCard(
              //                   fill: Fill
              //                       .fillBack, // Fill the back side of the card to make in the same size as the front.
              //                   direction: FlipDirection.VERTICAL, // default
              //                   front: ClipRRect(
              //                     borderRadius: BorderRadius.circular(15),
              //                     child: Container(
              //                       // Background
              //                       color: AppVariables.backgroundGrey,
              //                       padding: EdgeInsets.only(
              //                         left: 20,
              //                         right: 20,
              //                       ),
              //                       width: 300,
              //                       child: Column(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceEvenly,
              //                         children: [
              //                           SizedBox(
              //                             width: double.infinity,
              //                             child: TextButton(
              //                               child: Text(
              //                                 "Wahrheit",
              //                                 style: TextStyle(
              //                                   fontSize: 35,
              //                                 ),
              //                               ),
              //                               onPressed: () => setState(() {
              //                                 this.chosenQuestion = "truth";
              //                               }),
              //                             ),
              //                           ),
              //                           TextWithDivider("oder", 0.8),
              //                           SizedBox(
              //                             width: double.infinity,
              //                             child: TextButton(
              //                               child: Text(
              //                                 "Pflicht",
              //                                 style: TextStyle(
              //                                   fontSize: 35,
              //                                 ),
              //                               ),
              //                               onPressed: () {
              //                                 setState(() {
              //                                   this.chosenQuestion = "dare";
              //                                 });
              //                               },
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),

              //                   back: ClipRRect(
              //                     borderRadius: BorderRadius.circular(15),
              //                     child: Container(
              //                       padding: EdgeInsets.only(
              //                         left: 20,
              //                         right: 20,
              //                       ),
              //                       height: 250,
              //                       width: 220,
              //                       color: AppVariables.backgroundGrey,
              //                       child: Column(children: [
              //                         SizedBox(
              //                           height: 20,
              //                         ),
              //                         Text(
              //                           this.chosenQuestion == "dare"
              //                               ? "Mach doch mal ..."
              //                               : "Verrate doch mal ...",
              //                           style: TextStyle(
              //                             fontSize: 50,
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 25,
              //                         ),
              //                         Text(
              //                           this.chosenQuestion == "dare"
              //                               ? "😳"
              //                               : "🤐",
              //                           style: TextStyle(
              //                             fontSize: 50,
              //                           ),
              //                         ),
              //                         SizedBox(
              //                           height: 50,
              //                         ),
              //                         Text(
              //                           this.chosenQuestion == "dare"
              //                               ? dareQuestionList[i].text
              //                               : truthQuestionList[i].text,
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                       ]),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // )
              )
          // FlipCard(
          //   flipOnTouch: false,
          //   direction: FlipDirection.VERTICAL, // default
          //   front: ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: Container(
          //       // Background
          //       color: AppVariables.backgroundGrey,
          //       padding: EdgeInsets.only(
          //         left: 20,
          //         right: 20,
          //       ),
          //       width: 300,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           SizedBox(
          //             width: double.infinity,
          //             child: TextButton(
          //               child: Text(
          //                 "Wahrheit",
          //                 style: TextStyle(
          //                   fontSize: 35,
          //                 ),
          //               ),
          //               onPressed: () => setState(() {
          //                 this.chosenQuestion = "truth";
          //                 e!.currentState!.toggleCard();
          //               }),
          //             ),
          //           ),
          //           TextWithDivider("oder", 0.8),
          //           SizedBox(
          //             width: double.infinity,
          //             child: TextButton(
          //               child: Text(
          //                 "Pflicht",
          //                 style: TextStyle(
          //                   fontSize: 35,
          //                 ),
          //               ),
          //               onPressed: () {
          //                 setState(() {
          //                   this.chosenQuestion = "dare";
          //                   e!.currentState!.toggleCard();
          //                 });
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //   back: ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: Container(
          //       padding: EdgeInsets.only(
          //         left: 20,
          //         right: 20,
          //       ),
          //       height: 250,
          //       width: 220,
          //       color: AppVariables.backgroundGrey,
          //       child: Column(children: [
          //         SizedBox(
          //           height: 20,
          //         ),
          //         Text(
          //           this.chosenQuestion == "dare"
          //               ? "Mach doch mal ..."
          //               : "Verrate doch mal ...",
          //           style: TextStyle(
          //             fontSize: 50,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 25,
          //         ),
          //         Text(
          //           this.chosenQuestion == "dare" ? "😳" : "🤐",
          //           style: TextStyle(
          //             fontSize: 50,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 50,
          //         ),
          //         Text(
          //           this.chosenQuestion == "dare"
          //               ? dareQuestionList[i].text
          //               : truthQuestionList[i].text,
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 18,
          //           ),
          //         ),
          //       ]),
          //     ),
          //   ),
          // ),
          );
    }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.01,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ScrollSnapList(
                    itemSize: 300,
                    duration: 1000,
                    dynamicItemSize: true,
                    onItemFocus: _onItemFocus,
                    itemCount: guessingQuestions.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      cardKeys.putIfAbsent(
                          index, () => GlobalKey<FlipCardState>());
                      GlobalKey<FlipCardState>? thisCard = cardKeys[index];
                      return FlipCard(
                        key: thisCard,
                        flipOnTouch: false,
                        onFlip: () {
                          if (lastFlipped != thisCard) {
                            lastFlipped.currentState?.toggleCard();
                            lastFlipped = thisCard!;
                          }
                        },
                        fill: Fill
                            .fillBack, // Fill the back side of the card to make in the same size as the front.
                        direction: FlipDirection.VERTICAL, // default
                        front: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppVariables.backgroundGrey,
                            ),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        this.chosenQuestion = "truth";
                                        cardKeys[index]!
                                            .currentState!
                                            .toggleCard();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 25,
                                          bottom: 25),
                                      primary: AppVariables.buttonColor,
                                    ),
                                    child: Text(
                                      "Wahrheit",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                TextWithDivider("oder", 0.8),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        this.chosenQuestion = "dare";
                                        cardKeys[index]!
                                            .currentState!
                                            .toggleCard();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 25,
                                          bottom: 25),
                                      primary: AppVariables.buttonColor,
                                    ),
                                    child: Text(
                                      "Pflicht",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        back: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            height: 250,
                            width: 220,
                            color: AppVariables.backgroundGrey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  this.chosenQuestion == "dare"
                                      ? "Mach doch mal ..."
                                      : "Verrate doch mal ...",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  this.chosenQuestion == "dare" ? "😳" : "🤐",
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  this.chosenQuestion == "dare"
                                      ? dareQuestionList[index].text
                                      : truthQuestionList[index].text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

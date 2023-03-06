import 'package:beerballer_new/Games/Game/GameExplanation/explanationCard.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/gameFavoriteButton.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/scales.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/searchGameBar.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

// Wird von HomeTab aufgerufen
class GameOverviewTab extends StatefulWidget {
  String selectedCategory;

  GameOverviewTab(this.selectedCategory);

  @override
  _GameOverviewTabState createState() => _GameOverviewTabState();
}

class _GameOverviewTabState extends State<GameOverviewTab> {
  Stream<QuerySnapshot<Map<String, dynamic>>>? searching;
  bool searchingForGame = false;
  final controller = ScrollController();

  @override
  void initState() {
    this.searching = DatabaseService.instance
        .getGamesByCategoryName(this.widget.selectedCategory);
    super.initState();
  }

  void callback(
    Stream<QuerySnapshot<Map<String, dynamic>>> docs,
    bool isEmpty,
  ) {
    setState(() {
      this.searchingForGame = isEmpty;
      this.searching = docs;
    });
  }

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
      body: Column(
        children: [
          // Kategoriename
          Text(
            this.widget.selectedCategory,
            style: TextStyle(
              color: AppVariables.buttonColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // SearchGameBar
          SearchGameBar(callback),
          // Einzelnen Cards
          Flexible(
            child: StreamBuilder(
              stream: this.searching,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Lädt ..."),
                  );
                }
                // Einzelnen Spiele
                return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildGridElement(snapshot.data!.docs[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildGridElement(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    List<dynamic> gameTags = doc.get("tags");
    bool inApp = gameTags.contains("in_app");
    Game game = Game.fromSnapshot(doc);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // öffnet die Spielansicht
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.1, end: 1).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.decelerate,
                    ),
                  ),
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return ExplanationCard(game);
              },
            ),
          );
        },
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: doc.get("image_url"),
                  ),
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        doc.get("game_name"),
                        style: TextStyle(fontFamily: "Hubballi", fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.165,
                ),
                decoration: BoxDecoration(
                  color: AppVariables.backgroundGrey,
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),

                      // Skalen des Spiels
                      Scales(Game.fromSnapshot(doc)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      // Anzahl Likes des Spiels
                      Text(
                        "Gefällt " +
                            doc.get("amount_liked").toString() +
                            " Personen",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 12,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      // In App?
                      inApp
                          ? Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              decoration: BoxDecoration(
                                  borderRadius: AppVariables.borderRadius,
                                  border: Border.all(
                                      color: AppVariables.buttonColor)),
                              child: Text(
                                "In-App Spiel",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          12,
                                  color: AppVariables.buttonColor,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  child: GameFavoriteButton(game),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

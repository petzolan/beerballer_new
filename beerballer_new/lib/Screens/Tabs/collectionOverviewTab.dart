import 'package:beerballer_new/Games/Game/GameExplanation/explanationCard.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/gameFavoriteButton.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/scales.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/searchGameBar.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

// Wird von HomeTab aufgerufen
class CollectionOverviewTab extends StatefulWidget {
  String selectedCollection;

  CollectionOverviewTab(this.selectedCollection);

  @override
  _CollectionOverviewTabState createState() => _CollectionOverviewTabState();
}

class _CollectionOverviewTabState extends State<CollectionOverviewTab> {
  final controller = ScrollController();
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream = Stream.empty();
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot querySnapshot) {
      setState(() {
        games = querySnapshot
            .get("user_collections")[this.widget.selectedCollection];
      });
      stream = FirebaseFirestore.instance
          .collection("game_collection")
          .where("game_name", whereIn: games)
          .snapshots();
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
            this.widget.selectedCollection,
            style: TextStyle(
                color: AppVariables.buttonColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          // Einzelnen Cards
          Flexible(
            child: StreamBuilder(
              stream: stream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Hier sind noch keine Spiele 🥴"),
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
    List gameTags = doc.get("tags");
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
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.17,
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
                        // Name des Spiels
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            doc.get("game_name"),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 12,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        // In App?
                        inApp
                            ? Container(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.05,
                                    right: MediaQuery.of(context).size.width *
                                        0.05),
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
                            : Container()
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(child: GameFavoriteButton(game))),
              ],
            ),
          )),
    );
  }
}

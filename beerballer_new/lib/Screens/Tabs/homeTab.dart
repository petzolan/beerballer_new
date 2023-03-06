import 'package:beerballer_new/Models/sideMenuModel.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gameOverviewTab.dart';

// Kind von ScreenController
// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  String currSelection = "In-App Spiele";

  HomeTab();

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Alle Kategorien sollen in Kacheln angezeigt werden
      stream: DatabaseService.instance.getGameCategories(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text("Lädt ..."),
          );
        }
        return Container(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              // Kategorien
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, mainIndex) {
                  return Consumer<SideMenuModel>(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          value.currentState
                              ? value.toggleSideMenu()
                              : Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: Tween<double>(begin: 0.1, end: 1)
                                            .animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.decelerate,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return GameOverviewTab(snapshot
                                          .data!.docs[mainIndex]
                                          .get('name')
                                          .toString());
                                    },
                                  ),
                                );
                        },
                        // In-App-Spiele-Card bauen
                        child: snapshot.data!.docs[mainIndex].get('name') ==
                                'In-App Spiele'
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                  left: AppVariables.paddingHeight * 2,
                                  right: AppVariables.paddingHeight * 2,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/orangeController.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: AppVariables.borderRadius,
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      left: AppVariables.paddingHeight),
                                  child: Text(
                                    "In-App Spiele",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.builder(
                  itemCount: snapshot.data!.docs.length - 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                    childAspectRatio: 5 / 3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Consumer<SideMenuModel>(
                      builder: ((context, value, child) {
                        // Klick auf Karte
                        return GestureDetector(
                            onTap: () {
                              // Wenn side menu offen ist
                              value.currentState
                                  // schließ es
                                  ? value.toggleSideMenu()
                                  // ansonsten öffne Ansicht
                                  : Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return ScaleTransition(
                                            alignment: Alignment.center,
                                            scale: Tween<double>(
                                                    begin: 0.1, end: 1)
                                                .animate(
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.decelerate,
                                              ),
                                            ),
                                            child: child,
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return GameOverviewTab(
                                            snapshot.data!.docs[index + 1]
                                                .get('name')
                                                .toString(),
                                          );
                                        },
                                      ),
                                    );
                            },
                            // Kategorie-Card
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    horizontal:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                  padding: EdgeInsets.only(
                                    bottom: AppVariables.paddingHeight * 0.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppVariables.backgroundGrey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    snapshot.data!.docs[index + 1].get('name'),
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Bild der Kategorie
                                _getAssetImageForCat(
                                  snapshot.data!.docs[index + 1].get('name'),
                                  context,
                                ),
                              ],
                            ));
                      }),
                    );
                  },
                ))
          ]),
        );
      },
    );
  }
}

_getAssetImageForCat(String pString, BuildContext context) {
  switch (pString) {
    case "Alle Spiele":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            image: AssetImage(
              "lib/assets/images/Alle Spiele.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      );
    case "Würfelspiele":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "lib/assets/images/Würfelspiele.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.225,
        ),
      );
    case "Kartenspiele":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "lib/assets/images/Kartenspiele.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      );
    case "Klassiker":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "lib/assets/images/Kultspiele.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.2,
        ),
      );
    case "Kaum Material":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "lib/assets/images/wenig Material.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      );
    case "Becherspiele":
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Image(
            alignment: Alignment.topLeft,
            image: AssetImage(
              "lib/assets/images/Becherspiele.png",
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      );
  }
}

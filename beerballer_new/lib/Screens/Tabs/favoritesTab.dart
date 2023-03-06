import 'package:beerballer_new/Widgets/GameCollection/addNewGameCollection.dart';
import 'package:beerballer_new/Models/currentUserModel.dart';
import 'package:beerballer_new/Models/firestoreModels/currentUser.dart';
import 'package:beerballer_new/Models/sideMenuModel.dart';
import 'package:beerballer_new/Screens/Tabs/collectionOverviewTab.dart';
import 'package:beerballer_new/Screens/Tabs/popupEmoji.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/main.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_arrows/widget_arrows.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  late Collection _sammlung;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // remove item from sammlung
  CurrUser _removeItem(int index, CurrUser pCurrUser) {
    _listKey.currentState!.removeItem(
      index,
      (_, animation) => SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: AppVariables.buttonColor,
          child: ListTile(
            title: Text("Deleted"),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
    CurrUser temp = pCurrUser;
    setState(() {
      CurrUser temp = DatabaseService.instance.deleteSammlung(
        pCurrUser.collections.collectionMap.keys.elementAt(index),
        pCurrUser,
      );
    });
    return temp;
  }

  // Action to add new sammlung
  void _showAddDialouge(context) {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopupEmoji();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder(
          stream: DatabaseService.instance.getUserCollections(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Lädt ..."),
              );
            }
            return Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.125,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      itemCount:
                          snapshot.data!.get("user_collections").keys.length,
                      itemBuilder: (context, mainIndex) {
                        String _keyName = snapshot.data!
                            .get("user_collections")
                            .keys
                            .elementAt(mainIndex);
                        return Consumer<SideMenuModel>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              child: _keyName == 'Gefällt dir'
                                  ? Container(
                                      child: Card(
                                        margin: EdgeInsets.all(10),
                                        color: AppVariables.buttonColor,
                                        child: ListTile(
                                          title: Text(
                                            _keyName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(1.0, 1.0),
                                                  blurRadius: 1.0,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          subtitle: Text(snapshot.data!
                                                  .get("user_collections")
                                                  .entries
                                                  .elementAt(mainIndex)
                                                  .value
                                                  .length
                                                  .toString() +
                                              " Spiele"),
                                          trailing: _keyName == "Gefällt dir"
                                              ? Container(
                                                  width: 0.1,
                                                )
                                              : IconButton(
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  onPressed: () {
                                                    setState(() {
                                                      DatabaseService.instance
                                                          .deleteFromUserCollections(
                                                              _keyName);
                                                    });
                                                  }),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              onTap: () {
                                value.currentState
                                    ? value.toggleSideMenu()
                                    : Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
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
                                              return CollectionOverviewTab(
                                                _keyName,
                                              );
                                            }),
                                      );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      itemCount:
                          snapshot.data!.get("user_collections").keys.length,
                      itemBuilder: (context, mainIndex) {
                        String _keyName = snapshot.data!
                            .get("user_collections")
                            .keys
                            .elementAt(mainIndex);
                        return Consumer<SideMenuModel>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              child: _keyName != 'Gefällt dir'
                                  ? Container(
                                      child: Card(
                                        margin: EdgeInsets.all(10),
                                        color: AppVariables.backgroundGrey,
                                        child: ListTile(
                                          title: Text(
                                            _keyName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(1.0, 1.0),
                                                  blurRadius: 1.0,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          subtitle: Text(snapshot.data!
                                                  .get("user_collections")
                                                  .entries
                                                  .elementAt(mainIndex)
                                                  .value
                                                  .length
                                                  .toString() +
                                              " Spiele"),
                                          trailing: _keyName == "Gefällt dir"
                                              ? Container(
                                                  width: 0.1,
                                                )
                                              : IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      DatabaseService.instance
                                                          .deleteFromUserCollections(
                                                              _keyName);
                                                    });
                                                  }),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              onTap: () {
                                value.currentState
                                    ? value.toggleSideMenu()
                                    : Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
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
                                              return CollectionOverviewTab(
                                                _keyName,
                                              );
                                            }),
                                      );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.125,
          right: -55,
          child: Padding(
            padding: EdgeInsets.only(
              left: 60,
              right: 80,
              top: AppVariables.paddingHeight,
            ),
            child: 
            AddNewGameCollection()           
            // GestureDetector(
            //   onTap: () {
            //     setState(
            //       () {
            //         _showAddDialouge(context);
            //       },
            //     );
            //   },
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppVariables.buttonColor,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.3),
            //           spreadRadius: 5,
            //           blurRadius: 7,
            //           offset: Offset(0, 3), // changes position of shadow
            //         ),
            //       ],
            //     ),
            //     child: Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ),
        )
      ],
    );
  }
}

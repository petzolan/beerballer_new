import 'package:beerballer_new/Models/firestoreModels/categoryItem.dart';
import 'package:beerballer_new/Screens/shop/itemCategoriesTab.dart';
import 'package:beerballer_new/Screens/shop/shopCategoryOverviewTab.dart';
import 'package:beerballer_new/Screens/shop/shopCategoryOverviewTabBestseller.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/sideMenuModel.dart';
import '../../utils/appVariables.dart';

class EventTab extends StatelessWidget {
  EventTab();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.instance.getShopCategoriesOverview(),
        builder: (context, AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
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
                                      return ShopCategoryOverviewTabBestseller(
                                          snapshot.data!.docs[mainIndex]);
                                    },
                                  ),
                                );
                        },
                        // In-App-Spiele-Card bauen
                        child: snapshot.data!.docs[mainIndex].get('name') ==
                                'Bestseller'
                            ? Container(
                                padding: EdgeInsets.all(8),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                margin: EdgeInsets.only(
                                  left: AppVariables.paddingHeight * 2,
                                  right: AppVariables.paddingHeight * 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    alignment: Alignment.centerRight,
                                    image: AssetImage(
                                      "lib/assets/images/blackCups.png",
                                    ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  borderRadius: AppVariables.borderRadius,
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      left: AppVariables.paddingHeight),
                                  child: Text(
                                    "Bestseller",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 8,
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
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              SideMenuModel.sideMenuKey.currentState!.isOpened
                                  ? value.toggleSideMenu()
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
                                          return ShopCategoryOverviewTab(
                                              snapshot.data!.docs[index + 1]);
                                        },
                                      ),
                                    );
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  // change this height so change height of grey
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
                                  child: 
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        // change this height so change height of grey
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        padding: EdgeInsets.only(
                                          bottom:
                                              AppVariables.paddingHeight * 0.5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppVariables.backgroundGrey,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index + 1]
                                              .get('name'),
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .textScaleFactor *
                                                18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ), // Bild der Kategorie
                                    
                                  
                                ),
                                _getAssetImageForCat(
                                    snapshot.data!.docs[index + 1].get('name'),
                                    context),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          );
        });
  }

  _getAssetImageForCat(String pString, BuildContext context) {
    switch (pString) {
      case "Events":
        return Align(
          alignment: Alignment.topCenter,

          // top: MediaQuery.of(context).size.height * -0.01,
          child: Container(
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage(
                "lib/assets/images/events.png",
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        );
      case "Trinkspiele":
        return Align(
          alignment: Alignment.topCenter,

          // top: 0,
          // left: MediaQuery.of(context).size.width * -0.075,
          child: Container(
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage(
                "lib/assets/images/trinkspiele.png",
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.225,
          ),
        );
      case "Clothing":
        return Align(
          alignment: Alignment.topCenter,

          // top: 0,
          // left: MediaQuery.of(context).size.width * 0.0,
          child: Container(
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage(
                "lib/assets/images/clothing.png",
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        );
      case "Bestseller":
        return Align(
          alignment: Alignment.topCenter,

          // top: 0,
          // left: MediaQuery.of(context).size.width * 0.0,
          child: Container(
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage(
                "lib/assets/images/clothing.png",
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        );
      case "Beer Pong":
        return Align(
          alignment: Alignment.topCenter,

          // top: 0,
          // left: MediaQuery.of(context).size.width * 0.02,
          child: Container(
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage(
                "lib/assets/images/beerpong.png",
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.25,
          ),
        );
    }
  }
}

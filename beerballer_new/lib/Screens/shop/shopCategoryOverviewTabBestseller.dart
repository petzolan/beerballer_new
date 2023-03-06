import 'package:beerballer_new/Screens/shop/shopExplanationCard.dart';
import 'package:beerballer_new/Models/firestoreModels/categoryItem.dart';
import 'package:beerballer_new/Models/firestoreModels/eventItem.dart';
import 'package:beerballer_new/Models/firestoreModels/shopItem.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopCategoryOverviewTabBestseller extends StatefulWidget {
  QueryDocumentSnapshot<dynamic> categoryItem;
  // String categoryName;
  // String shopitemCategoryName;
  ShopCategoryOverviewTabBestseller(this.categoryItem);

  // ShopCategoryOverviewTab(this.categoryName, this.shopitemCategoryName);

  @override
  _ShopCategoryOverviewTabBestsellerState createState() =>
      _ShopCategoryOverviewTabBestsellerState();
}

class _ShopCategoryOverviewTabBestsellerState extends State<ShopCategoryOverviewTabBestseller> {
  Stream<QuerySnapshot<dynamic>>? streamProducts;
  final controller = ScrollController();
  CategoryItem item = CategoryItem(name: "", categories: []);
  String eventPic = "lib/assets/images/barBachelor.png";

  @override
  void initState() {
    this.item = CategoryItem.fromSnapshot(this.widget.categoryItem);

    // internes item machen
    // callback(this.widget.shopitemCategoryName);

    super.initState();
  }

  void callback(String categoryName) {
    print("Callback ShopListView wurde aufgerufen - update Shopanzeige");
    setState(
      () {
        this.streamProducts = updateShopItems(categoryName);
        categoryName == "Bar Bachelor"
            ? this.eventPic = "lib/assets/images/barBachelor.jpg"
            : this.eventPic = "lib/assets/images/beerNight.jpg";
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? updateShopItems(
    String pCategoryName,
  ) {
    return DatabaseService.instance.getItemsForCat(pCategoryName, item.name
        //  this.widget.categoryName,
        );
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
            item.name,
            style: TextStyle(
              color: AppVariables.buttonColor,
              fontSize: 20,
            ),
          ),
          // Einzelnen Cards
          Flexible(
            child: StreamBuilder(
              stream: DatabaseService.instance.getBestseller(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Lädt ..."),
                  );
                }
                // Einzelnen Elemente
                return this.item.name == "Events"
                    ? SingleChildScrollView(
                        child: Container(
                          height: this.eventPic.contains("barBachelor")
                              ? MediaQuery.of(context).size.height * 1.4
                              : MediaQuery.of(context).size.height * 1.8,
                          child: Column(
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  this.eventPic,
                                ),
                              ),
                            ),
                            Text(
                              this.eventPic.contains("barBachelor")
                                  ? "10 Bars - 10 Drinks - 1 Bachelor"
                                  : "READY - SET - THROW - (DRINK)!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                this.eventPic.contains("barBachelor")
                                    ? "Es stehen wieder Klausuren an. Lege alle 10 (Bar-)Prüfungen ab und trage diese in dein Studienheft ein. " +
                                        "Im Anschluss findet die große Graduiertenfeier mit Urkunde statt. \n\n" +
                                        "Erlebe einen unvergesslichen Abend und sichere dir den (zweit) wichtigsten Abschluss des Studiums: "
                                    : "Die BEER PONG NIGHT ist die erste wöchentliche Veranstaltung, bei der sich Alles um das American Beer Pong dreht!" +
                                        "Verbringe einen entspannten Abend mit deinen Freunden und werfe nebenher noch ein paar Bälle, während ihr versucht bis ins Finale vorzustoßen!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            this.eventPic.contains("barBachelor")
                                ? Text(
                                    "Den Bar Bachelor!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                : Container(),
                            Expanded(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 0.25,
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return _buildEventOverview(
                                      snapshot.data!.docs[index]);
                                },
                              ),
                            ),
                          ]),
                        ),
                      )
                    : GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 4 / 5,
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

  _buildEventOverview(QueryDocumentSnapshot<dynamic> doc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // öffnet die Spielansicht
          EventItem i = EventItem.fromSnapshot(doc);
          _launchURL(
            i.weblink,
          );
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppVariables.darkAccent),
              borderRadius: BorderRadius.circular(40.0)),
          child: (FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              doc.get("location"),
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ),
      ),
    );
  }

  _buildGridElement(QueryDocumentSnapshot<dynamic> doc) {
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
                  return ShopExplanationCard(ShopItem.fromSnapshot(doc));
                },
              ),
            );
          },
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: AppVariables.backgroundGrey,
                  ),
                  child: Container(
                    
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.11),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.scaleDown,
                        imageUrl: doc.get("image_path"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        children: [
                          Text(
                            doc.get("name"),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doc.get("description"),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                height: 5,
                                indent: 5,
                                thickness: 2,
                                endIndent: 5,
                                color: AppVariables.brightAccent,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                doc.get("price") + " €",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: VerticalDivider(
                                  width: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Mehr Infos",
                                style: TextStyle(
                                  color: AppVariables.buttonColor,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  _launchURL(String weblink) async {
    if (await canLaunch(weblink)) {
      print(weblink);
      await launch(weblink);
    } else {
      throw 'Could not launch $weblink';
    }
  }
}

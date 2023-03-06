import 'package:beerballer_new/Models/firestoreModels/categoryItem.dart';
import 'package:beerballer_new/Screens/shop/shopCategoryOverviewTab.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/sideMenuModel.dart';
import '../../utils/appVariables.dart';

class ItemCategoriesTab extends StatefulWidget {
  QueryDocumentSnapshot<dynamic> categoryItem;

  ItemCategoriesTab(this.categoryItem);

  @override
  State<ItemCategoriesTab> createState() => _ItemCategoriesTabState();
}

class _ItemCategoriesTabState extends State<ItemCategoriesTab> {
  CategoryItem item = CategoryItem(name: "", categories: []);
  @override
  void initState() {
    // internes item machen
    this.item = CategoryItem.fromSnapshot(this.widget.categoryItem);
    super.initState();
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
      body: GridView.builder(
          itemCount: item.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75 / 0.5,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
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
                                  scale:
                                      Tween<double>(begin: 0.1, end: 1).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.decelerate,
                                    ),
                                  ),
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return Container();
                                // ShopCategoryOverviewTab(
                                //   // this.item.name,
                                //     this.item.categories[index],);
                              },
                            ),
                          );
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    margin: EdgeInsets.only(
                      left: AppVariables.paddingHeight,
                      right: AppVariables.paddingHeight,
                    ),
                    decoration: BoxDecoration(
                      // Hintergrund der Kategorie-Cards
                      image: DecorationImage(
                        image: AssetImage(
                          "lib/assets/images/catBackground.png",
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        // Bild der Kategorie
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width * 0.02,
                          child: Container(
                            child: Image(
                              alignment: Alignment.topLeft,
                              image: AssetImage(
                                "lib/assets/images/cards.png",
                              ),
                              width: MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                        ),
                        // Name der Kategorie
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(bottom: 15),
                          margin:
                              EdgeInsets.only(left: AppVariables.paddingHeight),
                          child: Text(
                            item.categories[index],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

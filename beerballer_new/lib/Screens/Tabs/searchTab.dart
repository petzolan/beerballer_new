import 'package:beerballer_new/Widgets/SearchResult/SearchResultCard.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/searchGameBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  SearchTab();

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  Stream<QuerySnapshot<Object?>>? searching;
  bool searchingForGame = false;
  final controller = ScrollController();

  @override
  void initState() {
    searching = DatabaseService.instance.getGameCollection();
    super.initState();
  }

  void callback(
    Stream<QuerySnapshot<Map<String, dynamic>>> docs,
  ) {
    setState(() {
      this.searching = docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SearchGameBar(callback),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: this.searching,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  CircularProgressIndicator();
                } else {
                  final games = snapshot.data!.docs;
                  List<SearchResultCard> searchWidgets = [];
                  for (var game in games) {
                    SearchResultCard gameObject = SearchResultCard(game);
                    searchWidgets.add(gameObject);
                  }
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 2.0,
                    children: searchWidgets,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

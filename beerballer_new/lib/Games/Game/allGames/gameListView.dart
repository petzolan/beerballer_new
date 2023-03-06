import 'package:beerballer_new/Games/Game/allGames/gameCard.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/CategoryList/categoryList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameListView extends StatefulWidget {
  Stream<QuerySnapshot<Object?>>? streamCategories;
  Stream<QuerySnapshot<Object?>>? streamGames;
  // For Categories to change Cards
  String currentCallback = "Alle Spiele";
  // To still have selected Category after stuff changes

  final DatabaseService dataService;

  GameListView(
    this.dataService,
  );

  @override
  _GameListViewState createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  ScrollController _controller = new ScrollController(initialScrollOffset: 1);
  late QuerySnapshot collectionState;
  List<Game> listDocument = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // this.widget.streamGames = this.widget.dataService.getGameCollection();
    getDocuments();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0)
          print('ListView scroll at top');
        else {
          print('ListView scroll at bottom');
          getDocumentsNext(); // Load next documents
        }
      }
    });
  }

  // changes the gamecards
  void callback(String categoryName) {
    setState(
      () => {
        print(this.widget.currentCallback),
        this.widget.currentCallback = categoryName,
        getDocuments(),
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    // get all games
    this.widget.streamCategories =
        this.widget.dataService.getStreamGameCategories();


    // get all games
    switch (this.widget.currentCallback) {
      case ("Alle Spiele"):
        this.widget.streamGames = this.widget.dataService.getGameCollection();
        break;
      case ("Neuste Spiele"):
        this.widget.streamGames = this.widget.dataService.getNewestGames();
        break;
      case ("Beliebteste Spiele"):
        this.widget.streamGames = this.widget.dataService.getBestGames();
        break;
      default:
        break;
    }
    return SafeArea(
      child: Column(
        children: [
          // TODO: Center category on click
          CategoryList(
            this.callback,
            []
          ),
          // Demententsprechende Spiele
          // StreamBuilder(
          //   stream: this.widget.streamGames,
          //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }

          // return
          createGameCards(
              // snapshot.data!.docs,
              // );
              // },
              )
        ],
      ),
    );
  }

  Widget createGameCards(
      // List<DocumentSnapshot>? snapshot
      ) {
    return listDocument.length != 0
        ? Stack(
            children: [
              RefreshIndicator(
                onRefresh: getDocuments,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                backgroundColor: Colors.black,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.01,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.01,
                      // width / height: fixed for *all* items
                      childAspectRatio:
                          MediaQuery.of(context).size.aspectRatio / 0.8,
                    ),
                    controller: _controller,
                    itemBuilder: (context, i) => GameCard(
                      listDocument[i],
                      MediaQuery.of(context).size.height * 0.175,
                      true,
                    ),
                    itemCount: listDocument.length,
                  ),
                ),
              ),
              _isLoading ? CircularProgressIndicator() : Container(),
            ],
          )
        : CircularProgressIndicator();
  }

  // get first Documents
  Future<void> getDocuments() async {
    listDocument = [];
    var collection;
    switch (this.widget.currentCallback) {
      // alle Spiele
      case ("Alle Spiele"):
        collection =
            FirebaseFirestore.instance.collection('game_collection').limit(20);
        break;
      // Neuste Spiele
      case ("Neuste Spiele"):
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .where("tags", arrayContains: "new")
            .limit(8);
        break;
      // Beliebteste Spiele
      case ("Beliebteste Spiele"):
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .orderBy("amount_liked", descending: true)
            .limit(8);
        break;
      default:
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .where("game_category", isEqualTo: this.widget.currentCallback)
            .orderBy("amount_liked", descending: true)
            .limit(8);
        break;
    }
    print('getDocuments');
    fetchDocuments(collection);
  }

  fetchDocuments(Query collection) {
    collection.get().then((value) {
      collectionState =
          value; // store collection state to set where to start next
      value.docs.forEach((element) {
        setState(() {
          listDocument.add(Game.fromSnapshot(element));
        });
      });
    });
  }

  // Fetch next 5 documents starting from the last document fetched earlier
  Future<void> getDocumentsNext() async {
    // Get the last visible document

    var lastVisible = collectionState.docs[collectionState.docs.length - 1];
    print('listDocument legnth: ${collectionState.size} last: $lastVisible');

    var collection;
    switch (this.widget.currentCallback) {
      // alle Spiele
      case ("Alle Spiele"):
        collection = FirebaseFirestore.instance
            .collection('game_collection')
            .startAfterDocument(lastVisible)
            .limit(8);
        break;
      // Neuste Spiele
      case ("Neuste Spiele"):
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .where("tags", arrayContains: "new")
            .startAfterDocument(lastVisible)
            .limit(8);
        break;
      // Beliebteste Spiele
      case ("Beliebteste Spiele"):
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .orderBy("amount_liked", descending: true)
            .startAfterDocument(lastVisible)
            .limit(8);
        break;
      default:
        collection = FirebaseFirestore.instance
            .collection("game_collection")
            .where("game_category", isEqualTo: this.widget.currentCallback)
            .orderBy("amount_liked", descending: true)
            .startAfterDocument(lastVisible)
            .limit(8);
        break;
    }

    fetchDocuments(collection);
  }
}

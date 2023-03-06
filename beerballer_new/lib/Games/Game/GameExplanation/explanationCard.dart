import 'package:beerballer_new/Games/Game/inAppGames/flachwitzChallenge.dart';
import 'package:beerballer_new/Games/Game/inAppGames/guessingGame.dart';
import 'package:beerballer_new/Games/Game/inAppGames/ichHabNochNieGame.dart';
import 'package:beerballer_new/Games/Game/inAppGames/piccolo/addPlayersScreen.dart';
import 'package:beerballer_new/Games/Game/inAppGames/truthOrDareGame.dart';
import 'package:beerballer_new/Games/Game/inAppGames/whoWouldGame.dart';
import 'package:beerballer_new/Widgets/GameCollection/addNewGameCollection.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Models/firestoreModels/shopItem.dart';
import 'package:beerballer_new/Screens/shop/shopExplanationCard.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/gameFavoriteButton.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:beerballer_new/Widgets/textWithDivider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../Widgets/VideoPlayer/videoPlayerFullScreenWidget.dart';

class ExplanationCard extends StatefulWidget {
  Game game;

  ExplanationCard(this.game);

  @override
  _ExplanationCardState createState() => _ExplanationCardState();
}

class _ExplanationCardState extends State<ExplanationCard> {
  List<Widget> cuttedMat = [];
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  bool youtubeLink = false;
  late VideoPlayerController controller;
  final videoURL = "https://www.youtube.com/watch?v=qFJuwq7ridg";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    youtubeLink = _checkIfYoutubeVideoExists();
    if (this.widget.game.tags.any((element) => element.startsWith("yt*"))) {
      print(this
          .widget
          .game
          .tags
          .firstWhere((element) => element.startsWith("yt*")).split("*")[1]);
      final videoID = YoutubePlayer.convertUrlToId(this
          .widget
          .game
          .tags
          .firstWhere((element) => element.startsWith("yt*"))
          .split("*")[1]);

      _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            disableDragSeek: true,
            loop: true,
            enableCaption: false),
      );
    }

    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset(this
            .widget
            .game
            .tags
            .where((element) => element.contains("yt*"))
            .isNotEmpty
        ? this
            .widget
            .game
            .tags
            .where((element) => element.contains("yt*"))
            .first
            .split("yt*")[1]
        : "");
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });

    return controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: expl(),
    );
  }

  Widget expl() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            youtubeLink
                // Youtube video
                ? YoutubePlayer(
                    controller: _controller,
                    bottomActions: <Widget>[
                      const SizedBox(width: 14.0),
                      CurrentPosition(),
                      const SizedBox(width: 8.0),
                      RemainingDuration(),
                    ],
                    aspectRatio: 5 / 6,
                    progressIndicatorColor: Colors.white,
                    onReady: () => print('Player is ready.'),
                  )

                // Stack(children: [
                //     VideoPlayerFullScreenWidget(controller, this.widget.game),
                //     // Task leiste oben
                //   ])
                // Oder Bild 9.3 14.45
                : Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      // Hintergrund Bild
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: new CachedNetworkImageProvider(
                          this.widget.game.imagePath,
                        ),
                      ),
                    ),
                  ),
            // Options-Leiste
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                InkWell(
                  // Schmeckt dir
                  child: GameFavoriteButton(
                    this.widget.game,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: youtubeLink
                    ? MediaQuery.of(context).size.height * 0.5
                    : MediaQuery.of(context).size.height * 0.3,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.widget.game.gameName,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.people,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          " " + this.widget.game.playerNumber,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.timelapse,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(" " + this.widget.game.gameDuration,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    this.widget.game.materials.materialMap.length > 0
                        ? Text(
                            "Das brauchst du:",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: Column(
                        children: [
                          _buildMaterials(),
                          SizedBox(
                            height: 10,
                          ),
                          _openGameView(
                            this.widget.game.gameCategory,
                            this.widget.game.gameName,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    TextWithDivider("So funktioniert's", 0.9),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: this.widget.game.explanations.length,
                        itemBuilder: (_, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Text(
                                    (index + 1).toString(),
                                  ),
                                  backgroundColor: AppVariables.darkAccent,
                                  foregroundColor: Colors.black,
                                  radius: 15,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Text(
                                      this.widget.game.explanations[index] +
                                          "\n",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ]);
                        },
                      ),
                    ),
                    _addToSammlungButton(context),
                    // TextWithDivider("Dir gefällt die App?", 0.9),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkIfYoutubeVideoExists() {
    String youtubeTag = "yt*";

    return this
        .widget
        .game
        .tags
        .any((element) => element.startsWith(youtubeTag));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  _openGameView(String category, String name) {
    if (category == "In-App Spiele") {
      return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => _getRightGame(name),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 40, right: 40),
          primary: AppVariables.buttonColor,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Spiel starten",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  _addToSammlungButton(context) {
    return ElevatedButton(
      onPressed: () {
        _showAddDialouge(context);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 20, right: 20),
        primary: AppVariables.buttonColor,
        shape: StadiumBorder(),
      ),
      child: Text(
        "Zu einer Sammlung hinzufügen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  void _showAddDialouge(context) {
    final _formKey = GlobalKey<FormState>();
    List<String> _selectedItems = [];
    print(this.widget.game.referenceId!);
    setState(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                  backgroundColor: AppVariables.backgroundGrey,
                  title: Text(
                    'Wähle Sammlungen aus',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  content: Wrap(alignment: WrapAlignment.center, children: [
                    StreamBuilder(
                        stream: DatabaseService.instance.getUserCollections(),
                        builder: (BuildContextcontext,
                            AsyncSnapshot<
                                    DocumentSnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text("Lädt ..."),
                            );
                          }
                          List<String> keys = snapshot.data!
                              .get("user_collections")
                              .keys
                              .toList();
                          keys.remove("Gefällt dir");
                          return keys.length > 0
                              ? ListBody(
                                  children: keys
                                      .map((e) => CheckboxListTile(
                                          value: _selectedItems.contains(e),
                                          title: Text(e),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (isChecked) {
                                            setState(() {
                                              isChecked!
                                                  ? _selectedItems.add(e)
                                                  : _selectedItems.remove(e);
                                              ;
                                            });
                                          }))
                                      .toList(),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Du hast noch keine Sammlungen.\nFüge hier eine neue Sammlung hinzu!",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AddNewGameCollection()
                                  ],
                                );
                        }),
                  ]),
                  actions: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Abbrechen',
                        style: TextStyle(),
                      ),
                      onTap: () {
                        // Hier passiert etwas anderes
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                        child: Text(
                          'Bestätigen',
                          style: TextStyle(color: AppVariables.buttonColor),
                        ),
                        onTap: () {
                          // Hier passiert etwas anderes
                          setState(() {
                            DatabaseService.instance.addGameToCollections(
                              _selectedItems,
                              this.widget.game.gameName,
                            );
                          });
                          Navigator.of(context).pop();
                        })
                  ]);
            });
          });
    });
  }

  _getRightGame(String gameName) {
    switch (gameName) {
      case "Schätzen":
        return GuessingGame();
      case "Wahrheit oder Pflicht":
        return TruthOrDareGame();
      case "Würdest du eher":
        return WhoWouldGame();
      case "Flachwitz Challenge":
        return FlachwitzChallenge();
      case "Ich hab noch nie":
        return IchHabNochNieGame();
      case "Trinkolo":
        return AddPlayersScreen();
    }
  }

  bool _checkIfLinkInTags() {
    for (String string in this.widget.game.tags) {
      if (string.startsWith("https://beerballer.com")) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  _launchURL(String weblink) async {
    if (await canLaunch(weblink)) {
      await launch(weblink);
    } else {
      throw 'Could not launch $weblink';
    }
  }

  getMaterial() {}
  _buildMaterials() {
    List<Widget> widgets = [];
    this.widget.game.materials.materialMap.forEach(
          (key, value) => {
            widgets.add(
              value != ""
                  ? GestureDetector(
                      onTap: () => Navigator.push(
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
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return StreamBuilder<Object>(
                                stream: DatabaseService.instance
                                    .getShopItem(value.replaceAll(' ', '')),
                                builder: (context, AsyncSnapshot snapshot) {
                                  return ShopExplanationCard(
                                      ShopItem.fromSnapshot(snapshot.data!));
                                });
                          },
                        ),
                      ),
                      // _launchURL(value),
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppVariables.buttonColor),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 12,
                              color: AppVariables.buttonColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              key,
                              style: TextStyle(
                                color: AppVariables.buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : new Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(key),
                    ),
            )
          },
        );
    return Row(
      children: widgets,
    );
  }
}

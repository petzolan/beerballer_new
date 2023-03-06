import 'package:beerballer_new/Games/Game/GameExplanation/explanationCard.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/gameFavoriteButton.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchResultCard extends StatefulWidget {
  DocumentSnapshot<Object?> game;

  SearchResultCard(
    this.game,
  );

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<SearchResultCard> {
  @override
  Widget build(BuildContext context) {
    // get current Query Data
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final game = Game.fromSnapshot(this.widget.game);
    return GestureDetector(
      child: Container(
        // formatting card
        margin: EdgeInsets.only(
          top: queryData.size.height * 0.02,
          left: queryData.size.width * 0.03,
          right: queryData.size.width * 0.03,
          bottom: queryData.size.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            // Picture of Game and favorite Button
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createBackgroundPic(game),
                SizedBox(
                  height: 5,
                ),
                // Details of Game
                createNameAndDetails(game),

                // Like functinallity and explaination card
                // createCardOptions(game),
              ],
            )
          ],
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (_) => ExplanationCard(game),
      ),
    );
  }

  // Picture of Game and favorite Button
  createBackgroundPic(Game game) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: game.imagePath,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
          ),
        ),

        // Favorite-Button
        GameFavoriteButton(game),
        game.tags.contains("in_app")
            ? Positioned(
                bottom: 6.0,
                left: 6.0,
                child: Container(
                  color: AppVariables.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Spiele in der App!",
                    style: TextStyle(
                      fontFamily: "Caveat",
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  // Details of Game
  createNameAndDetails(Game game) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ), // Name der Spiele
        Center(
          child: FittedBox(
            child: Text(
              game.gameName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).textScaleFactor * 20,
                  fontFamily: "Caveat"),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: FittedBox(
            child: Text(
              game.gameCategory.replaceAll("spiele", "spiel"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:beerballer_new/Games/Game/GameExplanation/explanationCard.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/gameFavoriteButton.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/likeAndDislikeButton.dart';
import 'package:beerballer_new/Widgets/GameCardWidgets/scales.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameCard extends StatefulWidget {
  // final DocumentSnapshot<Object?> game;
  final Game game;
  final double d;
  final bool needsLikeAmount;

  GameCard(
    this.game,
    this.d,
    this.needsLikeAmount,
  );

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get current Query Data
    // final game = Game.fromSnapshot(this.widget.game);
    return GestureDetector(
      child: Container(
        // formatting card
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.01,
          top: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                // Picture of Game and favorite Button
                createBackgroundPic(this.widget.game),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    // Details of Game
                    createNameAndDetails(this.widget.game),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () => {
        showDialog(
          context: context,
          builder: (_) => ExplanationCard(this.widget.game),
        ),
      },
    );
  }

  // Picture of Game and favorite Button
  createBackgroundPic(Game game) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(
          MediaQuery.of(context).size.width,
          this.widget.d,
        ),
      ),
      child: Stack(alignment: AlignmentDirectional.center, children: [
        // Bild vom Spiel
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: game.imagePath,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        // Favorite-Button
        Positioned(
          top: MediaQuery.of(context).size.height * -0.01,
          right: MediaQuery.of(context).size.height * -0.01,
          child: GameFavoriteButton(game),
        ),
        // orangener Tag
        game.tags.contains("in_app")
            ? Positioned(
                bottom: 5.0,
                left: 5.0,
                child: Container(
                  color: AppVariables.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Spiele in der App!",
                    style: TextStyle(
                      fontFamily: "Caveat",
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }

  // Details of Game
  createNameAndDetails(Game game) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.001,
        ),
        // Name der Spiele
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            game.gameName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).textScaleFactor * 20,
              fontFamily: "Caveat",
            ),
          ),
        ),
        // Details des Spiels
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.001,
              right: MediaQuery.of(context).size.width * 0.001,
              top: MediaQuery.of(context).size.height * 0.001,
              bottom: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Scales(game),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        // Likes
        this.widget.needsLikeAmount
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LikeAndDislikeButton(
                      game,
                      MediaQuery.of(context).textScaleFactor * 20,
                      true,
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}

import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

class GameFavoriteButton extends StatefulWidget {
  Game game;

  GameFavoriteButton(
    this.game,
  );
  @override
  _GameFavoriteButtonState createState() => _GameFavoriteButtonState();
}

class _GameFavoriteButtonState extends State<GameFavoriteButton> {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  List<dynamic> favOfUser = [];

  @override
  void initState() {
    super.initState();
    favOfUser = this.widget.game.favorite_of_users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection("game_collection")
                .where("game_name", isEqualTo: this.widget.game.gameName)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshotCheckLike) {
              if (!snapshotCheckLike.hasData) {
                return Container();
              } else {
                return GestureDetector(
                  child: IconShadowWidget(
                    Icon(
                      snapshotCheckLike.data.docs[0]
                              .get("likes_user_ids")
                              .contains(FirebaseAuth.instance.currentUser!.uid)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                    shadowColor: Colors.black54,
                  ),
                  onTap: () async {
                    if (snapshotCheckLike.data.docs[0]
                        .get("likes_user_ids")
                        .contains(FirebaseAuth.instance.currentUser!.uid)) {
                      DatabaseService.instance.deleteGameFromCollection(
                          "Gefällt dir", this.widget.game.gameName);
                      DatabaseService.instance
                          .removeFromLiked(this.widget.game.referenceId!);
                    } else {
                      DatabaseService.instance.addGameToCollections(
                          ["Gefällt dir"], this.widget.game.gameName);
                      DatabaseService.instance
                          .addToLiked(this.widget.game.referenceId!);
                    }
                  },
                );
              }
            }));
  }
}

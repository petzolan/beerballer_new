import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeAndDislikeButton extends StatefulWidget {
  Game game;
  bool needsText;
  double widgetSize;
  LikeAndDislikeButton(this.game, this.widgetSize, this.needsText);
  _LikeAndDislikeButtonState createState() => _LikeAndDislikeButtonState();
}

class _LikeAndDislikeButtonState extends State<LikeAndDislikeButton> {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  List<dynamic> userIdsWhichLiked = [];
  List<dynamic> userIdsWhichDisliked = [];
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      userIdsWhichLiked = this.widget.game.likes_user_ids;
      userIdsWhichDisliked = this.widget.game.dislikes_user_ids;
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        this.widget.needsText ? createLikeText() : Container(),
        SizedBox(
          width: 5,
        ),
        createLikeButton(),
      ],
    );
  }

  createLikeText() {
    return Text(
      "Gefällt " +
          this.widget.game.likes_user_ids.length.toString() +
          (this.widget.game.likes_user_ids.length.toString() == "1"
              ? " Person"
              : " Personen"),
      style: TextStyle(
        fontSize: 11,
        color: Colors.black,
      ),
    );
  }

  createLikeButton() {
    return GestureDetector(
        child: Container(
          width: this.widget.widgetSize,
          child: Image.asset(
            this.widget.game.likes_user_ids.contains(
                      FirebaseAuth.instance.currentUser!.uid,
                    )
                ? 'lib/assets/images/likeVoll.png'
                : 'lib/assets/images/likeLeer.png',
            height: this.widget.widgetSize,
          ),
        ),
        onTap: () async {
          if (this.widget.game.likes_user_ids.contains(currentUserId)) {
            this.widget.game.likes_user_ids.remove(currentUserId);
          } else if (this
              .widget
              .game
              .dislikes_user_ids
              .contains(currentUserId)) {
            this.widget.game.dislikes_user_ids.remove(currentUserId);
            this.widget.game.likes_user_ids.add(currentUserId);
          } else {
            this.widget.game.likes_user_ids.add(currentUserId);
          }
          this.userIdsWhichLiked = this.widget.game.likes_user_ids;
          this.widget.game.amountLiked = this.userIdsWhichLiked.length;
          await DatabaseService.instance.updateGameJson(this.widget.game);
          setState(
            () {},
          );
        });
  }

  // createDislikeText() {
  //   return Text(
  //     this.widget.game.dislikes_user_ids.length.toString(),
  //     style: TextStyle(
  //       fontSize: 11,
  //     ),
  //   );
  // }

  // createDislikeButton() {
  //   return GestureDetector(
  //       child: Container(
  //         width: 50,
  //         child: Icon(
  //           this.widget.game.dislikes_user_ids.contains(
  //                     FirebaseAuth.instance.currentUser!.uid,
  //                   )
  //               ? Icons.thumb_down_alt
  //               : Icons.thumb_down_alt_outlined,
  //           size: this.widget.iconWidth,
  //         ),
  //       ),
  //       onTap: () async {
  //         if (this.widget.game.dislikes_user_ids.contains(currentUserId)) {
  //           this.widget.game.dislikes_user_ids.remove(currentUserId);
  //         } else if (this.widget.game.likes_user_ids.contains(currentUserId)) {
  //           this.widget.game.likes_user_ids.remove(currentUserId);
  //           this.widget.game.dislikes_user_ids.add(currentUserId);
  //         } else {
  //           this.widget.game.dislikes_user_ids.add(currentUserId);
  //         }

  //         await this.widget.dataService.updateGameJson(this.widget.game);
  //         setState(
  //           () {
  //             this.userIdsWhichDisliked = this.widget.game.likes_user_ids;
  //           },
  //         );
  //       });
  // }
}

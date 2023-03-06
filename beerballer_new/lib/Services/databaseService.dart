import 'package:beerballer_new/Models/firestoreModels/currentUser.dart';
import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/popUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../Models/currentUserModel.dart';

// Thit Service provides all Data of the Firestore-Database
// updates for ListViews can only be triggered from here!!
class DatabaseService {
  DatabaseService._();
  static DatabaseService _instance = DatabaseService._();
  static DatabaseService get instance => _instance;
  // _U_S_E_R_____________________________________________________________________________________________

  // get user collection
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection("users");
      
// get the shop game items and safe them locally
  final CollectionReference _eventItems =
      FirebaseFirestore.instance.collection("event_items");
  // get all users
  Stream<QuerySnapshot<Object?>>? getAllUsers() {
    return _usersCollectionRef.snapshots();
  }

  // userCollectionReference
  CollectionReference getUserCollectionAsCollectionReference() {
    return _usersCollectionRef;
  }

// delete from user_collections
  void deleteFromUserCollections(String keyName) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "user_collections": {keyName: FieldValue.delete()}
    }, SetOptions(merge: true));
  }

  // add to user_collections
  void addToUserCollections(String keyName) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "user_collections": {keyName: []}
    }, SetOptions(merge: true));
  }

  void addUserToSeen() async {
    await FirebaseFirestore.instance
        .collection("users_already_seen_alert")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"seen": true});
  }

// get user user_collections
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserCollections() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  getUserSeenTutorial(BuildContext context, Function show) async {
    var doc = await FirebaseFirestore.instance
        .collection("users_already_seen_tutorial")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (doc.exists) {
      Consumer<CurrentUserModel>(builder: ((context, value, child) {
        bool getUser = false;
        while (!getUser) {
          value.getCurrentUser();
          getUser = true;
          print("finished");
        }
        return Container();
      }));
      showAlert(context);
      return true;
    } else {
      show();
      FirebaseFirestore.instance
          .collection("users_already_seen_tutorial")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
        {
          'user_id': FirebaseAuth.instance.currentUser!.uid,
        },
      );
      return false;
    }
  }

  // alert am anfang (nicht zu viel trinken etc.)
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => PopUp(),
    );
  }

  Future changeUserName(
    String username,
  ) async {
    return await _usersCollectionRef
        .doc(
      FirebaseAuth.instance.currentUser!.uid,
    )
        .update(
      {
        'user_name': username,
      },
    );
  }

  // change Password
  Future changePassword(
    String password,
  ) async {
    return await FirebaseAuth.instance.currentUser!.updatePassword(password);
  }

  // Delete Whole account
  Future deleteAccount(BuildContext context) async {
    await _usersCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete();
    FirebaseAuth.instance.currentUser!.delete();
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    return Future;
  }

  // creates User in Database
  Future updateUserData(
    String uid,
    String email,
    // String username,
    // String userAvatar,
    Map<String, List<String>> collections,
  ) async {
    return await _usersCollectionRef
        .doc(
      uid,
    )
        .set(
      {
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'email': email,
        // 'user_avatar': userAvatar,
        // 'user_name': username,
        'user_collections': collections,
      },
    );
  }

  // creates User in Database
  Future updateUserDataJson(Map<String, dynamic> toJson) async {
    return await _usersCollectionRef
        .doc(
          toJson["user_id"],
        )
        .update(toJson);
  }

  // _G_A_M_E_S___________________________________________________________________________________________
  // GET ALL GAME DATA
  // game collection
  final CollectionReference gameCollectionReference =
      FirebaseFirestore.instance.collection("game_collection");

  // game categories
  final CollectionReference gameCategoriesReference =
      FirebaseFirestore.instance.collection("game_categories");

  // get all game categories
  Stream<QuerySnapshot> getStreamGameCategories() {
    return gameCategoriesReference.snapshots();
  }

  // return games by selected game_category
  Stream<QuerySnapshot<Map<String, dynamic>>>? getGamesByCategoryName(
    String pCategoryName,
  ) {
    return pCategoryName == "Alle Spiele"
        ? gameCollectionReference
            .where("amount_liked", isGreaterThanOrEqualTo: 0)
            .orderBy("amount_liked", descending: true)
            .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>?
        : gameCollectionReference
            .where("game_category", isEqualTo: pCategoryName)
            .orderBy("amount_liked", descending: true)
            .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>?;
  }

  final CollectionReference _gameCategoriesRef =
      FirebaseFirestore.instance.collection("game_categories");

  // get categoriesRef

  // return the game_categories as stream
  Stream<QuerySnapshot<Object?>>? getGameCategories() {
    return _gameCategoriesRef.snapshots();
  }

  // get the game_collection and safe it locally
  final CollectionReference _gameCollectionRef =
      FirebaseFirestore.instance.collection("game_collection");

  // return the game_collection as stream
  Stream<QuerySnapshot<Object?>>? getGameCollection() {
    return _gameCollectionRef.snapshots();
  }

  // return all favorite games of user
  Stream<QuerySnapshot<Object?>> getFavoriteGames() {
    return _gameCollectionRef
        .where("likes_user_ids",
            arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  // return favorite games as List
  List<String> getListOfFavoriteGamesOfUser() {
    List<String> games = [];
    Stream<QuerySnapshot<Object?>> liked = getFavoriteGames();
    liked.forEach((element) {
      element.docs.forEach((element) {
        games.add(element.id);
      });
    });

    return games;
  }

  // return the games with "new" in tags
  Stream<QuerySnapshot<Object?>>? getNewestGames() {
    return _gameCollectionRef.where("tags", arrayContains: "new").snapshots();
  }

  // update game
  Future updateGameJson(Game game) async {
    print("trying to like");

    try {
      await _gameCollectionRef.doc(game.referenceId).update(game.toJson());
      print("did like");
    } catch (e) {
      print(e);
    }
  }

  // get top  games with most sorted by likes likes
  Stream<QuerySnapshot<Object?>> getBestGames() {
    return _gameCollectionRef
        .orderBy("amount_liked", descending: true)
        .snapshots();
  }

  addToLiked(String pGameID) async {
    List<dynamic> toAdd = [FirebaseAuth.instance.currentUser!.uid];
    await FirebaseFirestore.instance
        .collection('game_collection')
        .doc(pGameID)
        .update(
      {
        "likes_user_ids": FieldValue.arrayUnion(toAdd),
      },
    ).then(
      (value) => FirebaseFirestore.instance
          .collection('game_collection')
          .doc(pGameID)
          .update(
        {
          "amount_liked": FieldValue.increment(1),
        },
      ),
    );
  }

  decreaseAmountLiked(String pGameID) async {
    await FirebaseFirestore.instance
        .collection('game_collection')
        .doc(pGameID)
        .update(
      {
        "amount_liked": FieldValue.increment(-1),
      },
    );
  }

  // remove game from liked games
  removeFromLiked(String pGameID) async {
    List<dynamic> toRemove = [FirebaseAuth.instance.currentUser!.uid];
    await FirebaseFirestore.instance
        .collection('game_collection')
        .doc(pGameID)
        .update(
      {
        "likes_user_ids": FieldValue.arrayRemove(toRemove),
      },
    );
    decreaseAmountLiked(pGameID);
  }

  // Create a new Sammlung of games for the current User
  CurrUser createSammlung(String pSammlungKey, CurrUser pCurrUser) {
    print("Trying to create Sammlung: " + pSammlungKey);
    pCurrUser.collections.collectionMap[pSammlungKey] = [];
    CurrUser temp = pCurrUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(pCurrUser.user_id)
        .update(
          pCurrUser.toJson(),
        );
    return temp;
  }

// COLLECTIONS
  void addGameToCollections(List<String> selectedCategories, String gameID) {
    for (String s in selectedCategories) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "user_collections": {
          s: FieldValue.arrayUnion([gameID])
        }
      }, SetOptions(merge: true));
    }
  }

  void deleteGameFromCollection(String selectedCategories, String gameID) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "user_collections": {
        selectedCategories: FieldValue.arrayRemove([gameID])
      }
    }, SetOptions(merge: true));
  }

  CurrUser deleteSammlung(String pSammlungKey, CurrUser pCurrUser) {
    print("Trying to delete Sammlung: " + pSammlungKey);
    pCurrUser.collections.collectionMap.remove(pSammlungKey);
    CurrUser temp = pCurrUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(pCurrUser.user_id)
        .update(
          pCurrUser.toJson(),
        );
    return temp;
  }

  Stream<QuerySnapshot<Object?>> getShopCategoriesOverview() {
    return FirebaseFirestore.instance.collection("shop_categories").snapshots();
  }

// get the shop items and safe them locally
  final Query _shopItemsRef =
      FirebaseFirestore.instance.collection("shop_items");

// get single shop item
  Stream<DocumentSnapshot<Map<String, dynamic>>> getShopItem(String itemName) {
    return FirebaseFirestore.instance
        .collection("shop_items")
        .doc(itemName)
        .snapshots();
  }



  // return shopitems by selected shop category
  Stream<QuerySnapshot<Map<String, dynamic>>>? getItemsForCat(
      String pCategoryName, String pCategory) {
    switch (pCategory) {
      case "Events":
        return _eventItems
            .where("category", isEqualTo: pCategoryName)
            .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>?;
      default:
        return _shopItemsRef
            .where("category", isEqualTo: pCategoryName)
            .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>?;
    }
  }

  // return shopitems by selected shop category
  Stream<QuerySnapshot<Map<String, dynamic>>>? getBestseller() {
    return FirebaseFirestore.instance
        .collection("shop_items")
        .where("tag", arrayContains: "bestseller")
        .snapshots();
  }
}

// _S_H_O_P_____________________________________________________________________________________________
